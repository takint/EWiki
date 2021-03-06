USE [master]
GO
/****** Object:  Database [EWiki]    Script Date: 10/3/2016 1:56:42 AM ******/
CREATE DATABASE [EWiki]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EWiki', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\EWiki.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EWiki_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\EWiki_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EWiki] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EWiki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EWiki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EWiki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EWiki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EWiki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EWiki] SET ARITHABORT OFF 
GO
ALTER DATABASE [EWiki] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EWiki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EWiki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EWiki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EWiki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EWiki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EWiki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EWiki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EWiki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EWiki] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EWiki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EWiki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EWiki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EWiki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EWiki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EWiki] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EWiki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EWiki] SET RECOVERY FULL 
GO
ALTER DATABASE [EWiki] SET  MULTI_USER 
GO
ALTER DATABASE [EWiki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EWiki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EWiki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EWiki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EWiki] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EWiki', N'ON'
GO
ALTER DATABASE [EWiki] SET QUERY_STORE = OFF
GO
USE [EWiki]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EWiki]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 10/3/2016 1:56:42 AM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/3/2016 1:56:42 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BlockedIps]    Script Date: 10/3/2016 1:56:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockedIps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnonymousOnly] [bit] NOT NULL,
	[BlockByUserId] [nvarchar](450) NULL,
	[BlockCreateAccount] [bit] NOT NULL,
	[BlockExpiry] [decimal](18, 2) NOT NULL,
	[BlockReason] [nvarchar](max) NULL,
	[BlockUserEdit] [bit] NOT NULL,
	[BlockedIpId] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[IpRangeEnd] [nvarchar](max) NULL,
	[IpRangeStart] [nvarchar](max) NULL,
	[ParentBlock] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[UserBlockedId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BlockedIps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatPages] [int] NULL,
	[CatTitle] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[NumberOfSubcat] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[CatTitleVI] [nvarchar](max) NULL,
	[CatImageId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterInfoGroups]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterInfoGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Name] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_CharacterInfoGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterInfos]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterInfos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CharacterInfoGroupId] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[IsMain] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_CharacterInfos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Characters]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Attack] [int] NOT NULL,
	[CPGain] [real] NOT NULL,
	[Candy] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Defense] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[EvolveFromId] [int] NOT NULL,
	[Height] [real] NOT NULL,
	[MaxCP] [real] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Number] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[Species] [nvarchar](max) NULL,
	[Stamina] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[Weight] [real] NOT NULL,
	[EvolveIntos] [nvarchar](max) NULL,
	[AvatarImageId] [int] NULL,
	[EvolveFroms] [nvarchar](max) NULL,
	[InfoContentId] [int] NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterSectionGroups]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterSectionGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Name] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_CharacterSectionGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterSections]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterSections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[CharacterSectionGroupId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Description] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_CharacterSections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoValues]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CharacterInfoId] [int] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[LinkTo] [int] NOT NULL,
	[LinkToId] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[UrlFormat] [nvarchar](max) NULL,
 CONSTRAINT [PK_InfoValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[LocationType] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Moves]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moves](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cooldown] [real] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[CritChange] [real] NOT NULL,
	[DPS] [real] NOT NULL,
	[Energy] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Power] [real] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[WithSTAB] [real] NOT NULL,
	[MoveCategoryId] [int] NULL,
	[MoveType] [int] NULL,
 CONSTRAINT [PK_Moves] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageContents]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentFlags] [ntext] NULL,
	[ContentText] [ntext] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_PageContents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageLangs]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageLangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Language] [nvarchar](max) NULL,
	[PageId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_PageLangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageMetas]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageMetas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaValue] [nvarchar](max) NULL,
	[PageId] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_PageMetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageRestrictions]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[IsCascade] [bit] NOT NULL,
	[PageRestrictedId] [int] NOT NULL,
	[ResLevel] [int] NOT NULL,
	[ResType] [int] NOT NULL,
	[ResctrictionExpiry] [decimal](18, 2) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[PageId] [int] NULL,
 CONSTRAINT [PK_PageRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContentLanguage] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[IsNewPage] [bit] NOT NULL,
	[TagId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[FeatureImageId] [int] NULL,
	[NewestContent] [int] NULL,
	[ContentObjectId] [int] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PokemonLocation]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PokemonLocation](
	[CharacterId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_PokemonLocation] PRIMARY KEY CLUSTERED 
(
	[CharacterId] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PokemonMove]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PokemonMove](
	[CharacterId] [int] NOT NULL,
	[MoveId] [int] NOT NULL,
 CONSTRAINT [PK_PokemonMove] PRIMARY KEY CLUSTERED 
(
	[CharacterId] ASC,
	[MoveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PokemonSpecialMove]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PokemonSpecialMove](
	[CharacterId] [int] NOT NULL,
	[MoveId] [int] NOT NULL,
 CONSTRAINT [PK_PokemonSpecialMove] PRIMARY KEY CLUSTERED 
(
	[CharacterId] ASC,
	[MoveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[References]    Script Date: 10/3/2016 1:56:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[References](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Description] [nvarchar](max) NULL,
	[LinkTo] [int] NOT NULL,
	[LinkToId] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[UrlFormat] [nvarchar](max) NULL,
 CONSTRAINT [PK_References] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 10/3/2016 1:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[FullName] [nvarchar](max) NULL,
	[Level] [smallint] NOT NULL,
	[NickName] [nvarchar](max) NULL,
	[SearchCount] [int] NOT NULL,
	[ShortName] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 10/3/2016 1:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[CharacterId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[CharacterId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMetas]    Script Date: 10/3/2016 1:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMetas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaValue] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[UserId] [int] NOT NULL,
	[UserInUseId] [nvarchar](450) NULL,
 CONSTRAINT [PK_UserMetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNewtalks]    Script Date: 10/3/2016 1:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNewtalks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[UserId] [int] NOT NULL,
	[UserIp] [nvarchar](max) NULL,
	[UserLastSeen] [datetime2](7) NOT NULL,
	[UserSeenId] [nvarchar](450) NULL,
 CONSTRAINT [PK_UserNewtalks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WikiImages]    Script Date: 10/3/2016 1:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WikiImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BitDepth] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[ImageDescription] [nvarchar](max) NULL,
	[ImageHeight] [int] NOT NULL,
	[ImageMediaType] [nvarchar](max) NULL,
	[ImageMime] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[ImageSize] [int] NOT NULL,
	[ImageWidth] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_WikiImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WikiVideos]    Script Date: 10/3/2016 1:56:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WikiVideos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedUserId] [nvarchar](450) NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Picture] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedUserId] [nvarchar](450) NULL,
	[Url] [nvarchar](max) NULL,
	[VideoType] [int] NOT NULL,
 CONSTRAINT [PK_WikiVideos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160828184740_EWiki', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160904101855_EWiki', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160911100857_UpdateRelationship', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160911171833_UpdateEntity', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160911172356_UpdateForgeinKey', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160919171755_UpdateEntityRelationship', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160925145647_UpdateForImageCategory', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002090121_UpdateEvolved', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002151419_UpdateSchemaForContent', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002153457_AddCharacterToContent', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002163731_UpdateSchemaForContents', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002164008_RemoveForgeinKey', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002164300_FixedForgeinKey', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002164644_FixedForgeinKey2', N'1.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161002164932_FixedForgeinKey3', N'1.0.1')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'07fe1bca-c975-4234-ab2c-2e1449197585', N'ca598b0b-041a-442a-9926-99656315096f', N'StandardUser', N'STANDARDUSER')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'10c92da5-eed9-40ee-af5b-6b0005197c55', N'6d7146e2-8b3e-4c45-addb-122860759150', N'SysAdmin', N'SYSADMIN')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f0c108b6-2a80-42d7-bf9e-28646e08811e', N'10c92da5-eed9-40ee-af5b-6b0005197c55')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Discriminator], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'f0c108b6-2a80-42d7-bf9e-28646e08811e', 0, N'857fdefd-fa97-46a4-86e6-766cacb44754', N'User', N'sysadmin.ewiki@gmail.com', 1, 1, NULL, N'SYSADMIN.EWIKI@GMAIL.COM', N'EWIKIADMIN', N'AQAAAAEAACcQAAAAEPC4QgYbPHZddyWVZwCiX9fm+6zUahjgok1CWW2gy0EE/CnxtOisxVt7rfhJk6gp7Q==', NULL, 0, N'647e7b58-fea6-4407-ab7b-57aec924dbf7', 0, N'EwikiAdmin')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (20, 1, N'Normal', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Thường', 200)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (21, 1, N'Fire', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Lửa', 194)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (22, 1, N'Water', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Nước', 206)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (23, 1, N'Electric', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Điện', 193)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (24, 1, N'Grass', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Cỏ', 199)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (25, 1, N'Ice', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Băng', 201)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (26, 1, N'Fighting', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Giác Đấu', 195)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (27, 1, N'Poison', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Độc', 202)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (28, 1, N'Ground', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Đất', 198)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (29, 1, N'Flying', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Bay', 197)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (30, 1, N'Psychic', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Tâm Linh', 203)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (31, 1, N'Bug', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Bọ', 189)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (32, 1, N'Rock', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Đá', 204)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (33, 1, N'Ghost', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Ma', 196)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (34, 1, N'Dragon', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Rồng', 191)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (35, 1, N'Dark', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Bóng Tối', 190)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (36, 1, N'Steel', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Thép', 205)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (37, 1, N'Fairy', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Tiên', 192)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (38, 1, N'Fast', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Nhanh', NULL)
INSERT [dbo].[Categories] ([Id], [CatPages], [CatTitle], [CreatedDate], [CreatedUserId], [NumberOfSubcat], [UpdatedDate], [UpdatedUserId], [CatTitleVI], [CatImageId]) VALUES (39, 1, N'Charge', CAST(N'2016-09-11T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, N'Tập Kích', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1002, 164, 23.1, 0, CAST(N'2016-09-12T01:22:27.6515218' AS DateTime2), NULL, 152, N'Tangela''s vines snap off easily if they are grabbed. This happens without pain, allowing it to make a quick getaway. The lost vines are replaced by newly grown vines the very next day.', 0, 1, 1739, N'Tangela', N'#114', N'tangela', N'Vine Pokémon', 130, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 35, N'', 158, N'', 460)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1003, 190, 30.2, 0, CAST(N'2016-09-12T01:22:27.6145289' AS DateTime2), NULL, 198, N'Weezing loves the gases given off by rotted kitchen garbage. This Pokémon will find a dirty, unkempt house and make it its home. At night, when the people in the house are asleep, it will go through the trash.', 1062, 1.2, 2250, N'Weezing', N'#110', N'weezing', N'Poison Gas Pokémon', 130, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 9.5, N'', 161, N'#109', 444)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1004, 156, 22.4, 0, CAST(N'2016-09-12T01:22:27.8110481' AS DateTime2), NULL, 158, N'Porygon is capable of reverting itself entirely back to program data and entering cyberspace. This Pokémon is copy-protected so it cannot be duplicated by copying.', 0, 0.8, 1691, N'Porygon', N'#137', N'porygon', N'Virtual Pokémon', 130, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 36.5, N'', 134, N'', 552)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1005, 232, 40.1, 0, CAST(N'2016-09-12T01:22:27.5464702' AS DateTime2), NULL, 164, N'Exeggutor originally came from the tropics. Its heads steadily grow larger from exposure to strong sunlight. It is said that when the heads fall off, they group together to form Exeggcute.', 1144, 2, 2955, N'Exeggutor', N'#103', N'exeggutor', N'Coconut Pokémon', 190, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 120, N'', 170, N'#102', 416)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1006, 222, 34.1, 0, CAST(N'2016-09-12T01:22:26.9963517' AS DateTime2), NULL, 152, N'Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this Pokémon swallows it whole.', 1124, 1.7, 2530, N'Victreebel', N'#071', N'victreebel', N'Flycatcher Pokémon', 160, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 15.5, N'', 106, N'#069,#070', 288)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1007, 220, 44.9, 0, CAST(N'2016-09-12T01:22:27.9019161' AS DateTime2), NULL, 220, N'Mew is said to possess the genetic composition of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people.', 0, 0.4, 3299, N'Mew', N'#151', N'mew', N'New Species Pokémon', 200, CAST(N'2016-10-03T01:37:51.1075913' AS DateTime2), NULL, 4, N'', 121, N'', 608)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1008, 202, 33.6, 0, CAST(N'2016-09-12T01:22:26.8008934' AS DateTime2), NULL, 190, N'Vileplume''s toxic pollen triggers atrocious allergy attacks. That''s why it is advisable never to approach any attractive flowers in a jungle, however pretty they may be.', 1105, 1.2, 2492, N'Vileplume', N'#045', N'vileplume', N'Flower Pokémon', 150, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 18.6, N'', 78, N'#043,#044', 184)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1009, 242, 44.1, 0, CAST(N'2016-09-12T01:22:27.8678907' AS DateTime2), NULL, 194, N'Moltres is a legendary bird Pokémon that has the ability to control fire. If this Pokémon is injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself.', 0, 2, 3240, N'Moltres', N'#146', N'moltres', N'Flame Pokémon', 180, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 60, N'', 125, N'', 588)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1010, 148, 14.2, 50, CAST(N'2016-09-12T01:22:27.8315828' AS DateTime2), NULL, 142, N'Kabuto is a Pokémon that has been regenerated from a fossil. However, in extremely rare cases, living examples have been discovered. The Pokémon has not changed at all for 300 million years.', 0, 0.5, 1104, N'Kabuto', N'#140', N'kabuto', N'Shellfish Pokémon', 60, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 11.5, N'#141', 130, N'', 564)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1011, 168, 20, 50, CAST(N'2016-09-12T01:22:27.0458001' AS DateTime2), NULL, 138, N'Ponyta is very weak at birth. It can barely stand up. This Pokémon becomes stronger by stumbling and falling to keep up with its parent.', 0, 1, 1516, N'Ponyta', N'#077', N'ponyta', N'Fire Horse Pokémon', 100, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 30, N'#078', 112, N'', 312)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1012, 160, 20.5, 100, CAST(N'2016-09-12T01:22:26.4541520' AS DateTime2), NULL, 140, N'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.', 1069, 1.1, 1557, N'Charmeleon', N'#005', N'charmeleon', N'Flame Pokémon', 116, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 19, N'#006', 37, N'#004', 24)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1013, 214, 30.4, 0, CAST(N'2016-09-12T01:22:27.7492247' AS DateTime2), NULL, 158, N'In battle, Magmar blows out intensely hot flames from all over its body to intimidate its opponent. This Pokémon''s fiery bursts create heat waves that ignite grass and trees in its surroundings.', 0, 1.3, 2265, N'Magmar', N'#126', N'magmar', N'Spitfire Pokémon', 130, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 44.5, N'', 145, N'', 508)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1014, 250, 47.7, 0, CAST(N'2016-09-12T01:22:27.8869132' AS DateTime2), NULL, 212, N'Dragonite is capable of circling the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land.', 1018, 2.2, 3500, N'Dragonite', N'#149', N'dragonite', N'Dragon Pokémon', 182, CAST(N'2016-10-03T01:37:51.1075913' AS DateTime2), NULL, 210, N'', 123, N'#147,#148', 600)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1015, 164, 25.6, 0, CAST(N'2016-09-12T01:22:26.7803160' AS DateTime2), NULL, 164, N'Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.', 1103, 1.6, 1921, N'Golbat', N'#042', N'golbat', N'Bat Pokémon', 150, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 55, N'', 74, N'#041', 172)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1016, 190, 28.5, 0, CAST(N'2016-09-12T01:22:27.8385839' AS DateTime2), NULL, 190, N'Kabutops swam underwater to hunt for its prey in ancient times. The Pokémon was apparently evolving from being a water-dweller to living on land as evident from the beginnings of change in its gills and legs.', 1010, 1.3, 2130, N'Kabutops', N'#141', N'kabutops', N'Shellfish Pokémon', 120, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 40.5, N'', 131, N'#140', 568)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1017, 122, 10, 50, CAST(N'2016-09-12T01:22:27.6685267' AS DateTime2), NULL, 100, N'Horsea eats small insects and moss off of rocks. If the ocean current turns fast, this Pokémon anchors itself by wrapping its tail around rocks or coral to prevent being washed away.', 0, 0.4, 794, N'Horsea', N'#116', N'horsea', N'Dragon Pokémon', 60, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 8, N'#117', 156, N'', 468)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1018, 170, 23.2, 100, CAST(N'2016-09-12T01:22:27.8798889' AS DateTime2), NULL, 152, N'Dragonair stores an enormous amount of energy inside its body. It is said to alter weather conditions in its vicinity by discharging energy from its crystals on its neck and tail.', 1031, 4, 1747, N'Dragonair', N'#148', N'dragonair', N'Dragon Pokémon', 122, CAST(N'2016-10-03T01:37:51.1075913' AS DateTime2), NULL, 16.5, N'#149', 122, N'#147', 596)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1019, 180, 30, 0, CAST(N'2016-09-12T01:22:27.8255961' AS DateTime2), NULL, 202, N'Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large and heavy, causing its movements to become too slow and ponderous.', 1065, 1, 2233, N'Omastar', N'#139', N'omastar', N'Spiral Pokémon', 140, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 35, N'', 133, N'#138', 560)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1020, 182, 29, 0, CAST(N'2016-09-12T01:22:27.8452541' AS DateTime2), NULL, 162, N'Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from genetic material extracted from amber. It is imagined to have been the king of the skies in ancient times.', 0, 1.8, 2165, N'Aerodactyl', N'#142', N'aerodactyl', N'Fossil Pokémon', 160, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 59, N'', 128, N'', 572)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1021, 198, 40.4, 0, CAST(N'2016-09-12T01:22:27.8572344' AS DateTime2), NULL, 242, N'Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall.', 0, 1.7, 2978, N'Articuno', N'#144', N'articuno', N'Freeze Pokémon', 180, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 55.4, N'', 127, N'', 580)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1022, 184, 28.4, 0, CAST(N'2016-09-12T01:22:27.7552251' AS DateTime2), NULL, 186, N'Pinsir is astoundingly strong. It can grip a foe weighing twice its weight in its horns and easily lift it. This Pokémon''s movements turn sluggish in cold places.', 0, 1.5, 2121, N'Pinsir', N'#127', N'pinsir', N'Stag Beetle Pokémon', 130, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 55, N'', 144, N'', 512)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1023, 172, 25.2, 0, CAST(N'2016-09-12T01:22:26.8269590' AS DateTime2), NULL, 154, N'Venomoth is nocturnal—it is a Pokémon that only becomes active at night. Its favorite prey are small insects that gather around streetlights, attracted by the light in the darkness.', 1107, 1.5, 1890, N'Venomoth', N'#049', N'venomoth', N'Poison Moth Pokémon', 140, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 12.5, N'', 83, N'#048', 200)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1024, 110, 11.8, 0, CAST(N'2016-09-12T01:22:27.7830632' AS DateTime2), NULL, 110, N'Ditto rearranges its cell structure to transform itself into other shapes. However, if it tries to transform itself into something by relying on its memory, this Pokémon manages to get details wrong.', 0, 0.3, 919, N'Ditto', N'#132', N'ditto', N'Transform Pokémon', 96, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 4, N'', 139, N'', 532)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1025, 284, 56.8, 0, CAST(N'2016-09-12T01:22:27.8924034' AS DateTime2), NULL, 202, N'Mewtwo is a Pokémon that was created by genetic manipulation. However, even though the scientific power of humans created this Pokémon''s body, they failed to endow Mewtwo with a compassionate heart.', 0, 2, 4144, N'Mewtwo', N'#150', N'mewtwo', N'Genetic Pokémon', 212, CAST(N'2016-10-03T01:37:51.1075913' AS DateTime2), NULL, 122, N'', 119, N'', 604)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1026, 176, 27.7, 0, CAST(N'2016-09-12T01:22:27.7311250' AS DateTime2), NULL, 180, N'Scyther is blindingly fast. Its blazing speed enhances the effectiveness of the twin scythes on its forearms. This Pokémon''s scythes are so effective, they can slice through thick logs in one wicked stroke.', 0, 1.5, 2073, N'Scyther', N'#123', N'scyther', N'Mantis Pokémon', 140, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 56, N'', 149, N'', 496)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1027, 106, 11.6, 50, CAST(N'2016-09-12T01:22:27.0042505' AS DateTime2), NULL, 136, N'Tentacool''s body is largely composed of water. If it is removed from the sea, it dries up like parchment. If this Pokémon happens to become dehydrated, put it back into the sea.', 0, 0.9, 905, N'Tentacool', N'#072', N'tentacool', N'Jellyfish Pokémon', 80, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 45.5, N'#073', 105, N'', 292)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1028, 172, 27.3, 0, CAST(N'2016-09-12T01:22:27.6985390' AS DateTime2), NULL, 160, N'In the autumn, Seaking males can be seen performing courtship dances in riverbeds to woo females. During this season, this Pokémon''s body coloration is at its most beautiful.', 1148, 1.3, 2043, N'Seaking', N'#119', N'seaking', N'Goldfish Pokémon', 160, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 39, N'', 152, N'#118', 480)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1029, 182, 24.4, 0, CAST(N'2016-09-12T01:22:27.2042910' AS DateTime2), NULL, 150, N'Watch out if Dodrio''s three heads are looking in three separate directions. It''s a sure sign that it is on its guard. Don''t go near this Pokémon if it''s being wary-it may decide to peck you.', 1133, 1.8, 1836, N'Dodrio', N'#085', N'dodrio', N'Triple Bird Pokémon', 120, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 85.2, N'', 178, N'#084', 344)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1030, 180, 42.2, 0, CAST(N'2016-09-12T01:22:27.8512335' AS DateTime2), NULL, 180, N'Snorlax''s typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its expansive belly as a place to play.', 0, 2.1, 3112, N'Snorlax', N'#143', N'snorlax', N'Sleeping Pokémon', 320, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 460, N'', 129, N'', 576)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1031, 128, 12.6, 25, CAST(N'2016-09-12T01:22:27.8738924' AS DateTime2), NULL, 110, N'Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels.', 0, 1.8, 983, N'Dratini', N'#147', N'dratini', N'Dragon Pokémon', 82, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 3.3, N'#148', 124, N'', 592)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1032, 114, 13.9, 25, CAST(N'2016-09-12T01:22:27.7882990' AS DateTime2), NULL, 128, N'Eevee has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various stones causes this Pokémon to evolve.', 0, 0.3, 1077, N'Eevee', N'#133', N'eevee', N'Evolution Pokémon', 110, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 6.5, N'#134,#135,#136', 138, N'', 536)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1033, 146, 19, 0, CAST(N'2016-09-12T01:22:26.6137685' AS DateTime2), NULL, 150, N'Raticate’s sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.', 1083, 0.7, 1444, N'Raticate', N'#020', N'raticate', N'Mouse Pokémon', 110, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 18.5, N'', 53, N'#019', 84)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1034, 180, 35.1, 0, CAST(N'2016-09-12T01:22:27.2852118' AS DateTime2), NULL, 188, N'From Muk''s body seeps a foul fluid that gives off a nose-bendingly horrible stench. Just one drop of this Pokémon''s body fluid can turn a pool stagnant and rancid.', 1050, 1.2, 2602, N'Muk', N'#089', N'muk', N'Sludge Pokémon', 210, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 30, N'', 181, N'#088', 360)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1035, 204, 27.8, 0, CAST(N'2016-09-12T01:22:27.3723742' AS DateTime2), NULL, 156, N'Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly and startlingly overtake you. It is actually a Gengar running past you, pretending to be your shadow.', 1138, 1.5, 2078, N'Gengar', N'#094', N'gengar', N'Shadow Pokémon', 120, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 40.5, N'', 188, N'#092,#093', 380)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1036, 232, 42.3, 0, CAST(N'2016-09-12T01:22:27.8628910' AS DateTime2), NULL, 194, N'Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. The Pokémon gains power if it is stricken by lightning bolts.', 0, 1.6, 3114, N'Zapdos', N'#145', N'zapdos', N'Electric Pokémon', 180, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 52.6, N'', 126, N'', 584)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1037, 150, 21.8, 0, CAST(N'2016-09-12T01:22:27.5101097' AS DateTime2), NULL, 174, N'Electrode eats electricity in the atmosphere. On days when lightning strikes, you can see this Pokémon exploding all over the place from eating too much electricity.', 1143, 1.2, 1646, N'Electrode', N'#101', N'electrode', N'Ball Pokémon', 120, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 66.6, N'', 172, N'#100', 408)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1038, 142, 27.3, 0, CAST(N'2016-09-12T01:22:27.6605184' AS DateTime2), NULL, 178, N'If you come across a young Kangaskhan playing by itself, you must never disturb it or attempt to catch it. The baby Pokémon''s parent is sure to be in the area, and it will become violently enraged at you.', 0, 2.2, 2043, N'Kangaskhan', N'#115', N'kangaskhan', N'Parent Pokémon', 210, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 80, N'', 157, N'', 464)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1039, 198, 28.3, 0, CAST(N'2016-09-12T01:22:27.7432251' AS DateTime2), NULL, 160, N'When a storm arrives, gangs of this Pokémon compete with each other to scale heights that are likely to be stricken by lightning bolts. Some towns use Electabuzz in place of lightning rods.', 0, 1.1, 2119, N'Electabuzz', N'#125', N'electabuzz', N'Electric Pokémon', 130, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 30, N'', 147, N'', 504)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1040, 166, 30.1, 0, CAST(N'2016-09-12T01:22:27.6345320' AS DateTime2), NULL, 160, N'Rhydon''s horn can crush even uncut diamonds. One sweeping blow of its tail can topple a building. This Pokémon''s hide is extremely tough. Even direct cannon hits don''t leave a scratch.', 1042, 1.9, 2243, N'Rhydon', N'#112', N'rhydon', N'Drill Pokémon', 210, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 120, N'', 160, N'#111', 452)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1041, 178, 24.2, 0, CAST(N'2016-09-12T01:22:27.4689223' AS DateTime2), NULL, 168, N'Kingler has an enormous, oversized claw. It waves this huge claw in the air to communicate with others. However, because the claw is so heavy, the Pokémon quickly tires.', 1142, 1.3, 1823, N'Kingler', N'#099', N'kingler', N'Pincer Pokémon', 110, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 60, N'', 174, N'#098', 400)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1042, 110, 15.4, 50, CAST(N'2016-09-12T01:22:27.6235314' AS DateTime2), NULL, 116, N'Rhyhorn runs in a straight line, smashing everything in its path. It is not bothered even if it rushes headlong into a block of steel. This Pokémon may feel some pain from the collision the next day, however.', 0, 1, 1182, N'Rhyhorn', N'#111', N'rhyhorn', N'Spikes Pokémon', 160, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 115, N'#112', 162, N'', 448)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1043, 148, 24.5, 0, CAST(N'2016-09-12T01:22:27.7610326' AS DateTime2), NULL, 184, N'This Pokémon is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself.', 0, 1.4, 1844, N'Tauros', N'#128', N'tauros', N'Wild Bull Pokémon', 150, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 88.4, N'', 143, N'', 516)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1044, 154, 19.6, 0, CAST(N'2016-09-12T01:22:27.7261168' AS DateTime2), NULL, 196, N'Mr. Mime is a master of pantomime. Its gestures and motions convince watchers that something unseeable actually exists. Once the watchers are convinced, the unseeable thing exists as if it were real.', 0, 1.3, 1494, N'MrMime', N'#122', N'mr. mime', N'Barrier Pokémon', 80, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 54.5, N'', 148, N'', 492)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1045, 98, 11.6, 50, CAST(N'2016-09-12T01:22:26.7584252' AS DateTime2), NULL, 54, N'Jigglypuff''s vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.', 0, 0.5, 917, N'Jigglypuff', N'#039', N'jigglypuff', N'Balloon Pokémon', 230, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 5.5, N'#040', 73, N'', 160)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1046, 40, 8, 0, CAST(N'2016-09-12T01:22:27.6435196' AS DateTime2), NULL, 60, N'Chansey lays nutritionally excellent eggs on an everyday basis. The eggs are so delicious, they are easily and eagerly devoured by even those people who have lost their appetite.', 0, 1.1, 675, N'Chansey', N'#113', N'chansey', N'Egg Pokémon', 500, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 34.6, N'', 159, N'', 456)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1047, 156, 21.6, 0, CAST(N'2016-09-12T01:22:26.8561738' AS DateTime2), NULL, 146, N'Persian has six bold whiskers that give it a look of toughness. The whiskers sense air movements to determine what is in the Pokémon''s surrounding vicinity. It becomes docile if grabbed by the whiskers.', 1110, 1, 1631, N'Persian', N'#053', N'persian', N'Classy Cat Pokémon', 130, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 32, N'', 86, N'#052', 216)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1048, 136, 10.1, 25, CAST(N'2016-09-12T01:22:27.3417366' AS DateTime2), NULL, 82, N'Gastly is largely composed of gaseous matter. When exposed to a strong wind, the gaseous body quickly dwindles away. Groups of this Pokémon cluster under the eaves of houses to escape the ravages of wind.', 0, 1.3, 804, N'Gastly', N'#092', N'gastly', N'Gas Pokémon', 60, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 0.1, N'#093', 185, N'', 372)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1049, 162, 23.2, 0, CAST(N'2016-09-12T01:22:26.8137252' AS DateTime2), NULL, 170, N'Parasect is known to infest large trees en masse and drain nutrients from the lower trunk and roots. When an infested tree dies, they move onto another tree all at once.', 1106, 1, 1747, N'Parasect', N'#047', N'parasect', N'Mushroom Pokémon', 120, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 29.5, N'', 80, N'#046', 192)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1050, 124, 16.8, 50, CAST(N'2016-09-12T01:22:27.2647404' AS DateTime2), NULL, 110, N'Grimer''s sludgy and rubbery body can be forced through any opening, however small it may be. This Pokémon enters sewer pipes to drink filthy wastewater.', 0, 0.9, 1284, N'Grimer', N'#088', N'grimer', N'Sludge Pokémon', 160, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 30, N'#089', 182, N'', 356)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1051, 194, 29.2, 0, CAST(N'2016-09-12T01:22:27.7181342' AS DateTime2), NULL, 192, N'Starmie''s center section-the core-glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname "the gem of the sea."', 1056, 1.1, 2182, N'Starmie', N'#121', N'starmie', N'Mysterious Pokémon', 120, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 80, N'', 151, N'#120', 488)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1052, 198, 35, 0, CAST(N'2016-09-12T01:22:26.9720789' AS DateTime2), NULL, 180, N'Machamp has the power to hurl anything aside. However, trying to do any work requiring care and dexterity causes its arms to get tangled. This Pokémon tends to leap into action before it thinks.', 1122, 1.6, 2594, N'Machamp', N'#068', N'machamp', N'Superpower Pokémon', 180, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 130, N'', 102, N'#066,#067', 276)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1053, 138, 19.9, 0, CAST(N'2016-09-12T01:22:27.5849852' AS DateTime2), NULL, 204, N'Hitmonchan is said to possess the spirit of a boxer who had been working toward a world championship. This Pokémon has an indomitable spirit and will never give up in the face of adversity.', 0, 1.4, 1516, N'Hitmonchan', N'#107', N'hitmonchan', N'Punching Pokémon', 100, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 50.2, N'', 166, N'', 432)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1054, 148, 19.6, 0, CAST(N'2016-09-12T01:22:27.5744747' AS DateTime2), NULL, 172, N'Hitmonlee''s legs freely contract and stretch. Using these springlike legs, it bowls over foes with devastating kicks. After battle, it rubs down its legs and loosens the muscles to overcome fatigue.', 0, 1.5, 1492, N'Hitmonlee', N'#106', N'hitmonlee', N'Kicking Pokémon', 100, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 49.8, N'', 165, N'', 428)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1055, 230, 40.5, 0, CAST(N'2016-09-12T01:22:26.9010681' AS DateTime2), NULL, 180, N'Arcanine is known for its high speed. It is said to be capable of running over 6,200 miles in a single day and night. The fire that blazes wildly within this Pokémon''s body is its source of power.', 1115, 1.9, 2983, N'Arcanine', N'#059', N'arcanine', N'Legendary Pokémon', 180, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 155, N'', 93, N'#058', 240)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1056, 130, 12, 50, CAST(N'2016-09-12T01:22:27.7071336' AS DateTime2), NULL, 128, N'Staryu''s center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.', 0, 0.8, 937, N'Staryu', N'#120', N'staryu', N'Star Shape Pokémon', 60, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 34.5, N'#121', 150, N'', 484)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1057, 132, 17.6, 100, CAST(N'2016-09-12T01:22:26.9161061' AS DateTime2), NULL, 132, N'The surface of Poliwhirl''s body is always wet and slick with an oily fluid. Because of this greasy covering, it can easily slip and slide out of the clutches of any enemy in battle.', 1116, 1, 1340, N'Poliwhirl', N'#061', N'poliwhirl', N'Tadpole Pokémon', 130, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 20, N'#062', 95, N'#060', 248)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1058, 172, 22.8, 0, CAST(N'2016-09-12T01:22:27.7372251' AS DateTime2), NULL, 134, N'Jynx walks rhythmically, swaying and shaking its hips as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without giving any thought to what they are doing.', 0, 1.4, 1716, N'Jynx', N'#124', N'jynx', N'Human Shape Pokémon', 130, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 40.6, N'', 146, N'', 500)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1059, 138, 16.5, 0, CAST(N'2016-09-12T01:22:27.1609893' AS DateTime2), NULL, 132, N'Farfetch''d is always seen with a stalk from a plant of some sort. Apparently, there are good stalks and bad stalks. This Pokémon has been known to fight with others over stalks.', 0, 0.8, 1263, N'Farfetchd', N'#083', N'farfetch''d', N'Wild Duck Pokémon', 104, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 15, N'', 118, N'', 336)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1060, 186, 25, 0, CAST(N'2016-09-12T01:22:27.1449629' AS DateTime2), NULL, 180, N'Magneton emits a powerful magnetic force that is fatal to mechanical devices. As a result, large cities sound sirens to warn citizens of large-scale outbreaks of this Pokémon.', 1132, 1, 1879, N'Magneton', N'#082', N'magneton', N'Magnet Pokémon', 100, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 60, N'', 115, N'#081', 332)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1061, 186, 40.4, 0, CAST(N'2016-09-12T01:22:27.7790258' AS DateTime2), NULL, 190, N'People have driven Lapras almost to the point of extinction. In the evenings, this Pokémon is said to sing plaintively as it seeks what few others of its kind still remain.', 0, 2.5, 2980, N'Lapras', N'#131', N'lapras', N'Transport Pokémon', 260, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 220, N'', 141, N'', 528)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1062, 136, 14.9, 50, CAST(N'2016-09-12T01:22:27.6045256' AS DateTime2), NULL, 142, N'If Koffing becomes agitated, it raises the toxicity of its internal gases and then jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.', 0, 0.6, 1151, N'Koffing', N'#109', N'koffing', N'Poison Gas Pokémon', 80, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 1, N'#110', 163, N'', 440)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1063, 140, 21.9, 0, CAST(N'2016-09-12T01:22:27.5654846' AS DateTime2), NULL, 202, N'Marowak is the evolved form of a Cubone that has overcome its sadness at the loss of its mother and grown tough. This Pokémon''s tempered and hardened spirit is not easily broken.', 1145, 1, 1656, N'Marowak', N'#105', N'marowak', N'Bone Keeper Pokémon', 120, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 45, N'', 168, N'#104', 424)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1064, 42, 3, 400, CAST(N'2016-09-12T01:22:27.7650154' AS DateTime2), NULL, 84, N'Magikarp is a pathetic excuse for a Pokémon that is only capable of flopping and splashing. This behavior prompted scientists to undertake research into it.', 0, 0.9, 262, N'Magikarp', N'#129', N'magikarp', N'Fish Pokémon', 40, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 10, N'#130', 142, N'', 520)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1065, 132, 14.4, 50, CAST(N'2016-09-12T01:22:27.8186026' AS DateTime2), NULL, 160, N'Omanyte is one of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by people. If attacked by an enemy, it withdraws itself inside its hard shell.', 0, 0.4, 1119, N'Omanyte', N'#138', N'omanyte', N'Spiral Pokémon', 70, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 7.5, N'#139', 132, N'', 556)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1066, 126, 13.8, 25, CAST(N'2016-09-12T01:22:26.4333697' AS DateTime2), NULL, 126, N'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun''s rays, the seed grows progressively larger.', 0, 0.7, 1071, N'Bulbasaur', N'#001', N'bulbasaur', N'Seed Pokémon', 90, CAST(N'2016-10-03T01:37:51.0910920' AS DateTime2), NULL, 6.9, N'#002', 33, N'', 6)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1067, 156, 21.6, 100, CAST(N'2016-09-12T01:22:26.4401386' AS DateTime2), NULL, 158, N'There is a bud on this Pokémon''s back. To support its weight, Ivysaur''s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it''s a sign that the bud will bloom into a large flower soon.', 1066, 1, 1632, N'Ivysaur', N'#002', N'ivysaur', N'Seed Pokémon', 120, CAST(N'2016-10-03T01:37:51.0910920' AS DateTime2), NULL, 13, N'#003', 34, N'#001', 10)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1068, 198, 34.8, 0, CAST(N'2016-09-12T01:22:26.4451469' AS DateTime2), NULL, 200, N'There is a large flower on Venusaur''s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower''s aroma soothes the emotions of people.', 1067, 2, 2580, N'Venusaur', N'#003', N'venusaur', N'Seed Pokémon', 160, CAST(N'2016-10-03T01:37:51.0910920' AS DateTime2), NULL, 100, N'', 35, N'#001,#002', 16)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1069, 128, 12.2, 25, CAST(N'2016-09-12T01:22:26.4491450' AS DateTime2), NULL, 108, N'The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.', 0, 0.6, 955, N'Charmander', N'#004', N'charmander', N'Lizard Pokémon', 78, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 8.5, N'#005', 36, N'', 20)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1070, 212, 35.1, 0, CAST(N'2016-09-12T01:22:26.4591470' AS DateTime2), NULL, 182, N'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.', 1012, 1.7, 2602, N'Charizard', N'#006', N'charizard', N'Flame Pokémon', 156, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 90.5, N'', 38, N'#004,#005', 28)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1071, 112, 13, 25, CAST(N'2016-09-12T01:22:26.4651440' AS DateTime2), NULL, 142, N'Squirtle''s shell is not merely used for protection. The shell''s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.', 0, 0.5, 1008, N'Squirtle', N'#007', N'squirtle', N'Tiny Turtle Pokémon', 88, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 9, N'#008', 39, N'', 32)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1072, 144, 20.9, 100, CAST(N'2016-09-12T01:22:26.4711444' AS DateTime2), NULL, 176, N'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon''s toughness as a battler.', 1071, 1, 1582, N'Wartortle', N'#008', N'wartortle', N'Turtle Pokémon', 118, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 22.5, N'#009', 40, N'#007', 36)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1073, 186, 34.3, 0, CAST(N'2016-09-12T01:22:26.4781601' AS DateTime2), NULL, 222, N'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.', 1072, 1.6, 2542, N'Blastoise', N'#009', N'blastoise', N'Shellfish Pokémon', 158, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 85.5, N'', 41, N'#007,#008', 40)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1074, 62, 5.3, 12, CAST(N'2016-09-12T01:22:26.4836837' AS DateTime2), NULL, 66, N'Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.', 0, 0.3, 443, N'Caterpie', N'#010', N'caterpie', N'Worm Pokémon', 90, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 2.9, N'#011', 42, N'', 44)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1075, 56, 5.8, 50, CAST(N'2016-09-12T01:22:26.4895058' AS DateTime2), NULL, 86, N'The shell covering this Pokémon’s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.', 1074, 0.7, 477, N'Metapod', N'#011', N'metapod', N'Cocoon Pokémon', 100, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 9.9, N'#012', 43, N'#010', 48)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1076, 144, 19.1, 0, CAST(N'2016-09-12T01:22:26.5002279' AS DateTime2), NULL, 144, N'Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.', 1075, 1.1, 1454, N'Butterfree', N'#012', N'butterfree', N'Butterfly Pokémon', 120, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 32, N'', 44, N'#010,#011', 52)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1077, 68, 5.4, 12, CAST(N'2016-09-12T01:22:26.5092189' AS DateTime2), NULL, 64, N'Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).', 0, 0.3, 449, N'Weedle', N'#013', N'weedle', N'Hairy Bug Pokémon', 80, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 3.2, N'#014', 45, N'', 56)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1078, 62, 5.9, 50, CAST(N'2016-09-12T01:22:26.5182266' AS DateTime2), NULL, 82, N'Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.', 1077, 0.6, 485, N'Kakuna', N'#014', N'kakuna', N'Cocoon Pokémon', 90, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 10, N'#015', 46, N'#013', 60)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1079, 144, 18.9, 0, CAST(N'2016-09-12T01:22:26.5308087' AS DateTime2), NULL, 130, N'Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.', 1078, 1, 1439, N'Beedrill', N'#015', N'beedrill', N'Poison Bee Pokémon', 130, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 29.5, N'', 47, N'#013,#014', 64)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1080, 94, 8.5, 12, CAST(N'2016-09-12T01:22:26.5418096' AS DateTime2), NULL, 90, N'Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.', 0, 0.3, 679, N'Pidgey', N'#016', N'pidgey', N'Tiny Bird Pokémon', 80, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 1.8, N'#017', 50, N'', 68)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1081, 126, 16, 50, CAST(N'2016-09-12T01:22:26.5737208' AS DateTime2), NULL, 122, N'Pidgeotto claims a large area as its own territory. This Pokémon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.', 1080, 1.1, 1223, N'Pidgeotto', N'#017', N'pidgeotto', N'Bird Pokémon', 126, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 30, N'#018', 49, N'#016', 72)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1082, 170, 28, 0, CAST(N'2016-09-12T01:22:26.5892331' AS DateTime2), NULL, 166, N'This Pokémon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their Pokémon.', 1081, 1.5, 2091, N'Pidgeot', N'#018', N'pidgeot', N'Bird Pokémon', 166, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 39.5, N'', 52, N'#016,#017', 76)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1083, 92, 7.2, 25, CAST(N'2016-09-12T01:22:26.6022761' AS DateTime2), NULL, 86, N'Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it lives—it will make its nest anywhere.', 0, 0.3, 581, N'Rattata', N'#019', N'rattata', N'Mouse Pokémon', 60, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 3.5, N'#020', 51, N'', 80)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1084, 102, 8.6, 50, CAST(N'2016-09-12T01:22:26.6207748' AS DateTime2), NULL, 78, N'Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.', 0, 0.3, 686, N'Spearow', N'#021', N'spearow', N'Tiny Bird Pokémon', 80, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 2, N'#022', 54, N'', 88)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1085, 168, 23.2, 0, CAST(N'2016-09-12T01:22:26.6287805' AS DateTime2), NULL, 146, N'Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.', 1084, 1.2, 1746, N'Fearow', N'#022', N'fearow', N'Beak Pokémon', 130, CAST(N'2016-10-03T01:37:51.0915915' AS DateTime2), NULL, 38, N'', 56, N'#021', 92)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1086, 112, 10.5, 50, CAST(N'2016-09-12T01:22:26.6357735' AS DateTime2), NULL, 112, N'Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.', 0, 2, 824, N'Ekans', N'#023', N'ekans', N'Snake Pokémon', 70, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 6.9, N'#024', 55, N'', 96)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1087, 166, 23.5, 0, CAST(N'2016-09-12T01:22:26.6440165' AS DateTime2), NULL, 166, N'This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.', 1086, 3.5, 1767, N'Arbok', N'#024', N'arbok', N'Cobra Pokémon', 120, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 65, N'', 58, N'#023', 100)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1088, 124, 11.3, 50, CAST(N'2016-09-12T01:22:26.6570035' AS DateTime2), NULL, 108, N'Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it''s evidence that this Pokémon mistook the intensity of its charge.', 0, 0.4, 887, N'Pikachu', N'#025', N'pikachu', N'Mouse Pokémon', 70, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 6, N'#026', 57, N'', 104)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1089, 200, 27.1, 0, CAST(N'2016-09-12T01:22:26.6650173' AS DateTime2), NULL, 154, N'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon''s nest.', 1088, 0.8, 2028, N'Raichu', N'#026', N'raichu', N'Mouse Pokémon', 120, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 30, N'', 59, N'#025', 108)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1090, 90, 10.1, 50, CAST(N'2016-09-12T01:22:26.6720172' AS DateTime2), NULL, 114, N'Sandshrew''s body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.', 0, 0.6, 798, N'Sandshrew', N'#027', N'sandshrew', N'Mouse Pokémon', 100, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 12, N'#028', 60, N'', 112)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1091, 150, 24.1, 0, CAST(N'2016-09-12T01:22:26.6800036' AS DateTime2), NULL, 172, N'Sandslash''s body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.', 1090, 1, 1810, N'Sandslash', N'#028', N'sandslash', N'Mouse Pokémon', 150, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 29.5, N'', 61, N'#027', 116)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1092, 100, 11.2, 25, CAST(N'2016-09-12T01:22:26.6864236' AS DateTime2), NULL, 104, N'Nidoran♀ has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.', 0, 0.4, 876, N'NidoranFemale', N'#029', N'nidoran♀', N'Poison Pin Pokémon', 110, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 7, N'#030', 62, N'', 120)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1093, 132, 18.4, 100, CAST(N'2016-09-12T01:22:26.6939238' AS DateTime2), NULL, 136, N'When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.', 1092, 0.8, 1404, N'Nidorina', N'#030', N'nidorina', N'Poison Pin Pokémon', 140, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 20, N'#031', 63, N'#029', 124)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1094, 184, 33.5, 0, CAST(N'2016-09-12T01:22:26.7044334' AS DateTime2), NULL, 190, N'Nidoqueen''s body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.', 1093, 1.3, 2485, N'Nidoqueen', N'#031', N'nidoqueen', N'Drill Pokémon', 180, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 60, N'', 64, N'#029,#030', 128)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1095, 110, 10.7, 25, CAST(N'2016-09-12T01:22:26.7114457' AS DateTime2), NULL, 94, N'Nidoran♂ has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon''s notice.', 0, 0.5, 843, N'NidoranMale', N'#032', N'nidoran♂', N'Poison Pin Pokémon', 92, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 9, N'#033', 65, N'', 132)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1096, 142, 18, 100, CAST(N'2016-09-12T01:22:26.7194342' AS DateTime2), NULL, 128, N'Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.', 1095, 0.9, 1372, N'Nidorino', N'#033', N'nidorino', N'Poison Pin Pokémon', 122, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 19.5, N'#034', 66, N'#032', 136)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1097, 204, 33.3, 0, CAST(N'2016-09-12T01:22:26.7284449' AS DateTime2), NULL, 170, N'Nidoking''s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.', 1096, 1.4, 2475, N'Nidoking', N'#034', N'nidoking', N'Drill Pokémon', 162, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 62, N'', 68, N'#032,#033', 140)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1098, 116, 15.6, 50, CAST(N'2016-09-12T01:22:26.7344299' AS DateTime2), NULL, 124, N'On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.', 0, 0.6, 1200, N'Clefairy', N'#035', N'clefairy', N'Fairy Pokémon', 140, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 7.5, N'#036', 67, N'', 144)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1099, 178, 32.3, 0, CAST(N'2016-09-12T01:22:26.7414255' AS DateTime2), NULL, 178, N'Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step even lets it walk on water. It is known to take strolls on lakes on quiet, moonlit nights.', 1098, 1.3, 2397, N'Clefable', N'#036', N'clefable', N'Fairy Pokémon', 190, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 40, N'', 69, N'#035', 148)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1100, 106, 10.6, 50, CAST(N'2016-09-12T01:22:26.7464261' AS DateTime2), NULL, 118, N'At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its trainer. The six tails become magnificently curled.', 0, 0.6, 831, N'Vulpix', N'#037', N'vulpix', N'Fox Pokémon', 76, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 9.9, N'#038', 70, N'', 152)
GO
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1101, 176, 29.3, 0, CAST(N'2016-09-12T01:22:26.7524261' AS DateTime2), NULL, 194, N'Ninetales casts a sinister light from its bright red eyes to gain total control over its foe''s mind. This Pokémon is said to live for one thousand years.', 1100, 1.1, 2188, N'Ninetales', N'#038', N'ninetales', N'Fox Pokémon', 146, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 19.9, N'', 71, N'#037', 156)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1102, 168, 29.1, 0, CAST(N'2016-09-12T01:22:26.7663334' AS DateTime2), NULL, 108, N'Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon''s eyes, it is quickly washed away.', 1045, 1, 2177, N'Wigglytuff', N'#040', N'wigglytuff', N'Balloon Pokémon', 280, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 12, N'', 72, N'#039', 164)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1103, 88, 8, 50, CAST(N'2016-09-12T01:22:26.7733170' AS DateTime2), NULL, 90, N'Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.', 0, 0.8, 642, N'Zubat', N'#041', N'zubat', N'Bat Pokémon', 80, CAST(N'2016-10-03T01:37:51.0920892' AS DateTime2), NULL, 7.5, N'#042', 75, N'', 168)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1104, 134, 14.9, 25, CAST(N'2016-09-12T01:22:26.7863374' AS DateTime2), NULL, 130, N'During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.', 0, 0.5, 1148, N'Oddish', N'#043', N'oddish', N'Weed Pokémon', 90, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 5.4, N'#044', 77, N'', 176)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1105, 162, 22.4, 100, CAST(N'2016-09-12T01:22:26.7933291' AS DateTime2), NULL, 158, N'Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.', 1104, 0.8, 1689, N'Gloom', N'#044', N'gloom', N'Weed Pokémon', 120, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 8.6, N'#045', 76, N'#043', 180)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1106, 122, 11.7, 50, CAST(N'2016-09-12T01:22:26.8067254' AS DateTime2), NULL, 120, N'Paras has parasitic mushrooms growing on its back called tochukaso. They grow large by drawing nutrients from this Bug Pokémon host. They are highly valued as a medicine for extending life.', 0, 0.3, 916, N'Paras', N'#046', N'paras', N'Mushroom Pokémon', 70, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 5.4, N'#047', 79, N'', 188)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1107, 108, 13.3, 50, CAST(N'2016-09-12T01:22:26.8189516' AS DateTime2), NULL, 118, N'Venonat is said to have evolved with a coat of thin, stiff hair that covers its entire body for protection. It possesses large eyes that never fail to spot even miniscule prey.', 0, 1, 1029, N'Venonat', N'#048', N'venonat', N'Insect Pokémon', 120, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 30, N'#049', 81, N'', 196)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1108, 108, 5.3, 50, CAST(N'2016-09-12T01:22:26.8339691' AS DateTime2), NULL, 86, N'Diglett are raised in most farms. The reason is simple—wherever this Pokémon burrows, the soil is left perfectly tilled for planting crops. This soil is made ideal for growing delicious vegetables.', 0, 0.2, 456, N'Diglett', N'#050', N'diglett', N'Mole Pokémon', 20, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 0.8, N'#051', 82, N'', 204)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1109, 148, 15.1, 0, CAST(N'2016-09-12T01:22:26.8411554' AS DateTime2), NULL, 140, N'Dugtrio are actually triplets that emerged from one body. As a result, each triplet thinks exactly like the other two triplets. They work cooperatively to burrow endlessly.', 1108, 0.7, 1168, N'Dugtrio', N'#051', N'dugtrio', N'Mole Pokémon', 70, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 33.3, N'', 84, N'#050', 208)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1110, 104, 9.6, 50, CAST(N'2016-09-12T01:22:26.8481668' AS DateTime2), NULL, 94, N'Meowth withdraws its sharp claws into its paws to slinkily sneak about without making any incriminating footsteps. For some reason, this Pokémon loves shiny coins that glitter with light.', 0, 0.4, 756, N'Meowth', N'#052', N'meowth', N'Scratch Cat Pokémon', 80, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 4.2, N'#053', 85, N'', 212)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1111, 132, 14.4, 50, CAST(N'2016-09-12T01:22:26.8642128' AS DateTime2), NULL, 112, N'Psyduck uses a mysterious power. When it does so, this Pokémon generates brain waves that are supposedly only seen in sleepers. This discovery spurred controversy among scholars.', 0, 0.8, 1109, N'Psyduck', N'#054', N'psyduck', N'Duck Pokémon', 100, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 19.6, N'#055', 88, N'', 220)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1112, 194, 32.1, 0, CAST(N'2016-09-12T01:22:26.8722134' AS DateTime2), NULL, 176, N'The webbed flippers on its forelegs and hind legs and the streamlined body of Golduck give it frightening speed. The Pokémon is definitely much faster than even the most athletic swimmer.', 1111, 1.7, 2386, N'Golduck', N'#055', N'golduck', N'Duck Pokémon', 160, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 76.6, N'', 89, N'#054', 224)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1113, 122, 11.2, 50, CAST(N'2016-09-12T01:22:26.8797730' AS DateTime2), NULL, 96, N'When Mankey starts shaking and its nasal breathing turns rough, it''s a sure sign that it is becoming angry. However, because it goes into a towering rage almost instantly, it is impossible for anyone to flee its wrath.', 0, 0.5, 878, N'Mankey', N'#056', N'mankey', N'Pig Monkey Pokémon', 80, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 28, N'#057', 90, N'', 228)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1114, 178, 24.8, 0, CAST(N'2016-09-12T01:22:26.8872963' AS DateTime2), NULL, 150, N'When Primeape becomes furious, its blood circulation is boosted. In turn, its muscles are made even stronger. However, it also becomes much less intelligent at the same time.', 1113, 1, 1864, N'Primeape', N'#057', N'primeape', N'Pig Monkey Pokémon', 130, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 32, N'', 91, N'#056', 232)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1115, 156, 17.5, 50, CAST(N'2016-09-12T01:22:26.8942979' AS DateTime2), NULL, 110, N'Growlithe has a superb sense of smell. Once it smells anything, this Pokémon won''t forget the scent, no matter what. It uses its advanced olfactory sense to determine the emotions of other living things.', 0, 0.7, 1335, N'Growlithe', N'#058', N'growlithe', N'Puppy Pokémon', 110, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 19, N'#059', 92, N'', 236)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1116, 108, 10.1, 25, CAST(N'2016-09-12T01:22:26.9080727' AS DateTime2), NULL, 98, N'Poliwag has a very thin skin. It is possible to see the Pokémon''s spiral innards right through the skin. Despite its thinness, however, the skin is also very flexible. Even sharp fangs bounce right off it.', 0, 0.6, 795, N'Poliwag', N'#060', N'poliwag', N'Tadpole Pokémon', 80, CAST(N'2016-10-03T01:37:51.0925887' AS DateTime2), NULL, 12.4, N'#061', 94, N'', 244)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1117, 180, 33.8, 0, CAST(N'2016-09-12T01:22:26.9258913' AS DateTime2), NULL, 202, N'Poliwrath''s highly developed, brawny muscles never grow fatigued, however much it exercises. It is so tirelessly strong, this Pokémon can swim back and forth across the ocean without effort.', 1057, 1.3, 2505, N'Poliwrath', N'#062', N'poliwrath', N'Tadpole Pokémon', 180, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 54, N'', 96, N'#060,#061', 252)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1118, 110, 7.4, 25, CAST(N'2016-09-12T01:22:26.9338902' AS DateTime2), NULL, 76, N'Abra sleeps for eighteen hours a day. However, it can sense the presence of foes even while it is sleeping. In such a situation, this Pokémon immediately teleports to safety.', 0, 0.9, 600, N'Abra', N'#063', N'abra', N'Psi Pokémon', 50, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 19.5, N'#064', 97, N'', 256)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1119, 150, 14.6, 100, CAST(N'2016-09-12T01:22:26.9418903' AS DateTime2), NULL, 112, N'Kadabra emits a peculiar alpha wave if it develops a headache. Only those people with a particularly strong psyche can hope to become a trainer of this Pokémon.', 1118, 1.3, 1131, N'Kadabra', N'#064', N'kadabra', N'Psi Pokémon', 80, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 56.5, N'#065', 98, N'#063', 260)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1120, 186, 24.1, 0, CAST(N'2016-09-12T01:22:26.9495962' AS DateTime2), NULL, 152, N'Alakazam''s brain continually grows, making its head far too heavy to support with its neck. This Pokémon holds its head up using its psychokinetic power instead.', 1119, 1.5, 1813, N'Alakazam', N'#065', N'alakazam', N'Psi Pokémon', 110, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 48, N'', 100, N'#063,#064', 264)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1121, 118, 14.1, 25, CAST(N'2016-09-12T01:22:26.9565819' AS DateTime2), NULL, 96, N'Machop''s muscles are special—they never get sore no matter how much they are used in exercise. This Pokémon has sufficient power to hurl a hundred adult humans.', 0, 0.8, 1089, N'Machop', N'#066', N'machop', N'Superpower Pokémon', 140, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 19.5, N'#067', 99, N'', 268)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1122, 154, 23.4, 100, CAST(N'2016-09-12T01:22:26.9643383' AS DateTime2), NULL, 144, N'Machoke''s thoroughly toned muscles possess the hardness of steel. This Pokémon has so much strength, it can easily hold aloft a sumo wrestler on just one finger.', 1121, 1.5, 1760, N'Machoke', N'#067', N'machoke', N'Superpower Pokémon', 160, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 70.5, N'#068', 101, N'#066', 272)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1123, 158, 14.4, 25, CAST(N'2016-09-12T01:22:26.9790915' AS DateTime2), NULL, 78, N'Bellsprout''s thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, this Pokémon spits a corrosive fluid that melts even iron.', 0, 0.7, 1117, N'Bellsprout', N'#069', N'bellsprout', N'Flower Pokémon', 100, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 4, N'#070', 104, N'', 280)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1124, 190, 22.8, 100, CAST(N'2016-09-12T01:22:26.9878555' AS DateTime2), NULL, 110, N'Weepinbell has a large hook on its rear end. At night, the Pokémon hooks on to a tree branch and goes to sleep. If it moves around in its sleep, it may wake up to find itself on the ground.', 1123, 1, 1723, N'Weepinbell', N'#070', N'weepinbell', N'Flycatcher Pokémon', 130, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 6.4, N'#071', 103, N'#069', 284)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1125, 170, 29.8, 0, CAST(N'2016-09-12T01:22:27.0138120' AS DateTime2), NULL, 196, N'Tentacruel has large red orbs on its head. The orbs glow before lashing the vicinity with a harsh ultrasonic blast. This Pokémon''s outburst creates rough waves around it.', 1027, 1.6, 2220, N'Tentacruel', N'#073', N'tentacruel', N'Jellyfish Pokémon', 160, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 55, N'', 107, N'#072', 296)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1126, 106, 10.8, 25, CAST(N'2016-09-12T01:22:27.0217967' AS DateTime2), NULL, 118, N'The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this Pokémon''s heart will remain hard, craggy, and rough always.', 0, 0.4, 849, N'Geodude', N'#074', N'geodude', N'Rock Pokémon', 80, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 20, N'#075', 108, N'', 300)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1127, 142, 18.8, 100, CAST(N'2016-09-12T01:22:27.0307980' AS DateTime2), NULL, 156, N'Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This Pokémon eats its way through a ton of rocks on a daily basis.', 1126, 1, 1433, N'Graveler', N'#075', N'graveler', N'Rock Pokémon', 110, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 105, N'#076', 109, N'#074', 304)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1128, 176, 30.9, 0, CAST(N'2016-09-12T01:22:27.0387994' AS DateTime2), NULL, 198, N'Golem live up on mountains. If there is a large earthquake, these Pokémon will come rolling down off the mountains en masse to the foothills below.', 1127, 1.4, 2303, N'Golem', N'#076', N'golem', N'Megaton Pokémon', 160, CAST(N'2016-10-03T01:37:51.0930887' AS DateTime2), NULL, 300, N'', 110, N'#074,#075', 308)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1129, 200, 29.5, 0, CAST(N'2016-09-12T01:22:27.0537998' AS DateTime2), NULL, 170, N'Rapidash usually can be seen casually cantering in the fields and plains. However, when this Pokémon turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph.', 1011, 1.7, 2199, N'Rapidash', N'#078', N'rapidash', N'Fire Horse Pokémon', 130, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 95, N'', 111, N'#077', 316)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1130, 110, 15.9, 50, CAST(N'2016-09-12T01:22:27.0617969' AS DateTime2), NULL, 110, N'Slowpoke uses its tail to catch prey by dipping it in water at the side of a river. However, this Pokémon often forgets what it''s doing and often spends entire days just loafing at water''s edge.', 0, 1.2, 1218, N'Slowpoke', N'#079', N'slowpoke', N'Dopey Pokémon', 180, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 36, N'#080', 113, N'', 320)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1131, 184, 35.1, 0, CAST(N'2016-09-12T01:22:27.0687964' AS DateTime2), NULL, 198, N'Slowbro''s tail has a Shellder firmly attached with a bite. As a result, the tail can''t be used for fishing anymore. This causes Slowbro to grudgingly swim and catch prey instead.', 1130, 1.6, 2597, N'Slowbro', N'#080', N'slowbro', N'Hermit Crab Pokémon', 190, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 78.5, N'', 114, N'#079', 324)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1132, 128, 11.3, 50, CAST(N'2016-09-12T01:22:27.0747972' AS DateTime2), NULL, 138, N'Magnemite attaches itself to power lines to feed on electricity. If your house has a power outage, check your circuit breakers. You may find a large number of this Pokémon clinging to the breaker box.', 0, 0.3, 890, N'Magnemite', N'#081', N'magnemite', N'Magnet Pokémon', 50, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 6, N'#082', 116, N'', 328)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1133, 126, 10.9, 50, CAST(N'2016-09-12T01:22:27.1824969' AS DateTime2), NULL, 96, N'Doduo''s two heads never sleep at the same time. Its two heads take turns sleeping, so one head can always keep watch for enemies while the other one sleeps.', 0, 1.4, 855, N'Doduo', N'#084', N'doduo', N'Twin Bird Pokémon', 70, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 39.2, N'#085', 117, N'', 340)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1134, 104, 14.3, 50, CAST(N'2016-09-12T01:22:27.2222722' AS DateTime2), NULL, 138, N'Seel hunts for prey in the frigid sea underneath sheets of ice. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head.', 0, 1.1, 1107, N'Seel', N'#086', N'seel', N'Sea Lion Pokémon', 130, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 90, N'#087', 177, N'', 348)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1135, 156, 28.7, 0, CAST(N'2016-09-12T01:22:27.2472570' AS DateTime2), NULL, 192, N'Dewgong loves to snooze on bitterly cold ice. The sight of this Pokémon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago.', 1134, 1.7, 2145, N'Dewgong', N'#087', N'dewgong', N'Sea Lion Pokémon', 180, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 120, N'', 180, N'#086', 352)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1136, 120, 10.4, 50, CAST(N'2016-09-12T01:22:27.3034551' AS DateTime2), NULL, 112, N'At night, this Pokémon uses its broad tongue to burrow a hole in the seafloor sand and then sleep in it. While it is sleeping, Shellder closes its shell, but leaves its tongue hanging out.', 0, 0.3, 822, N'Shellder', N'#090', N'shellder', N'Bivalve Pokémon', 60, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 4, N'#091', 187, N'', 364)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1137, 196, 27.4, 0, CAST(N'2016-09-12T01:22:27.3304568' AS DateTime2), NULL, 196, N'Cloyster is capable of swimming in the sea. It does so by swallowing water, then jetting it out toward the rear. This Pokémon shoots spikes from its shell using the same system.', 1136, 1.5, 2052, N'Cloyster', N'#091', N'cloyster', N'Bivalve Pokémon', 100, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 132.5, N'', 183, N'#090', 368)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1138, 172, 18, 100, CAST(N'2016-09-12T01:22:27.3543592' AS DateTime2), NULL, 118, N'Haunter is a dangerous Pokémon. If one beckons you while floating in darkness, you must never approach it. This Pokémon will try to lick you with its tongue and steal your life away.', 1048, 1.6, 1380, N'Haunter', N'#093', N'haunter', N'Gas Pokémon', 90, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 0.1, N'#094', 184, N'#092', 376)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1139, 90, 10.9, 0, CAST(N'2016-09-12T01:22:27.3928986' AS DateTime2), NULL, 186, N'Onix has a magnet in its brain. It acts as a compass so that this Pokémon does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.', 0, 8.8, 857, N'Onix', N'#095', N'onix', N'Rock Snake Pokémon', 70, CAST(N'2016-10-03T01:37:51.1055916' AS DateTime2), NULL, 210, N'', 186, N'', 384)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1140, 104, 13.9, 50, CAST(N'2016-09-12T01:22:27.4108315' AS DateTime2), NULL, 140, N'If your nose becomes itchy while you are sleeping, it''s a sure sign that one of these Pokémon is standing above your pillow and trying to eat you dream through your nostrils.', 0, 1, 1075, N'Drowzee', N'#096', N'drowzee', N'Hypnosis Pokémon', 120, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 32.4, N'', 175, N'', 388)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1141, 162, 29.3, 0, CAST(N'2016-09-12T01:22:27.4287844' AS DateTime2), NULL, 196, N'Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokémon searches for prey, it polishes the pendulum.', 0, 1.6, 2184, N'Hypno', N'#097', N'hypno', N'Hypnosis Pokémon', 170, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 75.6, N'', 176, N'', 392)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1142, 116, 10, 50, CAST(N'2016-09-12T01:22:27.4478073' AS DateTime2), NULL, 110, N'Krabby live on beaches, burrowed inside holes dug into the sand. On sandy beaches with little in the way of food, these Pokémon can be seen squabbling with each other over territory.', 0, 0.4, 792, N'Krabby', N'#098', N'krabby', N'River Crab Pokémon', 60, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 6.5, N'#099', 173, N'', 396)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1143, 102, 10.7, 50, CAST(N'2016-09-12T01:22:27.4894545' AS DateTime2), NULL, 124, N'Voltorb was first sighted at a company that manufactures Poké Balls. The link between that sighting and the fact that this Pokémon looks very similar to a Poké Ball remains a mystery.', 0, 0.5, 839, N'Voltorb', N'#100', N'voltorb', N'Ball Pokémon', 80, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 10.4, N'#101', 171, N'', 404)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1144, 110, 14.2, 50, CAST(N'2016-09-12T01:22:27.5290950' AS DateTime2), NULL, 132, N'This Pokémon consists of six eggs that form a closely knit cluster. The six eggs attract each other and spin around. When cracks increasingly appear on the eggs, Exeggcute is close to evolution.', 0, 0.4, 1099, N'Exeggcute', N'#102', N'exeggcute', N'Egg Pokémon', 120, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 2.5, N'#103', 169, N'', 412)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1145, 102, 13, 50, CAST(N'2016-09-12T01:22:27.5554694' AS DateTime2), NULL, 150, N'Cubone pines for the mother it will never see again. Seeing a likeness of its mother in the full moon, it cries. The stains on the skull the Pokémon wears are made by the tears it sheds.', 0, 0.4, 1006, N'Cubone', N'#104', N'cubone', N'Lonely Pokémon', 100, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 6.5, N'#105', 167, N'', 420)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1146, 126, 21.5, 0, CAST(N'2016-09-12T01:22:27.5939899' AS DateTime2), NULL, 160, N'Whenever Lickitung comes across something new, it will unfailingly give it a lick. It does so because it memorizes things by texture and by taste. It is somewhat put off by sour things.', 0, 1.2, 1626, N'Lickitung', N'#108', N'lickitung', N'Licking Pokémon', 180, CAST(N'2016-10-03T01:37:51.1060915' AS DateTime2), NULL, 65.5, N'', 164, N'', 436)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1147, 176, 22.7, 0, CAST(N'2016-09-12T01:22:27.6785316' AS DateTime2), NULL, 150, N'Seadra sleeps after wriggling itself between the branches of coral. Those trying to harvest coral are occasionally stung by this Pokémon''s poison barbs if they fail to notice it.', 1017, 1.2, 1713, N'Seadra', N'#117', N'seadra', N'Dragon Pokémon', 110, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 25, N'', 155, N'#116', 472)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1148, 112, 12.4, 50, CAST(N'2016-09-12T01:22:27.6890477' AS DateTime2), NULL, 126, N'Goldeen is a very beautiful Pokémon with fins that billow elegantly in water. However, don''t let your guard down around this Pokémon—it could ram you powerfully with its horn.', 0, 0.6, 965, N'Goldeen', N'#118', N'goldeen', N'Goldfish Pokémon', 90, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 15, N'#119', 154, N'', 476)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1149, 192, 36.4, 0, CAST(N'2016-09-12T01:22:27.7730258' AS DateTime2), NULL, 196, N'When Magikarp evolves into Gyarados, its brain cells undergo a structural transformation. It is said that this transformation is to blame for this Pokémon''s wildly violent nature.', 1064, 6.5, 2688, N'Gyarados', N'#130', N'gyarados', N'Atrocious Pokémon', 190, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 235, N'', 140, N'#129', 524)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1150, 186, 38.1, 0, CAST(N'2016-09-12T01:22:27.7943157' AS DateTime2), NULL, 168, N'Vaporeon underwent a spontaneous mutation and grew fins and gills that allow it to live underwater. This Pokémon has the ability to freely control water.', 1032, 1, 2816, N'Vaporeon', N'#134', N'vaporeon', N'Bubble Jet Pokémon', 260, CAST(N'2016-10-03T01:37:51.1065914' AS DateTime2), NULL, 29, N'', 136, N'#133', 540)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1151, 192, 28.6, 0, CAST(N'2016-09-12T01:22:27.8005864' AS DateTime2), NULL, 174, N'Jolteon''s cells generate a low level of electricity. This power is amplified by the static electricity of its fur, enabling the Pokémon to drop thunderbolts. The bristling fur is made of electrically charged needles.', 1032, 0.8, 2140, N'Jolteon', N'#135', N'jolteon', N'Lightning Pokémon', 130, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 24.5, N'', 137, N'#133', 544)
INSERT [dbo].[Characters] ([Id], [Attack], [CPGain], [Candy], [CreatedDate], [CreatedUserId], [Defense], [Description], [EvolveFromId], [Height], [MaxCP], [Name], [Number], [Slug], [Species], [Stamina], [UpdatedDate], [UpdatedUserId], [Weight], [EvolveIntos], [AvatarImageId], [EvolveFroms], [InfoContentId]) VALUES (1152, 238, 35.6, 0, CAST(N'2016-09-12T01:22:27.8055852' AS DateTime2), NULL, 178, N'Flareon''s fluffy fur has a functional purpose-it releases heat into the air so that its body does not get excessively hot. This Pokémon''s body temperature can rise to a maximum of 1,650 degrees Fahrenheit.', 1032, 0.9, 2643, N'Flareon', N'#136', N'flareon', N'Flame Pokémon', 130, CAST(N'2016-10-03T01:37:51.1070879' AS DateTime2), NULL, 25, N'', 135, N'#133', 548)
SET IDENTITY_INSERT [dbo].[Characters] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (19, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Khu Dân Cư,Trường Học', NULL, NULL, 20)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (20, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Khu Dân Cư,Thành Phố,Khí Hậu Nóng,Khí Hậu Ẩm,Bãi Biển,Công Viên', NULL, NULL, 21)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (21, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Kênh,Hồ,Biển,Sông,Đầm Lầy,Cảng,Bể Nước', NULL, NULL, 22)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (22, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Khu Công Nghiệp,Khu Dân Cư,Trường Học,Đường,Khu Mua Sắm', NULL, NULL, 23)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (23, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Công Viên,Khu Nông Nghiệp,Rừng,Đường,Vườn,Sân Gôn,Bãi Cỏ,Khu Bảo Tồn Thiên Nhiên', NULL, NULL, 24)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (24, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Gần Nước,Khí Hậu Lạnh, Đồng Cỏ', NULL, NULL, 25)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (25, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Gym,Sân Vận Động,Khu Giải Trí', NULL, NULL, 26)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (26, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Khu Công Nghiệp,Hồ,Đầm Lầy', NULL, NULL, 27)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (27, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Công Viên,Mỏ,Khu Nông Nghiệp,Sân Gôn', NULL, NULL, 28)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (28, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Khu Công Nghiệp,Rừng,Bãi Cỏ,Khu Bảo Tồn Thiên Nhiên,Khu Giải Trí,Công Viên,Vườn', NULL, NULL, 29)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (29, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'Trừ Mew và Mewtwo chỉ xuất hiện trong các sự kiện đặc biệt', N'Khu Dân Cư(Đêm),Bệnh Viện,Bãi Cỏ', NULL, NULL, 30)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (30, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Công Viên,Khu Nông Nghiệp,Rừng,Vườn, Sân Gôn,Bãi Cỏ,Khu Bảo Tồn Thiên Nhiên', NULL, NULL, 31)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (31, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Mỏ,Khu Nông Nghiệp,Thành Phố,Đường,Khu Bảo Tồn Thiên Nhiên', NULL, NULL, 32)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (32, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Nhà Thờ,Khu Dân Cư(Đêm),Nghĩa Trang', NULL, NULL, 33)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (33, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Sân Gôn,Địa Danh,Khu Du Lịch', NULL, NULL, 34)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (34, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'Chưa xác định', N'', NULL, NULL, 35)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (35, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Toà Nhà,Đường', NULL, NULL, 36)
INSERT [dbo].[Locations] ([Id], [CreatedDate], [CreatedUserId], [Description], [Name], [UpdatedDate], [UpdatedUserId], [LocationType]) VALUES (36, CAST(N'2016-09-12T00:43:56.7631474' AS DateTime2), NULL, N'', N'Nhà Thờ,Địa Danh,Khu Du Lịch,Nghĩa Trang', NULL, NULL, 37)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Moves] ON 

INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (1, 1.56, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 32.05, -50, N'Body Slam', 50, NULL, NULL, 40.06, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (2, 2.9, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.62, -25, N'Bubble Beam', 25, NULL, NULL, 10.78, 39, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (3, 2.9, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.62, -25, N'Aerial Ace', 25, NULL, NULL, 10.78, 39, 29)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (4, 1.15, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.7, 10, N'Peck', 10, NULL, NULL, 10.87, 38, 29)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (5, 4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.75, -33, N'Scald', 35, NULL, NULL, 10.94, 39, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (6, 1.36, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.82, 7, N'Rock Throw', 12, NULL, NULL, 11.03, 38, 32)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (7, 3.4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.82, -25, N'Bulldoze', 30, NULL, NULL, 11.03, 39, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (8, 1.695, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.85, -20, N'Struggle', 15, NULL, NULL, 11.06, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (9, 2.8, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.93, -25, N'Magnet Bomb', 25, NULL, NULL, 11.16, 39, 36)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (10, 2.2, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.09, -25, N'Horn Attack', 20, NULL, NULL, 11.36, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (11, 3.3, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.09, -25, N'Water Pulse', 30, NULL, NULL, 11.36, 39, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (12, 3.8, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.21, -25, N'Psybeam', 35, NULL, NULL, 11.51, 39, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (13, 2.7, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.25, 9.26, -25, N'Night Slash', 25, NULL, NULL, 11.57, 39, 35)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (14, 1.05, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.52, 7, N'Acid', 10, NULL, NULL, 11.9, 38, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (15, 1.05, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.52, 7, N'Ember', 10, NULL, NULL, 11.9, 38, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (16, 2.1, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.52, -25, N'Shadow Punch', 20, NULL, NULL, 11.9, 39, 33)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (17, 2.6, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.62, -25, N'Mud Bomb', 25, NULL, NULL, 12.02, 39, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (18, 2.6, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.62, -25, N'Sludge', 25, NULL, NULL, 12.02, 39, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (19, 3.6, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 9.72, -33, N'Giga Drain', 35, NULL, NULL, 12.15, 39, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (20, 0.7, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 10, 4, N'Spark', 7, NULL, NULL, 12.5, 38, 23)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (21, 0.7, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 10, 4, N'Sucker Punch', 7, NULL, NULL, 12.5, 38, 35)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (22, 1.45, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 10.34, 7, N'Razor Leaf', 15, NULL, NULL, 12.93, 38, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (23, 0.575, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 10.43, 4, N'Poison Sting', 6, NULL, NULL, 13.04, 38, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (24, 1.13, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 10.62, 7, N'Cut', 12, NULL, NULL, 13.27, 38, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (25, 4.2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 10.71, -33, N'Dazzling Gleam', 45, NULL, NULL, 13.39, 39, 37)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (26, 1.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 10.91, 7, N'Tackle', 12, NULL, NULL, 13.64, 38, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (27, 2.25, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.11, -25, N'Low Sweep', 25, NULL, NULL, 13.89, 39, 26)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (28, 2.7, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.11, -33, N'Drill Peck', 30, NULL, NULL, 13.89, 39, 29)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (29, 1.33, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.28, 4, N'Steel Wing', 15, NULL, NULL, 14.1, 38, 36)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (30, 3.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.29, -33, N'Rest', 35, NULL, NULL, 14.11, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (31, 3.6, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.33, -25, N'Ancient Power', 30, NULL, NULL, 10.42, 39, 32)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (32, 2.4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.33, -25, N'Brine', 20, NULL, NULL, 10.42, 39, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (33, 3, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.33, -25, N'Swift', 25, NULL, NULL, 10.42, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (34, 0.6, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.33, 7, N'Thunder Shock', 5, NULL, NULL, 10.42, 38, 23)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (35, 3.8, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 3.95, -20, N'Icy Wind', 15, NULL, NULL, 4.93, 39, 25)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (36, 3.7, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 4.05, -20, N'Wrap Pink', 15, NULL, NULL, 5.07, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (37, 3.7, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 4.05, -20, N'Wrap Green', 15, NULL, NULL, 5.07, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (38, 1.35, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 4.44, 9, N'Mud Slap', 6, NULL, NULL, 5.56, 38, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (39, 3.2, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 4.69, -20, N'Mega Drain', 15, NULL, NULL, 5.86, 39, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (40, 3.1, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 4.84, -20, N'Shadow Sneak', 15, NULL, NULL, 6.05, 39, 33)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (41, 3.9, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 5.13, -20, N'Disarming Voice', 20, NULL, NULL, 6.41, 39, 37)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (42, 2.8, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 5.36, -20, N'Draining Kiss', 15, NULL, NULL, 6.7, 39, 37)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (43, 2.7, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 5.56, -20, N'Twister', 15, NULL, NULL, 6.94, 39, 34)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (44, 2.4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 6.25, -20, N'Poison Fang', 15, NULL, NULL, 7.81, 39, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (45, 2.35, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 6.38, -20, N'Aqua Jet', 15, NULL, NULL, 7.98, 39, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (46, 3.1, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 6.45, -20, N'Flame Charge', 20, NULL, NULL, 8.06, 39, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (47, 2.3, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 6.52, 15, N'Bubble', 15, NULL, NULL, 8.15, 38, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (48, 2.1, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.14, -20, N'Parabolic Charge', 15, NULL, NULL, 8.93, 39, 23)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (49, 3.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.29, -33, N'Signal Beam', 35, NULL, NULL, 14.11, 39, 31)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (50, 2.1, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.14, -20, N'Vice Grip', 15, NULL, NULL, 8.93, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (51, 3.4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.25, 7.35, -25, N'Rock Tomb', 25, NULL, NULL, 9.19, 39, 32)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (52, 0.8, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.5, 7, N'Karate Chop', 6, NULL, NULL, 9.38, 38, 26)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (53, 0.4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.5, 12, N'Fury Cutter', 3, NULL, NULL, 9.38, 38, 31)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (54, 1.33, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.52, 7, N'Quick Attack', 10, NULL, NULL, 9.4, 38, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (55, 3.3, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.25, 7.58, -25, N'Air Cutter', 25, NULL, NULL, 9.47, 39, 29)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (56, 4.6, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.61, -25, N'Flame Wheel', 35, NULL, NULL, 9.51, 39, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (57, 5.8, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.76, -33, N'Dig', 45, NULL, NULL, 9.7, 39, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (58, 2.55, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.84, -25, N'Heart Stamp', 20, NULL, NULL, 9.8, 39, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (59, 1.51, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.95, 7, N'Confusion', 12, NULL, NULL, 9.93, 38, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (60, 3.1, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.06, -25, N'Ominous Wind', 25, NULL, NULL, 10.08, 39, 33)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (61, 1.23, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.13, 7, N'Splash', 10, NULL, NULL, 10.16, 38, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (62, 0.84, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.33, 4, N'Fire Fang', 7, NULL, NULL, 10.42, 38, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (63, 1.2, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.33, 7, N'Bullet Punch', 10, NULL, NULL, 10.42, 38, 36)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (64, 0.6, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 8.33, 7, N'Low Kick', 5, NULL, NULL, 10.42, 38, 26)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (65, 1.4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 7.14, 7, N'Ice Shard', 10, NULL, NULL, 8.93, 38, 25)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (66, 1.04, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.54, 7, N'Feint Attack', 12, NULL, NULL, 14.42, 38, 35)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (67, 4.25, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.76, -50, N'Bug Buzz', 50, NULL, NULL, 14.71, 39, 31)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (68, 3.4, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.25, 11.76, -33, N'Drill Run', 40, NULL, NULL, 14.71, 39, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (69, 3.8, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 15.79, -100, N'Hydro Pump', 60, NULL, NULL, 19.74, 39, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (70, 3.8, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 15.79, -100, N'Heat Wave', 60, NULL, NULL, 19.74, 39, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (71, 0.75, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 16, 7, N'Wing Attack', 12, NULL, NULL, 20, 38, 29)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (72, 2.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 16, -33, N'Discharge', 40, NULL, NULL, 20, 39, 23)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (73, 2.8, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.25, 16.07, -50, N'Leaf Blade', 45, NULL, NULL, 20.09, 39, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (74, 2.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 16.67, -33, N'Hyper Fang', 35, NULL, NULL, 20.83, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (75, 2.4, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 16.67, -33, N'Thunder Punch', 40, NULL, NULL, 20.83, 39, 23)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (76, 0.95, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 16.84, 7, N'Shadow Claw', 16, NULL, NULL, 21.05, 38, 33)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (77, 3.2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 17.19, -100, N'Megahorn', 55, NULL, NULL, 21.48, 39, 31)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (78, 2.9, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 17.24, -50, N'Play Rough', 50, NULL, NULL, 21.55, 39, 37)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (79, 2.9, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 17.24, -50, N'Flamethrower', 50, NULL, NULL, 21.55, 39, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (80, 3.4, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 17.65, -100, N'Sludge Wave', 60, NULL, NULL, 22.06, 39, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (81, 3.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.5, 17.74, -100, N'Stone Edge', 55, NULL, NULL, 22.18, 39, 32)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (82, 2.8, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 17.86, -50, N'Psychic', 50, NULL, NULL, 22.32, 39, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (83, 3.2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 15.63, -50, N'Petal Blizzard', 50, NULL, NULL, 19.53, 39, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (84, 2.7, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 18.52, -50, N'Thunderbolt', 50, NULL, NULL, 23.15, 39, 23)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (85, 3.2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 18.75, -100, N'Hurricane', 60, NULL, NULL, 23.44, 39, 29)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (86, 0.63, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 19.05, 7, N'Metal Claw', 12, NULL, NULL, 23.81, 38, 36)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (87, 2.6, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 19.23, -50, N'Sludge Bomb', 50, NULL, NULL, 24.04, 39, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (88, 0.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 20, 7, N'Water Gun', 10, NULL, NULL, 25, 38, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (89, 0.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 20, 7, N'Scratch', 10, NULL, NULL, 25, 38, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (90, 0.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 20, 7, N'Lick', 10, NULL, NULL, 25, 38, 33)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (91, 3, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 20, -100, N'Gunk Shot', 60, NULL, NULL, 25, 39, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (92, 2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 20, -33, N'Iron Head', 40, NULL, NULL, 25, 39, 36)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (93, 2.35, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 21.28, -50, N'Aqua Tail', 50, NULL, NULL, 26.6, 39, 22)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (94, 2.8, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.25, 21.43, -100, N'Power Whip', 60, NULL, NULL, 26.79, 39, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (95, 0.55, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 21.82, 7, N'Mud Shot', 12, NULL, NULL, 27.27, 38, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (96, 0.57, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 26.32, 7, N'Psycho Cut', 15, NULL, NULL, 32.89, 38, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (97, 1.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.25, 26.67, -50, N'Dragon Claw', 40, NULL, NULL, 33.33, 39, 34)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (98, 2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.25, 27.5, -100, N'Cross Chop', 55, NULL, NULL, 34.38, 39, 26)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (99, 1.6, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.25, 18.75, -33, N'Brick Break', 30, NULL, NULL, 23.44, 39, 26)
GO
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (100, 4, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 3.75, -20, N'Wrap', 15, NULL, NULL, 4.69, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (101, 3.9, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 15.38, -100, N'Blizzard', 60, NULL, NULL, 19.23, 39, 25)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (102, 4.3, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 15.12, -100, N'Thunder', 65, NULL, NULL, 18.9, 39, 23)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (103, 2.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.9, -25, N'Stomp', 25, NULL, NULL, 14.88, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (104, 2.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 11.9, -25, N'Flame Burst', 25, NULL, NULL, 14.88, 39, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (105, 0.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12, 7, N'Dragon Breath', 6, NULL, NULL, 15, 38, 34)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (106, 0.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12, 7, N'Bite', 6, NULL, NULL, 15, 38, 35)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (107, 2.8, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12.5, -33, N'Fire Punch', 35, NULL, NULL, 15.63, 39, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (108, 1.6, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12.5, -25, N'Bone Club', 20, NULL, NULL, 15.63, 39, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (109, 3.2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12.5, -33, N'Rock Slide', 40, NULL, NULL, 15.63, 39, 32)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (110, 2.4, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12.5, -33, N'Seed Bomb', 30, NULL, NULL, 15.63, 39, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (111, 3.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12.86, -33, N'Ice Punch', 45, NULL, NULL, 16.07, 39, 25)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (112, 3.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12.86, -33, N'Dark Pulse', 45, NULL, NULL, 16.07, 39, 35)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (113, 3.08, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 12.99, -33, N'Shadow Ball', 40, NULL, NULL, 16.23, 39, 33)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (114, 4.9, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 13.27, -100, N'Solar Beam', 65, NULL, NULL, 16.58, 39, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (115, 0.45, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 13.33, 7, N'Bug Bite', 6, NULL, NULL, 16.67, 38, 31)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (116, 1.5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.25, 13.33, -25, N'Cross Poison', 20, NULL, NULL, 16.67, 39, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (117, 0.65, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 15.38, 7, N'Vine Whip', 10, NULL, NULL, 19.23, 38, 24)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (118, 3.65, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 13.7, -50, N'Ice Beam', 50, NULL, NULL, 17.12, 39, 25)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (119, 2.9, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 13.79, -33, N'Power Gem', 40, NULL, NULL, 17.24, 39, 32)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (120, 3.6, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 13.89, -50, N'Dragon Pulse', 50, NULL, NULL, 17.36, 39, 34)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (121, 5, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14, -100, N'Hyper Beam', 70, NULL, NULL, 17.5, 39, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (122, 3.9, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.1, -33, N'Flash Cannon', 55, NULL, NULL, 17.63, 39, 36)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (123, 1.05, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.29, 4, N'Zen Headbutt', 15, NULL, NULL, 17.86, 38, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (124, 1.05, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.29, 7, N'Poison Jab', 15, NULL, NULL, 17.86, 38, 27)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (125, 2.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.29, -33, N'X Scissor', 30, NULL, NULL, 17.86, 39, 31)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (126, 2.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.29, -33, N'Submission', 30, NULL, NULL, 17.86, 39, 26)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (127, 4.2, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.29, -100, N'Earthquake', 60, NULL, NULL, 17.86, 39, 28)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (128, 4.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.63, -100, N'Fire Blast', 60, NULL, NULL, 18.29, 39, 21)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (129, 4.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.63, -100, N'Moonblast', 60, NULL, NULL, 18.29, 39, 37)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (130, 0.54, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.81, 7, N'Pound', 8, NULL, NULL, 18.52, 38, 20)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (131, 0.81, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.81, 7, N'Frost Breath', 12, NULL, NULL, 18.52, 38, 25)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (132, 2.7, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 14.81, -33, N'Psyshock', 40, NULL, NULL, 18.52, 39, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (133, 5.1, CAST(N'2016-09-12T00:55:09.6170473' AS DateTime2), NULL, 0.05, 13.73, -100, N'Psystrike', 70, NULL, NULL, 17.16, 39, 30)
INSERT [dbo].[Moves] ([Id], [Cooldown], [CreatedDate], [CreatedUserId], [CritChange], [DPS], [Energy], [Name], [Power], [UpdatedDate], [UpdatedUserId], [WithSTAB], [MoveCategoryId], [MoveType]) VALUES (134, 1.41, CAST(N'2016-09-12T00:55:09.6180476' AS DateTime2), NULL, 0.05, 3.55, 7, N'Rock Smash', 5, NULL, NULL, 4.43, 38, 26)
SET IDENTITY_INSERT [dbo].[Moves] OFF
SET IDENTITY_INSERT [dbo].[PageContents] ON 

INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (2, N'Content', N'Pokémon là tên của loạt trò chơi điện tử cũng như phim hoạt hình, truyện tranh,... được phân phối bởi Nintendo Nhật Bản, thuộc quyền sở hữu của The Pokémon Company và được phát triển bởi Tajiri Satoshi vào năm 1996. Hiện Pokémon đã trở thành một thương hiệu đang thịnh hành ở nhiều quốc gia khác trên thế giới và đã được chuyển thể thành các bộ anime, truyện tranh,... nhiều tập. Game Pokémon được phát triển bởi GameFreak và đã trở thành một trong những dòng game thành công và sinh lời thứ nhì thế giới, chỉ đứng sau Mario, vốn cũng thuộc Nintendo! Sản phẩm Pokémon bao gồm anime (phim hoạt hình), manga (truyện tranh), đồ chơi, sách và các phương tiện khác. Năm 2006, Pokémon tổ chức kỉ niệm 10 năm Pokémon đến với công chúng trên toàn thế giới.[4] Năm 2016, Pokémon tổ chức kỉ niệm 20 năm Pokemon ra đời và đến tay bạn bè thế giới, đây cũng là dịp để quảng bá nhiều sản phẩm như trading card game hay Pokemon Sun And Pokemon Moon,...
Năm 2016, Nintendo phát hành Pokémon GO và lập tức được sự đón nhận của người dân trên toàn thế giới. Trong Pokémon GO, bạn sẽ phải ra đường sau đó nhìn vào bản đồ và bắt Pokémon. Trong tuần đầu ra mắt, trò chơi đã thu hút hàng triệu người chơi tải về trên hệ điều hành Android và iOS.', CAST(N'2016-09-17T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (3, N'Content', N'Pokémon is a media franchise managed by The Pokémon Company, a Japanese consortium between Nintendo, Game Freak, and Creatures. While the franchise copyright is shared by all three companies, Nintendo is the sole owner of the trademark. he franchise was created by Satoshi Tajiri in 1995, and is centered on fictional creatures called "Pokémon", which humans, known as Pokémon Trainers, catch and train to battle each other for sport.

The franchise began as a pair of video games for the original Game Boy, developed by Game Freak and published by Nintendo. The franchise now spans video games, trading card games, animated television shows and movies, comic books, and toys. Pokémon is the second-most successful and lucrative video game-based media franchise in the world, behind only Nintendo''s Mario franchise.

Cumulative sales of the video games (including home console games, such as Hey You, Pikachu! for the Nintendo 64) have reached more than 279 million copies. In November 2005, 4Kids Entertainment, which had managed the non-game related licensing of Pokémon, announced that it had agreed not to renew the Pokémon representation agreement. Pokémon USA Inc. (now The Pokémon Company International), a subsidiary of Japan''s Pokémon Co., now oversees all Pokémon licensing outside of Asia. As of May 2016, the Pokémon media franchise has grossed revenues of ¥4.8 trillion worldwide (equivalent to 46.2 billion USD).

The franchise celebrated its tenth anniversary in 2006. The twentieth anniversary was celebrated with a commercial at the 2016 Super Bowl using the theme: "I can do that". 2016 marks the 20th anniversary of the release of the original games, with the company celebrating by airing an ad during Super Bowl 50, and issuing re-releases of Pokémon Red, Blue, and Yellow. The mobile augmented reality game Pokémon Go was released in July 2016. The next generation games Pokémon Sun and Moon are expected to be released on November 18, 2016 worldwide, except for Europe''s release date being on November 23, 2016. A live-action film adaptation based on Great Detective Pikachu is planned to start production in 2017. The English slogan for the franchise is "Gotta Catch ''Em All".', CAST(N'2016-09-17T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (4, N'Description', N'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun''s rays, the seed grows progressively larger.', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (5, N'Description', N'Trên lưng của Bulbasaur có một hạt giống có thể nở nhờ ánh sáng nên nó thường ngủ trưa dưới ánh mặt trời. 
', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (6, N'Species', N'Seed Pokémon
', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (7, N'Species', N'Pokémon Hạt Giống', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (8, N'Description', N'There is a bud on this Pokémon''s back. To support its weight, Ivysaur''s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it''s a sign that the bud will bloom into a large flower soon.', CAST(N'2016-10-03T00:51:16.0304459' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (9, N'Description', N'Sau khi tiến hoá từ Bulbasaur, hạt giống trên lưng trở thành nụ hoa. Vì vậy nó dành nhiều hơn thời gian dưới ánh mặt trời để tiến hoá.', CAST(N'2016-10-03T00:51:45.3305156' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (10, N'Species', N'Seed Pokémon
', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (13, N'Species', N'Pokemon Hạt Giống', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (14, N'Description', N'There is a large flower on Venusaur''s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower''s aroma soothes the emotions of people.', CAST(N'2016-10-03T01:07:23.7273035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (15, N'Description', N'Dạng tiến hoá cao nhất khi mà hạt giống trên lưng đã nở thành hoa.Hương thơm từ hoa có thể làm dịu cảm xúc khi hít phải.', CAST(N'2016-10-03T01:07:23.7273035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (16, N'Species', N'Seed Pokémon', CAST(N'2016-10-03T01:07:23.7273035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (17, N'Species', N'Pokémon Hạt Giống', CAST(N'2016-10-03T01:07:23.7273035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (18, N'Description', N'The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.', CAST(N'2016-10-03T01:07:23.8398026' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (19, N'Description', N'Ngọn lửa cháy trên đuôi biểu hiện cho cảm xúc của Charmander. Ngọn lửa nhấp nháy những lúc vui buồn hoặc cháy dữ dội khi chiến đấu.', CAST(N'2016-10-03T01:07:23.8398026' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (20, N'Species', N'Lizard Pokémon', CAST(N'2016-10-03T01:07:23.8398026' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (21, N'Species', N'Pokémon Thằn Lằn', CAST(N'2016-10-03T01:07:23.8398026' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (22, N'Description', N'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.', CAST(N'2016-10-03T01:07:23.9073017' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (23, N'Description', N'Charmeleon rất hiếu chiến với bộ vuốt sắc nhọn của nó. Ở trạng thái hưng phấn khi đối đầu với đối thủ mạnh, ngọn lửa trên đuôi của Charmeleon chuyển sang màu trắng xanh.', CAST(N'2016-10-03T01:07:23.9073017' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (24, N'Species', N'Flame Pokémon', CAST(N'2016-10-03T01:07:23.9073017' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (25, N'Species', N'Pokémon Lửa', CAST(N'2016-10-03T01:07:23.9073017' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (26, N'Description', N'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.', CAST(N'2016-10-03T01:07:23.9668016' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (27, N'Description', N'Charizard có khả năng bay lượn và luôn tìm những đối thủ mạnh mẽ hơn nó để chiến đấu. Nó có khả năng thổi ra những ngọn lửa với nhiệt độ cực cao và làm tan chảy tất cả.', CAST(N'2016-10-03T01:07:23.9668016' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (28, N'Species', N'Flame Pokémon', CAST(N'2016-10-03T01:07:23.9668016' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (29, N'Species', N'Pokémon Lửa', CAST(N'2016-10-03T01:07:23.9668016' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (30, N'Description', N'Squirtle''s shell is not merely used for protection. The shell''s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.', CAST(N'2016-10-03T01:07:24.0213023' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (31, N'Description', N'Mai của Squirtle ngoài khả năng phòng thủ còn giúp nó bơi lội cực nhanh trong nước bằng vào hình dáng tròn trịa của mình.', CAST(N'2016-10-03T01:07:24.0213023' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (32, N'Species', N'Tiny Turtle Pokémon', CAST(N'2016-10-03T01:07:24.0213023' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (33, N'Species', N'Pokémon Rùa Con', CAST(N'2016-10-03T01:07:24.0213023' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (34, N'Description', N'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon''s toughness as a battler.', CAST(N'2016-10-03T01:07:24.0818200' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (35, N'Description', N'Sau khi tiến hoá, đuôi của Wartortle lớn và dày hơn, đồng thời màu sắc của đuôi cũng đại diện cho tuổi thọ của nó. Bên cạnh đó, những vết sẹo trên mai cũng thể hiện cho chiến tích của nó qua những trận đấu.', CAST(N'2016-10-03T01:07:24.0818200' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (36, N'Species', N'Turtle Pokémon', CAST(N'2016-10-03T01:07:24.0818200' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (37, N'Species', N'Pokémon Rùa', CAST(N'2016-10-03T01:07:24.0818200' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (38, N'Description', N'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.', CAST(N'2016-10-03T01:07:24.1393056' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (39, N'Description', N'Blastoise có hai cây súng nước trên mai của nó với khả năng bắn ra nhưng viên đạn nước có độ chính xác cực cao và xa.', CAST(N'2016-10-03T01:07:24.1393056' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (40, N'Species', N'Shellfish Pokémon', CAST(N'2016-10-03T01:07:24.1393056' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (41, N'Species', N'Pokémon Giáp Xác', CAST(N'2016-10-03T01:07:24.1393056' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (42, N'Description', N'Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.', CAST(N'2016-10-03T01:07:24.2067214' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (43, N'Description', N'Caterpie rất tham ăn, nó có thể ăn lượng lá cây lớn hơn nó nhiều lần. Sừng của nó có khả năng toả ra mùi cực mạnh để xua đuổi pokémon khác.', CAST(N'2016-10-03T01:07:24.2067214' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (44, N'Species', N'Worm Pokémon', CAST(N'2016-10-03T01:07:24.2067214' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (45, N'Species', N'Pokémon Sâu', CAST(N'2016-10-03T01:07:24.2067214' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (46, N'Description', N'The shell covering this Pokémon’s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.', CAST(N'2016-10-03T01:07:24.2617318' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (47, N'Description', N'Metapod có lớp vỏ cứng như sắt. Nó rất ít di chuyển mà chờ đợi tới lúc tiến hoá sau này.', CAST(N'2016-10-03T01:07:24.2617318' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (48, N'Species', N'Cocoon Pokémon', CAST(N'2016-10-03T01:07:24.2617318' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (49, N'Species', N'Pokémon Nhộng', CAST(N'2016-10-03T01:07:24.2617318' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (50, N'Description', N'Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.', CAST(N'2016-10-03T01:07:24.3097129' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (51, N'Description', N'Butterfree rất giỏi trong việc tìm kiếm và thu thập mật hoa từ khoảng cách xa.', CAST(N'2016-10-03T01:07:24.3097129' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (52, N'Species', N'Butterfly Pokémon', CAST(N'2016-10-03T01:07:24.3097129' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (53, N'Species', N'Pokémon Bướm', CAST(N'2016-10-03T01:07:24.3097129' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (54, N'Description', N'Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).', CAST(N'2016-10-03T01:07:24.3656957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (55, N'Description', N'Weedle có khứa giác rất nhạy. Bằng cái mũi to tròn của mình nó có thể tìm kiếm những loại lá yêu thích.', CAST(N'2016-10-03T01:07:24.3656957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (56, N'Species', N'Hairy Bug Pokémon', CAST(N'2016-10-03T01:07:24.3656957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (57, N'Species', N'Pokémon Sâu Lông', CAST(N'2016-10-03T01:07:24.3656957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (58, N'Description', N'Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.', CAST(N'2016-10-03T01:07:24.4396922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (59, N'Description', N'Kakuna luôn treo mình trên cây để chuẩn bị tiến hoá. Quá trình tiến hoá càng lâu, vỏ của nó sẽ càng nóng.', CAST(N'2016-10-03T01:07:24.4396922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (60, N'Species', N'Cocoon Pokémon', CAST(N'2016-10-03T01:07:24.4396922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (61, N'Species', N'Pokémon Nhộng', CAST(N'2016-10-03T01:07:24.4396922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (62, N'Description', N'Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.', CAST(N'2016-10-03T01:07:24.4982030' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (63, N'Description', N'Beedrill trở nên cực kì nguy hiểm khi có người tiếp cận tổ của nó. Đáng sợ nhất là nó luôn tấn công theo bầy.', CAST(N'2016-10-03T01:07:24.4982030' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (64, N'Species', N'Poison Bee Pokémon', CAST(N'2016-10-03T01:07:24.4982030' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (65, N'Species', N'Pokémon Ong độc', CAST(N'2016-10-03T01:07:24.4982030' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (66, N'Description', N'Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.', CAST(N'2016-10-03T01:07:24.5652035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (67, N'Description', N'Pidgey có khả năng xác định phương hướng rất tốt giúp nó di chuyển khoảng cách xa mà không bị lac.', CAST(N'2016-10-03T01:07:24.5652035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (68, N'Species', N'Tiny Bird Pokémon', CAST(N'2016-10-03T01:07:24.5652035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (69, N'Species', N'Pokémon Chim Con', CAST(N'2016-10-03T01:07:24.5652035' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (70, N'Description', N'Pidgeotto claims a large area as its own territory. This Pokémon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.', CAST(N'2016-10-03T01:07:24.6316925' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (71, N'Description', N'Pidgeotto luôn chiếm một khu vực lãnh thổ rất rộng và luôn tấn công những kẻ xâm nhập bằng bộ móng sắc nhọn của nó.', CAST(N'2016-10-03T01:07:24.6316925' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (72, N'Species', N'Bird Pokémon', CAST(N'2016-10-03T01:07:24.6316925' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (73, N'Species', N'Pokémon Chim', CAST(N'2016-10-03T01:07:24.6316925' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (74, N'Description', N'This Pokémon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their Pokémon.', CAST(N'2016-10-03T01:07:24.7071935' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (75, N'Description', N'Pidgeot có một bộ lông rực rỡ với nhưng chiếc lông lộng lẫy. Đặc biệt là những chiếc lông trên đầu của nó khiến rất nhiều huấn luyện viên chọn Pidgeot trở thành pokémon của họ.', CAST(N'2016-10-03T01:07:24.7071935' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (76, N'Species', N'Bird Pokémon', CAST(N'2016-10-03T01:07:24.7071935' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (77, N'Species', N'Pokémon Chim', CAST(N'2016-10-03T01:07:24.7071935' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (78, N'Description', N'Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it lives—it will make its nest anywhere.', CAST(N'2016-10-03T01:07:24.7666922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (79, N'Description', N'Rattata cực kì cẩn thận và đề phòng xung quanh bằng đôi tai lớn của nó. Nó khá dễ tính và có thể sống ở bất cứ đâu.', CAST(N'2016-10-03T01:07:24.7666922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (80, N'Species', N'Mouse Pokémon', CAST(N'2016-10-03T01:07:24.7666922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (81, N'Species', N'Pokémon Chuột', CAST(N'2016-10-03T01:07:24.7666922' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (82, N'Description', N'Raticate’s sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.', CAST(N'2016-10-03T01:07:24.8491934' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (83, N'Description', N'Với cặp răng nanh lớn, Raticate có khả năng gặm nhấm gỗ, đá và thậm chí là bức tường nhà.', CAST(N'2016-10-03T01:07:24.8491934' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (84, N'Species', N'Mouse Pokémon', CAST(N'2016-10-03T01:07:24.8491934' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (85, N'Species', N'Pokémon Chuột', CAST(N'2016-10-03T01:07:24.8491934' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (86, N'Description', N'Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.', CAST(N'2016-10-03T01:07:24.9491939' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (87, N'Description', N'Spearow có tiếng kêu rất lớn nhằm cảnh báo nguy hiểm cho đồng loại của nó.', CAST(N'2016-10-03T01:07:24.9491939' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (88, N'Species', N'Tiny Bird Pokémon', CAST(N'2016-10-03T01:07:24.9491939' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (89, N'Species', N'Pokémon Chim Con', CAST(N'2016-10-03T01:07:24.9491939' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (90, N'Description', N'Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.', CAST(N'2016-10-03T01:07:25.0611130' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (91, N'Description', N'Fearow có cổ và đặc biệt là mỏ của nó khá dài giúp nó dễ dàng di chuyển và bắt mồi.', CAST(N'2016-10-03T01:07:25.0611130' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (92, N'Species', N'Beak Pokémon', CAST(N'2016-10-03T01:07:25.0611130' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (93, N'Species', N'Pokémon Chim', CAST(N'2016-10-03T01:07:25.0611130' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (94, N'Description', N'Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.', CAST(N'2016-10-03T01:07:25.3415269' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (95, N'Description', N'Ekans thường cuộn tròn lại nằm nghỉ đồng thời giúp nó phản ứng nhanh khi có nguy hiểm xung quanh.', CAST(N'2016-10-03T01:07:25.3415269' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (96, N'Species', N'Snake Pokémon', CAST(N'2016-10-03T01:07:25.3415269' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (97, N'Species', N'Pokémon Rắn', CAST(N'2016-10-03T01:07:25.3415269' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (98, N'Description', N'This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.', CAST(N'2016-10-03T01:07:25.4395836' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (99, N'Description', N'Bằng khả năng quấn chặt cực mạnh của mình,đối thủ của  Arbok gần như không thể thoát khỏi khi bị nó quấn phải.', CAST(N'2016-10-03T01:07:25.4395836' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (100, N'Species', N'Cobra Pokémon', CAST(N'2016-10-03T01:07:25.4395836' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (101, N'Species', N'Pokémon Rắn Hổ Mang', CAST(N'2016-10-03T01:07:25.4395836' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (102, N'Description', N'Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it''s evidence that this Pokémon mistook the intensity of its charge.', CAST(N'2016-10-03T01:07:25.5005837' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (103, N'Description', N'Pikachu thường thể hiện sự hứng thú của nó bằng các tia điện. Nếu bạn nhìn thì quả berry bị điện cháy đen thì chắc chắn là do Pikachu làm.', CAST(N'2016-10-03T01:07:25.5005837' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (104, N'Species', N'Mouse Pokémon', CAST(N'2016-10-03T01:07:25.5005837' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (105, N'Species', N'Pokémon Chuột', CAST(N'2016-10-03T01:07:25.5005837' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (106, N'Description', N'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon''s nest.', CAST(N'2016-10-03T01:07:25.5690827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (107, N'Description', N'Do có khả năng phóng điện mạnh nên mỗi khi dòng điện tích luỹ quá lớn, Raichu thường phóng thích dòng điện xuống đất qua cái đuôi bén nhọn của nó.', CAST(N'2016-10-03T01:07:25.5690827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (108, N'Species', N'Mouse Pokémon', CAST(N'2016-10-03T01:07:25.5690827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (109, N'Species', N'Pokémon Chuột', CAST(N'2016-10-03T01:07:25.5690827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (110, N'Description', N'Sandshrew''s body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.', CAST(N'2016-10-03T01:07:25.6360944' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (111, N'Description', N'Cơ thể của Sandshrew hấp thu nước tốt giúp nó có thể sinh sống trong khu vực sa mạc. Nó thường cuộn tròn cơ thể của mình khi phòng thủ.', CAST(N'2016-10-03T01:07:25.6360944' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (112, N'Species', N'Mouse Pokémon', CAST(N'2016-10-03T01:07:25.6360944' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (113, N'Species', N'Pokémon Chuột', CAST(N'2016-10-03T01:07:25.6360944' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (114, N'Description', N'Sandslash''s body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.', CAST(N'2016-10-03T01:07:25.7030868' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (115, N'Description', N'Sandslash có những cái gai bén nhọn giúp nó phòng thủ cũng như tấn công. Bộ gai của nó thường được thay thế mỗi năm một lần.', CAST(N'2016-10-03T01:07:25.7030868' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (116, N'Species', N'Mouse Pokémon', CAST(N'2016-10-03T01:07:25.7030868' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (117, N'Species', N'Pokémon Chuột', CAST(N'2016-10-03T01:07:25.7030868' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (118, N'Description', N'Nidoran♀ has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.', CAST(N'2016-10-03T01:07:25.7836893' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (119, N'Description', N'Nidoran♀ có những gai cực độc trên cơ thể để bảo vệ nó. Độc cũng có thể truyền từ sừng của nó khi tấn công.', CAST(N'2016-10-03T01:07:25.7836893' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (120, N'Species', N'Poison Pin Pokémon', CAST(N'2016-10-03T01:07:25.7836893' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (121, N'Species', N'Pokémon Gai Độc', CAST(N'2016-10-03T01:07:25.7836893' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (122, N'Description', N'When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.', CAST(N'2016-10-03T01:07:25.8617498' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (123, N'Description', N'Nidorina có khả năng thu lại những gai độc của mình khi ở cùng với đồng loại của mình. Nó thường khá lo lắng khi bị tách khỏi bầy của mình.', CAST(N'2016-10-03T01:07:25.8617498' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (124, N'Species', N'Poison Pin Pokémon', CAST(N'2016-10-03T01:07:25.8617498' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (125, N'Species', N'Pokémon Gai Độc', CAST(N'2016-10-03T01:07:25.8617498' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (126, N'Description', N'Nidoqueen''s body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.', CAST(N'2016-10-03T01:07:25.9418314' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (127, N'Description', N'Nidoqueen có cơ thể to lớn với bộ giáp cực kì cứng giúp nó dễ dàng húc bay đối thủ. Nidoqueen trở nên rất đáng sợ khi có kẻ đụng vào con của nó.', CAST(N'2016-10-03T01:07:25.9418314' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (128, N'Species', N'Drill Pokémon', CAST(N'2016-10-03T01:07:25.9418314' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (129, N'Species', N'Pokémon Mũi Khoan', CAST(N'2016-10-03T01:07:25.9418314' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (130, N'Description', N'Nidoran♂ has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon''s notice.', CAST(N'2016-10-03T01:07:26.0684806' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (131, N'Description', N'Nidoran♂ có đôi tai cực lớn giúp nó nhận biết xung quanh và di chuyển một cách an toàn.', CAST(N'2016-10-03T01:07:26.0684806' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (132, N'Species', N'Poison Pin Pokémon', CAST(N'2016-10-03T01:07:26.0684806' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (133, N'Species', N'Pokémon Gai Độc', CAST(N'2016-10-03T01:07:26.0684806' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (134, N'Description', N'Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.', CAST(N'2016-10-03T01:07:26.1639881' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (135, N'Description', N'Nidorino có sừng cứng hơn cả kim cương. Khi cảm thấy nguy hiểm, gai lưng của nó thường dựng lên để chiến đấu.', CAST(N'2016-10-03T01:07:26.1639881' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (136, N'Species', N'Poison Pin Pokémon', CAST(N'2016-10-03T01:07:26.1639881' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (137, N'Species', N'Pokémon Gai Độc', CAST(N'2016-10-03T01:07:26.1639881' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (138, N'Description', N'Nidoking''s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.', CAST(N'2016-10-03T01:07:26.2434556' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (139, N'Description', N'Với cái đuôi to lớn và mạnh mẽ có thể phá nát kim loại, rất ít pokémon có thể ngăn cản Nidoking khi nó nổi giận.', CAST(N'2016-10-03T01:07:26.2434556' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (140, N'Species', N'Drill Pokémon', CAST(N'2016-10-03T01:07:26.2434556' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (141, N'Species', N'Pokémon Mũi Khoan', CAST(N'2016-10-03T01:07:26.2434556' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (142, N'Description', N'On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.', CAST(N'2016-10-03T01:07:26.3355658' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (143, N'Description', N'Clefairy thường xuất hiện vào đêm trăng tròn để chơi cùng đồng bọn và trở về tổ khi bình minh đến.', CAST(N'2016-10-03T01:07:26.3355658' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (144, N'Species', N'Fairy Pokémon', CAST(N'2016-10-03T01:07:26.3355658' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (145, N'Species', N'Pokémon Tiên', CAST(N'2016-10-03T01:07:26.3355658' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (146, N'Description', N'Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step even lets it walk on water. It is known to take strolls on lakes on quiet, moonlit nights.', CAST(N'2016-10-03T01:07:26.4377195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (147, N'Description', N'Clefable có thể nhảy nhẹ nhàng bằng cặp cánh nhỏ của nó, kể cả trên nước. Nó thường đi dạo trên mặt hồ vào đêm trăng.', CAST(N'2016-10-03T01:07:26.4377195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (148, N'Species', N'Fairy Pokémon', CAST(N'2016-10-03T01:07:26.4377195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (149, N'Species', N'Pokémon Tiên', CAST(N'2016-10-03T01:07:26.4377195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (150, N'Description', N'At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its trainer. The six tails become magnificently curled.', CAST(N'2016-10-03T01:07:26.5188715' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (151, N'Description', N'Vulpix có một đuôi khi sinh ra và dần dần mọc tới sáu đuôi khi lớn. Đuôi của nó rất cong và đẹp.', CAST(N'2016-10-03T01:07:26.5188715' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (152, N'Species', N'Fox Pokémon', CAST(N'2016-10-03T01:07:26.5188715' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (153, N'Species', N'Pokémon Cáo', CAST(N'2016-10-03T01:07:26.5188715' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (154, N'Description', N'Ninetales casts a sinister light from its bright red eyes to gain total control over its foe''s mind. This Pokémon is said to live for one thousand years.', CAST(N'2016-10-03T01:07:26.5926525' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (155, N'Description', N'Đôi mắt của Ninetales có thể phóng ra ánh sáng với khả năng điều khiển đối thủ. Ninetales được cho là có khả năng sống tới một ngàn năm.', CAST(N'2016-10-03T01:07:26.5926525' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (156, N'Species', N'Fox Pokémon', CAST(N'2016-10-03T01:07:26.5926525' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (157, N'Species', N'Pokémon Cáo', CAST(N'2016-10-03T01:07:26.5926525' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (158, N'Description', N'Jigglypuff''s vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.', CAST(N'2016-10-03T01:07:26.6671391' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (159, N'Description', N'Bằng vào khả năng điều chỉnh giọng của mình, giọng hát của Jigglypuff có khả năng ru ngủ đối thủ.', CAST(N'2016-10-03T01:07:26.6671391' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (160, N'Species', N'Balloon Pokémon', CAST(N'2016-10-03T01:07:26.6671391' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (161, N'Species', N'Pokémon Bóng Bay', CAST(N'2016-10-03T01:07:26.6671391' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (162, N'Description', N'Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon''s eyes, it is quickly washed away.', CAST(N'2016-10-03T01:07:26.7709247' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (163, N'Description', N'Wigglytuff có đôi mắt đẹp to tròn với một lớp nước mắt bảo vệ mắt nó khỏi bụi bẩn.', CAST(N'2016-10-03T01:07:26.7709247' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (164, N'Species', N'Balloon Pokémon', CAST(N'2016-10-03T01:07:26.7709247' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (165, N'Species', N'Pokémon Bóng Bay', CAST(N'2016-10-03T01:07:26.7709247' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (166, N'Description', N'Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.', CAST(N'2016-10-03T01:07:26.8694309' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (167, N'Description', N'Zubat có thể bị thiêu cháy dưới ánh sáng mặt trời nên nó thường trốn trong bóng tối vào ban ngày.', CAST(N'2016-10-03T01:07:26.8694309' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (168, N'Species', N'Bat Pokémon', CAST(N'2016-10-03T01:07:26.8694309' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (169, N'Species', N'Pokémon Dơi', CAST(N'2016-10-03T01:07:26.8694309' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (170, N'Description', N'Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.', CAST(N'2016-10-03T01:07:26.9524128' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (171, N'Description', N'Golbat thường hút máu của động vật sống và nó thường hoạt động về đêm.', CAST(N'2016-10-03T01:07:26.9524128' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (172, N'Species', N'Bat Pokémon', CAST(N'2016-10-03T01:07:26.9524128' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (173, N'Species', N'Pokémon Dơi', CAST(N'2016-10-03T01:07:26.9524128' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (174, N'Description', N'During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.', CAST(N'2016-10-03T01:07:27.0484215' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (175, N'Description', N'Oddish thường chôn mình dưới đất để hấp thu chất dinh dưỡng. Càng nhiều chất dinh dưỡng được hấp thu, lá của nó càng sáng bóng.', CAST(N'2016-10-03T01:07:27.0484215' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (176, N'Species', N'Weed Pokémon', CAST(N'2016-10-03T01:07:27.0484215' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (177, N'Species', N'Pokémon Cỏ', CAST(N'2016-10-03T01:07:27.0484215' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (178, N'Description', N'Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.', CAST(N'2016-10-03T01:07:27.1264230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (179, N'Description', N'Khi cảm thấy nguy hiểm, Gloom phóng thích mùi hôi từ nhuỵ của nó để đe doạ kẻ thù.', CAST(N'2016-10-03T01:07:27.1264230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (180, N'Species', N'Weed Pokémon', CAST(N'2016-10-03T01:07:27.1264230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (181, N'Species', N'Pokémon Cỏ', CAST(N'2016-10-03T01:07:27.1264230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (182, N'Description', N'Vileplume''s toxic pollen triggers atrocious allergy attacks. That''s why it is advisable never to approach any attractive flowers in a jungle, however pretty they may be.', CAST(N'2016-10-03T01:07:27.2125123' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (183, N'Description', N'Vileplume thường thả ra phấn độc gây dịnh ứng mỗi khi bị tiếp cận từ bông hoa xinh đẹp trên đầu nó. Vì vậy, tốt nhất nên tránh xa các bông hoa lớn và đẹp trong rừng.', CAST(N'2016-10-03T01:07:27.2125123' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (184, N'Species', N'Flower Pokémon', CAST(N'2016-10-03T01:07:27.2125123' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (185, N'Species', N'Pokémon Hoa', CAST(N'2016-10-03T01:07:27.2125123' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (186, N'Description', N'Paras has parasitic mushrooms growing on its back called tochukaso. They grow large by drawing nutrients from this Bug Pokémon host. They are highly valued as a medicine for extending life.', CAST(N'2016-10-03T01:07:27.2910116' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (187, N'Description', N'Paras có hai cây nấm sống kí sinh trên lưng nó. Chúng lớn lên bằng chất dinh dưỡng Paras hút từ cây lớn và là vị thuốc có giá trị giúp kéo dài tuổi thọ.', CAST(N'2016-10-03T01:07:27.2910116' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (188, N'Species', N'Mushroom Pokémon', CAST(N'2016-10-03T01:07:27.2910116' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (189, N'Species', N'Pokémon Nấm', CAST(N'2016-10-03T01:07:27.2910116' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (190, N'Description', N'Parasect is known to infest large trees en masse and drain nutrients from the lower trunk and roots. When an infested tree dies, they move onto another tree all at once.', CAST(N'2016-10-03T01:07:27.3975872' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (191, N'Description', N'Parasect thường tàn phá các cây lớn bằng việc sống và hút chất dinh dưỡng từ các gốc cây.', CAST(N'2016-10-03T01:07:27.3975872' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (192, N'Species', N'Mushroom Pokémon', CAST(N'2016-10-03T01:07:27.3975872' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (193, N'Species', N'Pokémon Nấm', CAST(N'2016-10-03T01:07:27.3975872' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (194, N'Description', N'Venonat is said to have evolved with a coat of thin, stiff hair that covers its entire body for protection. It possesses large eyes that never fail to spot even miniscule prey.', CAST(N'2016-10-03T01:07:27.4880757' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (195, N'Description', N'Venonat có một bộ lông xù, mỏng và cứng giúp bảo vệ cơ thể của nó. Đôi mắt lớn giúp nó phát hiện con mồi dù rất nhỏ.', CAST(N'2016-10-03T01:07:27.4880757' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (196, N'Species', N'Insect Pokémon', CAST(N'2016-10-03T01:07:27.4880757' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (197, N'Species', N'Pokémon Côn Trùng', CAST(N'2016-10-03T01:07:27.4880757' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (198, N'Description', N'Venomoth is nocturnal—it is a Pokémon that only becomes active at night. Its favorite prey are small insects that gather around streetlights, attracted by the light in the darkness.', CAST(N'2016-10-03T01:07:27.5718728' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (199, N'Description', N'Venomoth sống về đêm và thường săn bắt côn trùng nhỏ. Nó thường bị hấp dẫn bởi những đốm ánh sáng vào ban đêm.', CAST(N'2016-10-03T01:07:27.5718728' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (200, N'Species', N'Poison Moth Pokémon', CAST(N'2016-10-03T01:07:27.5718728' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (201, N'Species', N'Pokémon Bướm Đêm', CAST(N'2016-10-03T01:07:27.5718728' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (202, N'Description', N'Diglett are raised in most farms. The reason is simple—wherever this Pokémon burrows, the soil is left perfectly tilled for planting crops. This soil is made ideal for growing delicious vegetables.', CAST(N'2016-10-03T01:07:27.6563840' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (203, N'Description', N'Diglett thường chôn mình dưới đất và sống trong các trang trại. Nhờ có nó mà đất rất màu mỡ và thích hợp để trồng cây.', CAST(N'2016-10-03T01:07:27.6563840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (204, N'Species', N'Mole Pokémon', CAST(N'2016-10-03T01:07:27.6563840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (205, N'Species', N'Pokémon Chuột Chũi', CAST(N'2016-10-03T01:07:27.6563840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (206, N'Description', N'Dugtrio are actually triplets that emerged from one body. As a result, each triplet thinks exactly like the other two triplets. They work cooperatively to burrow endlessly.', CAST(N'2016-10-03T01:07:27.7480610' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (207, N'Description', N'Dugtrio có ba đầu trên một cơ thể giúp nó phối hợp đào đất nhanh hơn.', CAST(N'2016-10-03T01:07:27.7480610' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (208, N'Species', N'Mole Pokémon', CAST(N'2016-10-03T01:07:27.7480610' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (209, N'Species', N'Pokémon Chuột Chũi', CAST(N'2016-10-03T01:07:27.7480610' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (210, N'Description', N'Meowth withdraws its sharp claws into its paws to slinkily sneak about without making any incriminating footsteps. For some reason, this Pokémon loves shiny coins that glitter with light.', CAST(N'2016-10-03T01:07:27.8394378' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (211, N'Description', N'Meowth thu bộ vuốt của nó lại để di chuyển nhẹ nhàng hơn. Nó rất thích các đồng tiền sáng lấp lánh.', CAST(N'2016-10-03T01:07:27.8394378' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (212, N'Species', N'Scratch Cat Pokémon', CAST(N'2016-10-03T01:07:27.8394378' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (213, N'Species', N'Pokémon Mèo Cào', CAST(N'2016-10-03T01:07:27.8394378' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (214, N'Description', N'Persian has six bold whiskers that give it a look of toughness. The whiskers sense air movements to determine what is in the Pokémon''s surrounding vicinity. It becomes docile if grabbed by the whiskers.', CAST(N'2016-10-03T01:07:27.9329366' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (215, N'Description', N'Bộ ria của Persian giúp nó trông mạnh mẽ hơn và giúp nó cảm nhận không khí xung quanh. Nhưng bộ ria cũng là điểm yếu của nó khi bị chạm vào.', CAST(N'2016-10-03T01:07:27.9329366' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (216, N'Species', N'Classy Cat Pokémon', CAST(N'2016-10-03T01:07:27.9329366' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (217, N'Species', N'Pokémon Mèo', CAST(N'2016-10-03T01:07:27.9329366' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (218, N'Description', N'Psyduck uses a mysterious power. When it does so, this Pokémon generates brain waves that are supposedly only seen in sleepers. This discovery spurred controversy among scholars.', CAST(N'2016-10-03T01:07:28.5750186' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (219, N'Description', N'Psyduck có năng lực bí ẩn phát ra sóng não chỉ xuất hiện khi ngủ. Nhưng điều này còn gây tranh cãi khá nhiều giữa các nhà nghiên cứu.', CAST(N'2016-10-03T01:07:28.5750186' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (220, N'Species', N'Duck Pokémon', CAST(N'2016-10-03T01:07:28.5750186' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (221, N'Species', N'Pokémon Vịt', CAST(N'2016-10-03T01:07:28.5750186' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (222, N'Description', N'The webbed flippers on its forelegs and hind legs and the streamlined body of Golduck give it frightening speed. The Pokémon is definitely much faster than even the most athletic swimmer.', CAST(N'2016-10-03T01:07:28.7055090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (223, N'Description', N'Màng tay, chân và cơ thể dạng thuỷ động học giúp Golduck bơi rất nhanh dưới nước.', CAST(N'2016-10-03T01:07:28.7055090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (224, N'Species', N'Duck Pokémon', CAST(N'2016-10-03T01:07:28.7055090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (225, N'Species', N'Pokémon Vịt', CAST(N'2016-10-03T01:07:28.7055090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (226, N'Description', N'When Mankey starts shaking and its nasal breathing turns rough, it''s a sure sign that it is becoming angry. However, because it goes into a towering rage almost instantly, it is impossible for anyone to flee its wrath.', CAST(N'2016-10-03T01:07:28.7975003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (227, N'Description', N'Thở mạnh là dấu hiệu cho thấy Mankey đang nổi giận. Không có bất cứ ai có thể thoát khỏi cơn thịnh nộ của nó.', CAST(N'2016-10-03T01:07:28.7975003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (228, N'Species', N'Pig Monkey Pokémon', CAST(N'2016-10-03T01:07:28.7975003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (229, N'Species', N'Pokémon Khỉ Heo', CAST(N'2016-10-03T01:07:28.7975003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (230, N'Description', N'When Primeape becomes furious, its blood circulation is boosted. In turn, its muscles are made even stronger. However, it also becomes much less intelligent at the same time.', CAST(N'2016-10-03T01:07:28.8915085' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (231, N'Description', N'Khi Primeape nổi giận, máu trong cơ thể nó vận chuyển nhanh hơn làm tăng sức mạnh cơ bắp nhưng cũng khiến nó trở nên khá ngu ngốc.', CAST(N'2016-10-03T01:07:28.8915085' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (232, N'Species', N'Pig Monkey Pokémon', CAST(N'2016-10-03T01:07:28.8915085' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (233, N'Species', N'Pokémon Khỉ Heo', CAST(N'2016-10-03T01:07:28.8915085' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (234, N'Description', N'Growlithe has a superb sense of smell. Once it smells anything, this Pokémon won''t forget the scent, no matter what. It uses its advanced olfactory sense to determine the emotions of other living things.', CAST(N'2016-10-03T01:07:29.0005512' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (235, N'Description', N'Growlithe có khả năng đánh hơi và ghi nhớ mùi mạnh mẽ. Khứu giác của nó còn có khả năng nhận biết được cảm xúc của sinh vật sống khác.', CAST(N'2016-10-03T01:07:29.0005512' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (236, N'Species', N'Puppy Pokémon', CAST(N'2016-10-03T01:07:29.0005512' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (237, N'Species', N'Pokémon Chó Con', CAST(N'2016-10-03T01:07:29.0005512' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (238, N'Description', N'Arcanine is known for its high speed. It is said to be capable of running over 6,200 miles in a single day and night. The fire that blazes wildly within this Pokémon''s body is its source of power.', CAST(N'2016-10-03T01:07:29.1094447' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (239, N'Description', N'Arcanine được biết đến với khả năng chạy kì nhanh dựa vào nguồn năng lượng lửa bên trong cơ thể nó.', CAST(N'2016-10-03T01:07:29.1094447' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (240, N'Species', N'Legendary Pokémon', CAST(N'2016-10-03T01:07:29.1094447' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (241, N'Species', N'Pokémon Huyền Thoại', CAST(N'2016-10-03T01:07:29.1094447' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (242, N'Description', N'Poliwag has a very thin skin. It is possible to see the Pokémon''s spiral innards right through the skin. Despite its thinness, however, the skin is also very flexible. Even sharp fangs bounce right off it.', CAST(N'2016-10-03T01:07:29.2099994' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (243, N'Description', N'Poliwag có da mỏng nhưng cũng rất mềm dẻo đủ để giúp nó chống lại những chiếc răng nanh bén nhọn.', CAST(N'2016-10-03T01:07:29.2099994' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (244, N'Species', N'Tadpole Pokémon', CAST(N'2016-10-03T01:07:29.2099994' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (245, N'Species', N'Pokémon Nòng Nọc', CAST(N'2016-10-03T01:07:29.2099994' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (246, N'Description', N'The surface of Poliwhirl''s body is always wet and slick with an oily fluid. Because of this greasy covering, it can easily slip and slide out of the clutches of any enemy in battle.', CAST(N'2016-10-03T01:07:29.3400669' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (247, N'Description', N'Bề mặt da của Poliwhirl khá trơn và nhầy giúp nó có thể trượt và tránh đòn dễ dàng trong chiến đấu.', CAST(N'2016-10-03T01:07:29.3400669' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (248, N'Species', N'Tadpole Pokémon', CAST(N'2016-10-03T01:07:29.3400669' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (249, N'Species', N'Pokémon Nòng Nọc', CAST(N'2016-10-03T01:07:29.3400669' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (250, N'Description', N'Poliwrath''s highly developed, brawny muscles never grow fatigued, however much it exercises. It is so tirelessly strong, this Pokémon can swim back and forth across the ocean without effort.', CAST(N'2016-10-03T01:07:29.4426003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (251, N'Description', N'Poliwrath có cơ bắp cực kì mạnh mẽ và không biết mệt mỏi giúp nó có thể dễ dàng bơi xuyên đại dương.', CAST(N'2016-10-03T01:07:29.4426003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (252, N'Species', N'Tadpole Pokémon', CAST(N'2016-10-03T01:07:29.4426003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (253, N'Species', N'Pokémon Nòng Nọc', CAST(N'2016-10-03T01:07:29.4426003' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (254, N'Description', N'Abra sleeps for eighteen hours a day. However, it can sense the presence of foes even while it is sleeping. In such a situation, this Pokémon immediately teleports to safety.', CAST(N'2016-10-03T01:07:29.5446120' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (255, N'Description', N'Abra ngủ 18 giờ một ngày nhưng nó vẫn có thể cảm nhận nguy hiểm xung quanh và dịch chuyển để bỏ chạy.', CAST(N'2016-10-03T01:07:29.5446120' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (256, N'Species', N'Psi Pokémon', CAST(N'2016-10-03T01:07:29.5446120' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (257, N'Species', N'Pokémon Tâm Linh', CAST(N'2016-10-03T01:07:29.5446120' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (258, N'Description', N'Kadabra emits a peculiar alpha wave if it develops a headache. Only those people with a particularly strong psyche can hope to become a trainer of this Pokémon.', CAST(N'2016-10-03T01:07:29.6445397' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (259, N'Description', N'Kadabra luôn phát ra một luồng sóng alpha xung quanh nó gây nhức đầu cho người khác. Vì vậy, chỉ có những nhà huấn luyện có năng lực tâm linh mạnh mẽ mới điều khiển được nó.', CAST(N'2016-10-03T01:07:29.6445397' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (260, N'Species', N'Psi Pokémon', CAST(N'2016-10-03T01:07:29.6445397' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (261, N'Species', N'Pokémon Tâm Linh', CAST(N'2016-10-03T01:07:29.6445397' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (262, N'Description', N'Alakazam''s brain continually grows, making its head far too heavy to support with its neck. This Pokémon holds its head up using its psychokinetic power instead.', CAST(N'2016-10-03T01:07:29.7530423' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (263, N'Description', N'Não của Alakazam phát triển liên tục khiến cho đầu ngày càng to ra đến mức nó phải dùng năng lực tâm linh để nâng đầu lên.', CAST(N'2016-10-03T01:07:29.7530423' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (264, N'Species', N'Psi Pokémon', CAST(N'2016-10-03T01:07:29.7530423' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (265, N'Species', N'Pokémon Tâm Linh', CAST(N'2016-10-03T01:07:29.7530423' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (266, N'Description', N'Machop''s muscles are special—they never get sore no matter how much they are used in exercise. This Pokémon has sufficient power to hurl a hundred adult humans.', CAST(N'2016-10-03T01:07:29.8606195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (267, N'Description', N'Cơ bắp của Machop không bao giờ cảm thấy mệt mỏi trong khi sức mạnh của nó đủ để nâng hàng trăm người.', CAST(N'2016-10-03T01:07:29.8606195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (268, N'Species', N'Superpower Pokémon', CAST(N'2016-10-03T01:07:29.8606195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (269, N'Species', N'Pokémon Sức Mạnh', CAST(N'2016-10-03T01:07:29.8606195' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (270, N'Description', N'Machoke''s thoroughly toned muscles possess the hardness of steel. This Pokémon has so much strength, it can easily hold aloft a sumo wrestler on just one finger.', CAST(N'2016-10-03T01:07:29.9702840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (271, N'Description', N'Machoke luôn rèn luyện cơ bắp của nó trở nên cứng như thép. Nó có thể dễ dàng nâng một Sumo chỉ bằng một ngón tay.', CAST(N'2016-10-03T01:07:29.9702840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (272, N'Species', N'Superpower Pokémon', CAST(N'2016-10-03T01:07:29.9702840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (273, N'Species', N'Pokémon Sức Mạnh', CAST(N'2016-10-03T01:07:29.9702840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (274, N'Description', N'Machamp has the power to hurl anything aside. However, trying to do any work requiring care and dexterity causes its arms to get tangled. This Pokémon tends to leap into action before it thinks.', CAST(N'2016-10-03T01:07:30.0738720' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (275, N'Description', N'Machamp có đủ sức mạnh để quăng bất cứ thứ gì. Nhưng do có bốn tay mà không suy nghĩ trước khi làm khiến tay của nó thường vướng với nhau.', CAST(N'2016-10-03T01:07:30.0738720' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (276, N'Species', N'Superpower Pokémon', CAST(N'2016-10-03T01:07:30.0738720' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (277, N'Species', N'Pokémon Sức Mạnh', CAST(N'2016-10-03T01:07:30.0738720' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (278, N'Description', N'Bellsprout''s thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, this Pokémon spits a corrosive fluid that melts even iron.', CAST(N'2016-10-03T01:07:30.1972754' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (279, N'Description', N'Với cơ thể nhỏ và mêm dẽo, Bellsprout có thể dễ dàng né tránh các đòn đánh. Còn miệng của nó thì có khả năng phun ra chất dịch có thể ăn mòn cả sắt.', CAST(N'2016-10-03T01:07:30.1972754' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (280, N'Species', N'Flower Pokémon', CAST(N'2016-10-03T01:07:30.1972754' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (281, N'Species', N'Pokémon Hoa', CAST(N'2016-10-03T01:07:30.1972754' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (282, N'Description', N'Weepinbell has a large hook on its rear end. At night, the Pokémon hooks on to a tree branch and goes to sleep. If it moves around in its sleep, it may wake up to find itself on the ground.', CAST(N'2016-10-03T01:07:30.3073535' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (283, N'Description', N'Weepinbell có một cái móc nhỏ trên đầu giúp nó treo lơ lửng trên cây khi ngủ. Dù nó cỏ thể dễ dàng rơi xuống đất khi nhúc nhích.', CAST(N'2016-10-03T01:07:30.3073535' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (284, N'Species', N'Flycatcher Pokémon', CAST(N'2016-10-03T01:07:30.3073535' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (285, N'Species', N'Pokémon Đớp Ruồi', CAST(N'2016-10-03T01:07:30.3073535' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (286, N'Description', N'Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this Pokémon swallows it whole.', CAST(N'2016-10-03T01:07:30.4242830' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (287, N'Description', N'Victreebel có những sợi dây leo dài trên đầu giúp nó hấp dẫn con mồi và nuốt chửng chúng.', CAST(N'2016-10-03T01:07:30.4242830' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (288, N'Species', N'Flycatcher Pokémon', CAST(N'2016-10-03T01:07:30.4242830' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (289, N'Species', N'Pokémon Đớp Ruồi', CAST(N'2016-10-03T01:07:30.4242830' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (290, N'Description', N'Tentacool''s body is largely composed of water. If it is removed from the sea, it dries up like parchment. If this Pokémon happens to become dehydrated, put it back into the sea.', CAST(N'2016-10-03T01:07:30.5347699' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (291, N'Description', N'Cơ thể của Tentacool được cấu thành từ nước và dễ dàng khô lại rong không khí nên chúng chỉ có thể sống dưới biển.', CAST(N'2016-10-03T01:07:30.5347699' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (292, N'Species', N'Jellyfish Pokémon', CAST(N'2016-10-03T01:07:30.5347699' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (293, N'Species', N'Pokémon Sứa', CAST(N'2016-10-03T01:07:30.5347699' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (294, N'Description', N'Tentacruel has large red orbs on its head. The orbs glow before lashing the vicinity with a harsh ultrasonic blast. This Pokémon''s outburst creates rough waves around it.', CAST(N'2016-10-03T01:07:30.6397705' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (295, N'Description', N'Hai quả cầu trên đầu Tentacruel có khả năng phát ra sóng siêu âm cực mạnh để tấn công đối thủ xung quanh.', CAST(N'2016-10-03T01:07:30.6397705' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (296, N'Species', N'Jellyfish Pokémon', CAST(N'2016-10-03T01:07:30.6397705' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (297, N'Species', N'Pokémon Sứa', CAST(N'2016-10-03T01:07:30.6397705' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (298, N'Description', N'The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this Pokémon''s heart will remain hard, craggy, and rough always.', CAST(N'2016-10-03T01:07:30.7519710' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (299, N'Description', N'Geodude sống càng lâu thì cơ thể nó càng trở nên trơn và tròn.', CAST(N'2016-10-03T01:07:30.7519710' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (300, N'Species', N'Rock Pokémon', CAST(N'2016-10-03T01:07:30.7519710' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (301, N'Species', N'Pokémon Đá', CAST(N'2016-10-03T01:07:30.7519710' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (302, N'Description', N'Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This Pokémon eats its way through a ton of rocks on a daily basis.', CAST(N'2016-10-03T01:07:30.8604788' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (303, N'Description', N'Graveler dùng đá làm thức ăn và ăn một lượng lớn mỗi ngày. Món yêu thích của nó là đá có rêu.', CAST(N'2016-10-03T01:07:30.8604788' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (304, N'Species', N'Rock Pokémon', CAST(N'2016-10-03T01:07:30.8604788' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (305, N'Species', N'Pokémon Đá', CAST(N'2016-10-03T01:07:30.8604788' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (306, N'Description', N'Golem live up on mountains. If there is a large earthquake, these Pokémon will come rolling down off the mountains en masse to the foothills below.', CAST(N'2016-10-03T01:07:30.9745007' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (307, N'Description', N'Golem thường sống trên núi. Do ảnh hưởng của động đất mà chúng có thể lăn xuống núi và tàn phá tất cả trên đường đi.', CAST(N'2016-10-03T01:07:30.9745007' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (308, N'Species', N'Megaton Pokémon', CAST(N'2016-10-03T01:07:30.9745007' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (309, N'Species', N'Pokémon Siêu Trọng', CAST(N'2016-10-03T01:07:30.9745007' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (310, N'Description', N'Ponyta is very weak at birth. It can barely stand up. This Pokémon becomes stronger by stumbling and falling to keep up with its parent.', CAST(N'2016-10-03T01:07:31.0949875' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (311, N'Description', N'Ponyta khá yếu khi còn nhỏ và dần trở nên mạnh hơn sau nhiều cố gắng để chạy theo mẹ của chúng.', CAST(N'2016-10-03T01:07:31.0949875' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (312, N'Species', N'Fire Horse Pokémon', CAST(N'2016-10-03T01:07:31.0949875' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (313, N'Species', N'Pokémon Ngựa Lửa', CAST(N'2016-10-03T01:07:31.0949875' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (314, N'Description', N'Rapidash usually can be seen casually cantering in the fields and plains. However, when this Pokémon turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph.', CAST(N'2016-10-03T01:07:31.2265410' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (315, N'Description', N'Rapidash thường xuất hiện tại cánh đồng hoặc thảo nguyên. Chúng có thể phi cực nhanh bằng vào năng lượng toả ra từ cái bờm đầy lửa của mình.', CAST(N'2016-10-03T01:07:31.2265410' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (316, N'Species', N'Fire Horse Pokémon', CAST(N'2016-10-03T01:07:31.2265410' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (317, N'Species', N'Pokémon Ngựa Lửa', CAST(N'2016-10-03T01:07:31.2265410' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (318, N'Description', N'Slowpoke uses its tail to catch prey by dipping it in water at the side of a river. However, this Pokémon often forgets what it''s doing and often spends entire days just loafing at water''s edge.', CAST(N'2016-10-03T01:07:31.3432383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (319, N'Description', N'Slowpoke dùng đuôi của nó để bắt cá nhưng nó rất hay quên và thường nằm cả ngày bên bờ sông.', CAST(N'2016-10-03T01:07:31.3432383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (320, N'Species', N'Dopey Pokémon', CAST(N'2016-10-03T01:07:31.3432383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (321, N'Species', N'Pokémon Ngốc', CAST(N'2016-10-03T01:07:31.3432383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (322, N'Description', N'Slowbro''s tail has a Shellder firmly attached with a bite. As a result, the tail can''t be used for fishing anymore. This causes Slowbro to grudgingly swim and catch prey instead.', CAST(N'2016-10-03T01:07:31.4608000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (323, N'Description', N'Slowpoke tiến hoá thành Slowbro sau khi bị Shellder cắn vào đuôi nó. Vì vậy, nó không thể câu cá nữa mà phải tự bơi đi kiếm ăn.', CAST(N'2016-10-03T01:07:31.4608000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (324, N'Species', N'Hermit Crab Pokémon', CAST(N'2016-10-03T01:07:31.4608000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (325, N'Species', N'Pokémon Cua', CAST(N'2016-10-03T01:07:31.4608000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (326, N'Description', N'Magnemite attaches itself to power lines to feed on electricity. If your house has a power outage, check your circuit breakers. You may find a large number of this Pokémon clinging to the breaker box.', CAST(N'2016-10-03T01:07:31.7351890' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (327, N'Description', N'Magnemite sống dựa trên các nguồn điện nên chúng thường bám vào các đường đây điện hoặc cấu chì.', CAST(N'2016-10-03T01:07:31.7351890' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (328, N'Species', N'Magnet Pokémon', CAST(N'2016-10-03T01:07:31.7351890' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (329, N'Species', N'Pokémon Nam Châm', CAST(N'2016-10-03T01:07:31.7351890' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (330, N'Description', N'Magneton emits a powerful magnetic force that is fatal to mechanical devices. As a result, large cities sound sirens to warn citizens of large-scale outbreaks of this Pokémon.', CAST(N'2016-10-03T01:07:31.8520681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (331, N'Description', N'Magneton thường phóng ra các luồng từ tính mạng làm nhiễu sóng radio và gây hại tới các thiết bị điện tử.', CAST(N'2016-10-03T01:07:31.8520681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (332, N'Species', N'Magnet Pokémon', CAST(N'2016-10-03T01:07:31.8520681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (333, N'Species', N'Pokémon Nam Châm', CAST(N'2016-10-03T01:07:31.8520681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (334, N'Description', N'Farfetch''d is always seen with a stalk from a plant of some sort. Apparently, there are good stalks and bad stalks. This Pokémon has been known to fight with others over stalks.', CAST(N'2016-10-03T01:07:31.9950383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (335, N'Description', N'Farfetch''d thường cầm một cây hành bên người để ăn cũng như làm vũ khí.', CAST(N'2016-10-03T01:07:31.9950383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (336, N'Species', N'Wild Duck Pokémon', CAST(N'2016-10-03T01:07:31.9950383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (337, N'Species', N'PokémonVịt', CAST(N'2016-10-03T01:07:31.9950383' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (338, N'Description', N'Doduo''s two heads never sleep at the same time. Its two heads take turns sleeping, so one head can always keep watch for enemies while the other one sleeps.', CAST(N'2016-10-03T01:07:32.1103364' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (339, N'Description', N'Hai đầu của Doduo luôn thay nhau ngủ để đề phòng kẻ thù xung quanh.', CAST(N'2016-10-03T01:07:32.1103364' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (340, N'Species', N'Twin Bird Pokémon', CAST(N'2016-10-03T01:07:32.1103364' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (341, N'Species', N'Pokémon Song Điểu', CAST(N'2016-10-03T01:07:32.1103364' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (342, N'Description', N'Watch out if Dodrio''s three heads are looking in three separate directions. It''s a sure sign that it is on its guard. Don''t go near this Pokémon if it''s being wary-it may decide to peck you.', CAST(N'2016-10-03T01:07:32.2293426' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (343, N'Description', N'Khi mà ba đầu của Dodrio nhìn theo ba hướng khác nhau thì tốt nhất không nên lại gần vì chúng đang rất cảnh giác xung quanh và có thể tấn công bạn.', CAST(N'2016-10-03T01:07:32.2293426' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (344, N'Species', N'Triple Bird Pokémon', CAST(N'2016-10-03T01:07:32.2293426' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (345, N'Species', N'Pokémon Tam Điểu', CAST(N'2016-10-03T01:07:32.2293426' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (346, N'Description', N'Seel hunts for prey in the frigid sea underneath sheets of ice. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head.', CAST(N'2016-10-03T01:07:32.3548470' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (347, N'Description', N'Seel thích sống và bơi trong môi trường lạnh. Chiếc sừng nhô ra ở đầu nó rất cứng và có thể xuyên thủng lớp băng dày.', CAST(N'2016-10-03T01:07:32.3548470' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (348, N'Species', N'Sea Lion Pokémon', CAST(N'2016-10-03T01:07:32.3548470' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (349, N'Species', N'Pokémon Sư Tử Biển', CAST(N'2016-10-03T01:07:32.3548470' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (350, N'Description', N'Dewgong loves to snooze on bitterly cold ice. The sight of this Pokémon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago.', CAST(N'2016-10-03T01:07:32.4803891' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (351, N'Description', N'Dewgong thích ngủ trong môi trường băng lạnh. Thỉnh thoảng nó nằm trên những tảng băng trôi và từng bị nhìn nhầm là nàng tiên cá bởi các thủy thủ.', CAST(N'2016-10-03T01:07:32.4803891' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (352, N'Species', N'Sea Lion Pokémon', CAST(N'2016-10-03T01:07:32.4803891' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (353, N'Species', N'Pokémon Sư Tử Biển', CAST(N'2016-10-03T01:07:32.4803891' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (354, N'Description', N'Grimer''s sludgy and rubbery body can be forced through any opening, however small it may be. This Pokémon enters sewer pipes to drink filthy wastewater.', CAST(N'2016-10-03T01:07:32.6057827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (355, N'Description', N'Cơ thể nhớt nhợt của Grimer có thể lách qua bất cứ khe hở nào, cho dù nó có nhỏ đến đâu. Nó thích uống nước thải từ các cống rãnh.', CAST(N'2016-10-03T01:07:32.6057827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (356, N'Species', N'Sludge Pokémon', CAST(N'2016-10-03T01:07:32.6057827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (357, N'Species', N'Pokémon Bùn', CAST(N'2016-10-03T01:07:32.6057827' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (358, N'Description', N'From Muk''s body seeps a foul fluid that gives off a nose-bendingly horrible stench. Just one drop of this Pokémon''s body fluid can turn a pool stagnant and rancid.', CAST(N'2016-10-03T01:07:32.7307932' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (359, N'Description', N'Toàn bộ cơ thể của Muk được bao quanh bởi một lớp bùn quánh độc hại. Chỉ một giọt dịch cơ thể của nó cũng đủ làm ô nhiễm một hồ nước.', CAST(N'2016-10-03T01:07:32.7307932' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (360, N'Species', N'Sludge Pokémon', CAST(N'2016-10-03T01:07:32.7307932' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (361, N'Species', N'Pokémon Bùn', CAST(N'2016-10-03T01:07:32.7307932' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (362, N'Description', N'At night, this Pokémon uses its broad tongue to burrow a hole in the seafloor sand and then sleep in it. While it is sleeping, Shellder closes its shell, but leaves its tongue hanging out.', CAST(N'2016-10-03T01:07:32.8567826' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (363, N'Description', N'Vỏ của Shellder cứng hơn cả kim cương, có thể chịu được mọi đòn tấn công. Vào ban đêm, nó dùng chiếc lưỡi để đào một hốc nhỏ trên bề mặt đáy biển để ngủ.', CAST(N'2016-10-03T01:07:32.8567826' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (364, N'Species', N'Bivalve Pokémon', CAST(N'2016-10-03T01:07:32.8567826' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (365, N'Species', N'Pokémon Vỏ Sò', CAST(N'2016-10-03T01:07:32.8567826' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (366, N'Description', N'Cloyster is capable of swimming in the sea. It does so by swallowing water, then jetting it out toward the rear. This Pokémon shoots spikes from its shell using the same system.', CAST(N'2016-10-03T01:07:33.0042838' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (367, N'Description', N'Cloyster bơi bằng cách hút nước vào cơ thể rồi bơm ra ngoài theo các rãnh trên vỏ. Nó bắn các gai cũng bằng cơ chế này.', CAST(N'2016-10-03T01:07:33.0042838' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (368, N'Species', N'Bivalve Pokémon', CAST(N'2016-10-03T01:07:33.0042838' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (369, N'Species', N'Pokémon Vỏ Sò', CAST(N'2016-10-03T01:07:33.0042838' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (370, N'Description', N'Gastly is largely composed of gaseous matter. When exposed to a strong wind, the gaseous body quickly dwindles away. Groups of this Pokémon cluster under the eaves of houses to escape the ravages of wind.', CAST(N'2016-10-03T01:07:33.1345677' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (371, N'Description', N'Phần lớn cơ thể của Gastly là các loại khí gas. Nhưng vì vậy mà nó cũng có thể bị gió cuốn đi.', CAST(N'2016-10-03T01:07:33.1345677' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (372, N'Species', N'Gas Pokémon', CAST(N'2016-10-03T01:07:33.1345677' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (373, N'Species', N'Pokémon Khí Độc', CAST(N'2016-10-03T01:07:33.1345677' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (374, N'Description', N'Haunter is a dangerous Pokémon. If one beckons you while floating in darkness, you must never approach it. This Pokémon will try to lick you with its tongue and steal your life away.', CAST(N'2016-10-03T01:07:33.2650684' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (375, N'Description', N'Haunter truy tìm nạn nhân của nó trong bóng tố và rút sức sống của đối phương bằng cách liếm họ với cái lưỡi bằng khí gas.', CAST(N'2016-10-03T01:07:33.2650684' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (376, N'Species', N'Gas Pokémon', CAST(N'2016-10-03T01:07:33.2650684' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (377, N'Species', N'Pokémon Khí Độc', CAST(N'2016-10-03T01:07:33.2650684' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (378, N'Description', N'Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly and startlingly overtake you. It is actually a Gengar running past you, pretending to be your shadow.', CAST(N'2016-10-03T01:07:33.3995689' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (379, N'Description', N'Vào buổi tối, Gengar có sở thích bắt chước cử động của bóng người và cười đắc chí khi thấy nạn nhân sợ hãi.', CAST(N'2016-10-03T01:07:33.3995689' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (380, N'Species', N'Shadow Pokémon', CAST(N'2016-10-03T01:07:33.3995689' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (381, N'Species', N'Pokémon Bóng', CAST(N'2016-10-03T01:07:33.3995689' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (382, N'Description', N'Onix has a magnet in its brain. It acts as a compass so that this Pokémon does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.', CAST(N'2016-10-03T01:07:33.5345681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (383, N'Description', N'Có một thỏi nam châm trong não Onix giúp nó định hướng khi đào hầm. Càng đào nhiều cơ thể Onix càng trở nên tròn và nhẵn.', CAST(N'2016-10-03T01:07:33.5345681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (384, N'Species', N'Rock Snake Pokémon', CAST(N'2016-10-03T01:07:33.5345681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (385, N'Species', N'Pokémon Rắn Đá', CAST(N'2016-10-03T01:07:33.5345681' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (386, N'Description', N'If your nose becomes itchy while you are sleeping, it''s a sure sign that one of these Pokémon is standing above your pillow and trying to eat you dream through your nostrils.', CAST(N'2016-10-03T01:07:33.6641840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (387, N'Description', N'Nếu bạn cảm thấy ngứa mũi khi đang ngủ, đó là dấu hiệu chắc chắn rằng Drowzee đang đứng trên gối và cố ăn giấc mơ của bạn thông qua mũi.', CAST(N'2016-10-03T01:07:33.6641840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (388, N'Species', N'Hypnosis Pokémon', CAST(N'2016-10-03T01:07:33.6641840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (389, N'Species', N'Pokémon Thôi Miên', CAST(N'2016-10-03T01:07:33.6641840' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (390, N'Description', N'Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokémon searches for prey, it polishes the pendulum.', CAST(N'2016-10-03T01:07:33.8011773' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (391, N'Description', N'Chuyển động hình vòng cung cùng ánh lấp lánh của quả lắc đưa đối thủ vào trạng thái bị thôi miên sâu. Khi Pokémon này đi săn mồi, nó đánh bóng quả lắc của mình.', CAST(N'2016-10-03T01:07:33.8011773' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (392, N'Species', N'Hypnosis Pokémon', CAST(N'2016-10-03T01:07:33.8011773' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (393, N'Species', N'Pokémon Thôi Miên', CAST(N'2016-10-03T01:07:33.8011773' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (394, N'Description', N'Krabby live on beaches, burrowed inside holes dug into the sand. On sandy beaches with little in the way of food, these Pokémon can be seen squabbling with each other over territory.', CAST(N'2016-10-03T01:07:33.9366820' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (395, N'Description', N'Krabby sống ở biển, bờ biển và vùi mình vào lỗ được đào sâu vào lớp cát. Ở những bãi biển nhiều cát nơi có ít thức ăn, người ta có thể nhìn thấy Krabby đánh nhau giành lãnh thổ.', CAST(N'2016-10-03T01:07:33.9366820' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (396, N'Species', N'River Crab Pokémon', CAST(N'2016-10-03T01:07:33.9366820' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (397, N'Species', N'Pokémon Cua Sông', CAST(N'2016-10-03T01:07:33.9366820' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (398, N'Description', N'Kingler has an enormous, oversized claw. It waves this huge claw in the air to communicate with others. However, because the claw is so heavy, the Pokémon quickly tires.', CAST(N'2016-10-03T01:07:34.0786737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (399, N'Description', N'Kingler vẫy chiếc càng to để giao tiếp với nhau, nhưng vì nó quá nặng nên Pokémon này nhanh chóng bị mệt.', CAST(N'2016-10-03T01:07:34.0786737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (400, N'Species', N'Pincer Pokémon', CAST(N'2016-10-03T01:07:34.0786737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (401, N'Species', N'Pokémon Càng', CAST(N'2016-10-03T01:07:34.0786737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (402, N'Description', N'Voltorb was first sighted at a company that manufactures Poké Balls. The link between that sighting and the fact that this Pokémon looks very similar to a Poké Ball remains a mystery.', CAST(N'2016-10-03T01:07:34.2205081' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (403, N'Description', N'Voltorb được nhìn thấy lần đầu tiên ở một công ty chế tạo Poké Ball. Việc hình dáng của Pokémon này rất giống Poké Ball vẫn còn là một bí ẩn.', CAST(N'2016-10-03T01:07:34.2205081' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (404, N'Species', N'Ball Pokémon', CAST(N'2016-10-03T01:07:34.2205081' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (405, N'Species', N'Pokémon Bóng', CAST(N'2016-10-03T01:07:34.2205081' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (406, N'Description', N'Electrode eats electricity in the atmosphere. On days when lightning strikes, you can see this Pokémon exploding all over the place from eating too much electricity.', CAST(N'2016-10-03T01:07:34.3619965' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (407, N'Description', N'Pokémon này ăn điện trong bầu khí quyển. Vào những ngày có sấm sét, bạn có thể nhìn thấy Electrode phát nổ khắp mọi nơi vì ăn quá nhiều điện.', CAST(N'2016-10-03T01:07:34.3619965' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (408, N'Species', N'Ball Pokémon', CAST(N'2016-10-03T01:07:34.3619965' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (409, N'Species', N'Pokémon Bóng', CAST(N'2016-10-03T01:07:34.3619965' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (410, N'Description', N'This Pokémon consists of six eggs that form a closely knit cluster. The six eggs attract each other and spin around. When cracks increasingly appear on the eggs, Exeggcute is close to evolution.', CAST(N'2016-10-03T01:07:34.4995065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (411, N'Description', N'Những chiếc đầu của Exeggcute thu hút lẫn nhau và phải có 6 chiếc đầu để nó giữ thăng bằng. Càng có nhiều vết nứt xuất hiện trên vỏ là dấu hiệu cho thấy Exeggcute sắp tiến hóa.', CAST(N'2016-10-03T01:07:34.4995065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (412, N'Species', N'Egg Pokémon', CAST(N'2016-10-03T01:07:34.4995065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (413, N'Species', N'Pokémon Trứng', CAST(N'2016-10-03T01:07:34.4995065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (414, N'Description', N'Exeggutor originally came from the tropics. Its heads steadily grow larger from exposure to strong sunlight. It is said that when the heads fall off, they group together to form Exeggcute.', CAST(N'2016-10-03T01:07:34.6360080' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (415, N'Description', N'Exeggutor có nguồn gốc từ vùng nhiệt đới. Những chiếc đầu của nó lớn lên từ từ khi được tiếp xúc với ánh nắng mặt trời.', CAST(N'2016-10-03T01:07:34.6360080' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (416, N'Species', N'Coconut Pokémon', CAST(N'2016-10-03T01:07:34.6360080' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (417, N'Species', N'Pokémon Dừa', CAST(N'2016-10-03T01:07:34.6360080' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (418, N'Description', N'Cubone pines for the mother it will never see again. Seeing a likeness of its mother in the full moon, it cries. The stains on the skull the Pokémon wears are made by the tears it sheds.', CAST(N'2016-10-03T01:07:34.7804194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (419, N'Description', N'Cubone đội hộp sọ của người mẹ đã mất như một chiếc mũ. Tiếng kêu của nó dội trong hộp sọ và phát ra thành một giai điệu buồn bã.', CAST(N'2016-10-03T01:07:34.7804194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (420, N'Species', N'Lonely Pokémon', CAST(N'2016-10-03T01:07:34.7804194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (421, N'Species', N'Pokémon Cô Độc', CAST(N'2016-10-03T01:07:34.7804194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (422, N'Description', N'Marowak is the evolved form of a Cubone that has overcome its sadness at the loss of its mother and grown tough. This Pokémon''s tempered and hardened spirit is not easily broken.', CAST(N'2016-10-03T01:07:34.9319184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (423, N'Description', N'Cubone đã vượt qua nỗi đau mất mẹ và trở nên mạnh mẽ hơn tiến hóa thành Marowak. Tinh thần đã được tôi luyện của Pokémon này không dễ bị phá vỡ.', CAST(N'2016-10-03T01:07:34.9319184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (424, N'Species', N'Bone Keeper Pokémon', CAST(N'2016-10-03T01:07:34.9319184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (425, N'Species', N'Pokémon Giữ Xương', CAST(N'2016-10-03T01:07:34.9319184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (426, N'Description', N'Hitmonlee''s legs freely contract and stretch. Using these springlike legs, it bowls over foes with devastating kicks. After battle, it rubs down its legs and loosens the muscles to overcome fatigue.', CAST(N'2016-10-03T01:07:35.1015468' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (427, N'Description', N'Khi chiến đấu Hitmonlee tung cước với sức công phá lớn liên tục về phía đối thủ. Nó thậm chí còn kéo dài chân thêm để tấn công nếu đối thủ bỏ chạy.', CAST(N'2016-10-03T01:07:35.1015468' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (428, N'Species', N'Kicking Pokémon', CAST(N'2016-10-03T01:07:35.1015468' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (429, N'Species', N'Pokémon Cước Phá', CAST(N'2016-10-03T01:07:35.1015468' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (430, N'Description', N'Hitmonchan is said to possess the spirit of a boxer who had been working toward a world championship. This Pokémon has an indomitable spirit and will never give up in the face of adversity.', CAST(N'2016-10-03T01:07:35.2476261' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (431, N'Description', N'Người ta nói rằng Hitmonchan sở hữu tinh thần của một võ sĩ đám bốc chuyên nghiệp với mục tiêu vô địch thế giới và không bao giờ bỏ cuộc dù gặp khó khăn.', CAST(N'2016-10-03T01:07:35.2476261' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (432, N'Species', N'Punching Pokémon', CAST(N'2016-10-03T01:07:35.2476261' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (433, N'Species', N'Pokémon Nắm Đấm', CAST(N'2016-10-03T01:07:35.2476261' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (434, N'Description', N'Whenever Lickitung comes across something new, it will unfailingly give it a lick. It does so because it memorizes things by texture and by taste. It is somewhat put off by sour things.', CAST(N'2016-10-03T01:07:35.3976090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (435, N'Description', N'Khi gặp điều gì mới mẻ, Lickitung đều liếm nó vì Pokémon này ghi nhớ vật thể bằng kết cấu và mùi vị. Tuy vậy nó lại sợ vị chua.', CAST(N'2016-10-03T01:07:35.3976090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (436, N'Species', N'Licking Pokémon', CAST(N'2016-10-03T01:07:35.3976090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (437, N'Species', N'Pokémon Liếm Láp', CAST(N'2016-10-03T01:07:35.3976090' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (438, N'Description', N'If Koffing becomes agitated, it raises the toxicity of its internal gases and then jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.', CAST(N'2016-10-03T01:07:35.5491169' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (439, N'Description', N'Nếu Koffing cảm thấy bị khích động, nó sẽ gia tăng hàm lượng độc tố của khí gas rồi xả ra từ khắp cơ thể. Pokémon này có thể bơm phồng cơ thể mình và phát nổ.', CAST(N'2016-10-03T01:07:35.5491169' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (440, N'Species', N'Poison Gas Pokémon', CAST(N'2016-10-03T01:07:35.5491169' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (441, N'Species', N'Pokémon Khí Độc', CAST(N'2016-10-03T01:07:35.5491169' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (442, N'Description', N'Weezing loves the gases given off by rotted kitchen garbage. This Pokémon will find a dirty, unkempt house and make it its home. At night, when the people in the house are asleep, it will go through the trash.', CAST(N'2016-10-03T01:07:35.6921055' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (443, N'Description', N'Weezing sống và phát triển nhờ hấp thụ bụi, vi trùng và khí gas có trong các chất thải độc hại và rác. Khi Weezing hít khí độc từ rác, cơ thể Pokémon này căng phồng lên và bên trong cơ thể nó bốc mùi khủng khiếp.', CAST(N'2016-10-03T01:07:35.6921055' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (444, N'Species', N'Poison Gas Pokémon', CAST(N'2016-10-03T01:07:35.6921055' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (445, N'Species', N'Pokémon Khí Độc', CAST(N'2016-10-03T01:07:35.6921055' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (446, N'Description', N'Rhyhorn runs in a straight line, smashing everything in its path. It is not bothered even if it rushes headlong into a block of steel. This Pokémon may feel some pain from the collision the next day, however.', CAST(N'2016-10-03T01:07:35.8411069' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (447, N'Description', N'Rhyhorn chỉ có thể nhằm một hướng mà lao đi. Nếu có chướng ngại trên đường, Rhyhorn cũng không thèm để ý mà cứ xông thẳng vào, thậm chí đó có là một khối thép.', CAST(N'2016-10-03T01:07:35.8411069' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (448, N'Species', N'Spikes Pokémon', CAST(N'2016-10-03T01:07:35.8411069' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (449, N'Species', N'Pokémon Gai Góc', CAST(N'2016-10-03T01:07:35.8411069' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (450, N'Description', N'Rhydon''s horn can crush even uncut diamonds. One sweeping blow of its tail can topple a building. This Pokémon''s hide is extremely tough. Even direct cannon hits don''t leave a scratch.', CAST(N'2016-10-03T01:07:35.9916235' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (451, N'Description', N'Bằng cách xoay chiếc sừng giống chiếc mũi khoan, nó có thể cắt cả kim cương thô. Nó thường dùng chiếc sừng để khoan đá mở đường đi. Một cú quất đuôi của Rhydon có thể đánh sập một tòa nhà cao tầng.', CAST(N'2016-10-03T01:07:35.9916235' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (452, N'Species', N'Drill Pokémon', CAST(N'2016-10-03T01:07:35.9916235' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (453, N'Species', N'Pokémon Mũi Khoan', CAST(N'2016-10-03T01:07:35.9916235' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (454, N'Description', N'Chansey lays nutritionally excellent eggs on an everyday basis. The eggs are so delicious, they are easily and eagerly devoured by even those people who have lost their appetite.', CAST(N'2016-10-03T01:07:36.1421230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (455, N'Description', N'Chansey đẻ ra những quả trứng đầy dinh dưỡng mỗi ngày. Trứng hấp dẫn đến nỗi dễ dàng làm người chán ăn cũng phải ghiền.', CAST(N'2016-10-03T01:07:36.1421230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (456, N'Species', N'Egg Pokémon', CAST(N'2016-10-03T01:07:36.1421230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (457, N'Species', N'Pokémon Trứng', CAST(N'2016-10-03T01:07:36.1421230' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (458, N'Description', N'Tangela''s vines snap off easily if they are grabbed. This happens without pain, allowing it to make a quick getaway. The lost vines are replaced by newly grown vines the very next day.', CAST(N'2016-10-03T01:07:36.2911065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (459, N'Description', N'Khi bị tác động, rễ trên người Tangela rất dễ đứt ra. Việc này không gây đau đớn cho Tangela và giúp nó tẩu thoát nhanh chóng. Những rễ bị mất sẽ được rễ mới mọc thế chỗ ngay hôm sau.', CAST(N'2016-10-03T01:07:36.2911065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (460, N'Species', N'Vine Pokémon', CAST(N'2016-10-03T01:07:36.2911065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (461, N'Species', N'Pokémon Dây Leo', CAST(N'2016-10-03T01:07:36.2911065' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (462, N'Description', N'If you come across a young Kangaskhan playing by itself, you must never disturb it or attempt to catch it. The baby Pokémon''s parent is sure to be in the area, and it will become violently enraged at you.', CAST(N'2016-10-03T01:07:36.4423099' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (463, N'Description', N'Nếu bạn có bắt gặp một con Kangaskhan non đang chơi một mình, đừng bao giờ làm phiền hay có ý định bắt nó, vì chắc chắn Kangaskhan mẹ đang ở gần đấy, và nó sẽ nổi khùng với bạn.', CAST(N'2016-10-03T01:07:36.4423099' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (464, N'Species', N'Parent Pokémon', CAST(N'2016-10-03T01:07:36.4423099' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (465, N'Species', N'Pokémon Phụ Mẫu', CAST(N'2016-10-03T01:07:36.4423099' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (466, N'Description', N'Horsea eats small insects and moss off of rocks. If the ocean current turns fast, this Pokémon anchors itself by wrapping its tail around rocks or coral to prevent being washed away.', CAST(N'2016-10-03T01:07:36.6018000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (467, N'Description', N'Horsea ăn côn trùng và tảo trong kẽ đá. Nếu dòng hải lưu của biển chảy nhanh hơn, Pokémon này neo mình lại bằng cách cuốn đuôi vào đá hay san hô để tránh bị cuốn trôi.', CAST(N'2016-10-03T01:07:36.6018000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (468, N'Species', N'Dragon Pokémon', CAST(N'2016-10-03T01:07:36.6018000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (469, N'Species', N'Pokémon Rồng', CAST(N'2016-10-03T01:07:36.6018000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (470, N'Description', N'Seadra sleeps after wriggling itself between the branches of coral. Those trying to harvest coral are occasionally stung by this Pokémon''s poison barbs if they fail to notice it.', CAST(N'2016-10-03T01:07:36.7613076' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (471, N'Description', N'Seadra thường móc đuôi vào san hô để giữ cơ thể cố định khi ngủ. Những người đánh bắt san hô thường bị gai độc của Pokémon này đâm trúng nếu không để ý.', CAST(N'2016-10-03T01:07:36.7613076' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (472, N'Species', N'Dragon Pokémon', CAST(N'2016-10-03T01:07:36.7613076' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (473, N'Species', N'Pokémon Rồng', CAST(N'2016-10-03T01:07:36.7613076' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (474, N'Description', N'Goldeen is a very beautiful Pokémon with fins that billow elegantly in water. However, don''t let your guard down around this Pokémon—it could ram you powerfully with its horn.', CAST(N'2016-10-03T01:07:36.9198093' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (475, N'Description', N'Goldeen là một Pokémon đẹp đẽ nhưng đừng vì vậy mà mất cảnh giác với nó vì nó có thể đâm bạn rất mạnh với chiếc sừng của mình.', CAST(N'2016-10-03T01:07:36.9198093' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (476, N'Species', N'Goldfish Pokémon', CAST(N'2016-10-03T01:07:36.9198093' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (477, N'Species', N'Pokémon Cá Vàng', CAST(N'2016-10-03T01:07:36.9198093' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (478, N'Description', N'In the autumn, Seaking males can be seen performing courtship dances in riverbeds to woo females. During this season, this Pokémon''s body coloration is at its most beautiful.', CAST(N'2016-10-03T01:07:37.0772963' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (479, N'Description', N'Vào mùa thu, Seaking trống có thể bị bắt gặp lúc đang biểu diễn điệu nhảy tán tỉnh ở đáy sông để ve vãn cá mái. Vào mùa này, màu sắc cơ thể của Seaking trở nên rực rỡ hơn bao giờ hết.', CAST(N'2016-10-03T01:07:37.0772963' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (480, N'Species', N'Goldfish Pokémon', CAST(N'2016-10-03T01:07:37.0772963' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (481, N'Species', N'Pokémon Cá Vàng', CAST(N'2016-10-03T01:07:37.0772963' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (482, N'Description', N'Staryu''s center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.', CAST(N'2016-10-03T01:07:37.2372961' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (483, N'Description', N'Vào ban đêm, phần lõi trung tâm của Staryu phát ra ánh đỏ kì lạ. Nếu bạn đến biển vào khoảng cuối mùa hè, bạn sẽ thấy phần lõi phát sáng của Pokémon này trông giống như các ngôi sao.', CAST(N'2016-10-03T01:07:37.2372961' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (484, N'Species', N'Star Shape Pokémon', CAST(N'2016-10-03T01:07:37.2372961' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (485, N'Species', N'Pokémon Hình Sao', CAST(N'2016-10-03T01:07:37.2372961' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (486, N'Description', N'Starmie''s center section-the core-glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname "the gem of the sea."', CAST(N'2016-10-03T01:07:37.3957957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (487, N'Description', N'Phần lõi của Starmie phát sáng bảy sắc. Một số người xem phần lõi này là đá quý. Vì có tập tính phát sáng nên Pokémon này có biệt danh “Viên Đá Quý Của Biển”.', CAST(N'2016-10-03T01:07:37.3957957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (488, N'Species', N'Mysterious Pokémon', CAST(N'2016-10-03T01:07:37.3957957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (489, N'Species', N'Pokémon Bí Ẩn', CAST(N'2016-10-03T01:07:37.3957957' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (490, N'Description', N'Mr. Mime is a master of pantomime. Its gestures and motions convince watchers that something unseeable actually exists. Once the watchers are convinced, the unseeable thing exists as if it were real.', CAST(N'2016-10-03T01:07:37.5548077' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (491, N'Description', N'Mr.Mime luôn ra sức luyện tập kịch câm. Nó làm kẻ thù tin có gì đó tồn tại xung quanh mình. Một khi kẻ địch đã tin thì vật đó sẽ tồn tại giống như thật vậy.', CAST(N'2016-10-03T01:07:37.5548077' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (492, N'Species', N'Barrier Pokémon', CAST(N'2016-10-03T01:07:37.5548077' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (493, N'Species', N'Pokémon Kết Giới', CAST(N'2016-10-03T01:07:37.5548077' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (494, N'Description', N'Scyther is blindingly fast. Its blazing speed enhances the effectiveness of the twin scythes on its forearms. This Pokémon''s scythes are so effective, they can slice through thick logs in one wicked stroke.', CAST(N'2016-10-03T01:07:37.7143623' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (495, N'Description', N'Tốc độ kinh khủng của Scyther giúp tăng độ hiệu quả của hai lưỡi hái. Chúng có thể chém đứt khúc gỗ dày chỉ với một lần ra đòn và gần như không thể né được cặp lưỡi hái này.', CAST(N'2016-10-03T01:07:37.7143623' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (496, N'Species', N'Mantis Pokémon', CAST(N'2016-10-03T01:07:37.7143623' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (497, N'Species', N'Pokémon Bọ Ngựa', CAST(N'2016-10-03T01:07:37.7143623' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (498, N'Description', N'Jynx walks rhythmically, swaying and shaking its hips as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without giving any thought to what they are doing.', CAST(N'2016-10-03T01:07:37.8833737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (499, N'Description', N'Pokémon này có thể khiến mọi người nhảy đồng bộ với nó vì cảm xúc Jynx thể hiện khi nhảy có sức mời gọi rất cao, người nhảy gần như không ý thức được việc họ đang làm.', CAST(N'2016-10-03T01:07:37.8833737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (500, N'Species', N'Human Shape Pokémon', CAST(N'2016-10-03T01:07:37.8833737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (501, N'Species', N'Pokémon Nhân Dạng', CAST(N'2016-10-03T01:07:37.8833737' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (502, N'Description', N'When a storm arrives, gangs of this Pokémon compete with each other to scale heights that are likely to be stricken by lightning bolts. Some towns use Electabuzz in place of lightning rods.', CAST(N'2016-10-03T01:07:38.0533643' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (503, N'Description', N'Khi có bão sấm, từng nhóm Pokémon này tranh nhau leo lên những nơi dễ bị sét đánh nhất để ăn điện. Một vài thị trấn dùng Electabuzz thay cột thu lôi.', CAST(N'2016-10-03T01:07:38.0533643' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (504, N'Species', N'Electric Pokémon', CAST(N'2016-10-03T01:07:38.0533643' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (505, N'Species', N'Pokémon Điện', CAST(N'2016-10-03T01:07:38.0533643' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (506, N'Description', N'In battle, Magmar blows out intensely hot flames from all over its body to intimidate its opponent. This Pokémon''s fiery bursts create heat waves that ignite grass and trees in its surroundings.', CAST(N'2016-10-03T01:07:38.2228645' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (507, N'Description', N'Khi chiến đấu, Magmar phun lửa nóng từ toàn bộ cơ thể để làm kẻ thù khiếp sợ. Các vụ nổ lửa của Magmar sản sinh sóng nhiệt, có thể kích nổ thực vật trong khu vực lân cận.', CAST(N'2016-10-03T01:07:38.2228645' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (508, N'Species', N'Spitfire Pokémon', CAST(N'2016-10-03T01:07:38.2228645' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (509, N'Species', N'Pokémon Phun Lửa', CAST(N'2016-10-03T01:07:38.2228645' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (510, N'Description', N'Pinsir is astoundingly strong. It can grip a foe weighing twice its weight in its horns and easily lift it. This Pokémon''s movements turn sluggish in cold places.', CAST(N'2016-10-03T01:07:38.3828626' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (511, N'Description', N'Pinsir có thể kẹp một đối thủ nặng gấp đôi người nó bằng sừng và nhấc lên dễ dàng. Pokémon này săn mồi bằng cách kẹp chặt con mồi trong cặp sừng và ép mạnh.', CAST(N'2016-10-03T01:07:38.3828626' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (512, N'Species', N'Stag Beetle Pokémon', CAST(N'2016-10-03T01:07:38.3828626' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (513, N'Species', N'Pokémon Bọ Cánh Cứng', CAST(N'2016-10-03T01:07:38.3828626' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (514, N'Description', N'This Pokémon is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself.', CAST(N'2016-10-03T01:07:38.5470984' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (515, N'Description', N'Tauros chiến đấu với nhau bằng cách khóa sừng để chứng tỏ sức mạnh. Nếu không có đối thủ để chiến đấu, Tauros sẽ húc đổ cây cối để bình tâm lại.', CAST(N'2016-10-03T01:07:38.5470984' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (516, N'Species', N'Wild Bull Pokémon', CAST(N'2016-10-03T01:07:38.5470984' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (517, N'Species', N'Pokémon Bò Hoang', CAST(N'2016-10-03T01:07:38.5470984' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (518, N'Description', N'Magikarp is a pathetic excuse for a Pokémon that is only capable of flopping and splashing. This behavior prompted scientists to undertake research into it.', CAST(N'2016-10-03T01:07:38.7166229' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (519, N'Description', N'Magikarp là một Pokemon yếu ớt đến đáng thương hại. Các nhà khoa học vẫn chưa biết vì sao loài Pokemon yếu ớt này lại có thể tồn tại, sống sót lâu như thế.', CAST(N'2016-10-03T01:07:38.7166229' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (520, N'Species', N'Fish Pokémon', CAST(N'2016-10-03T01:07:38.7166229' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (521, N'Species', N'Pokémon Cá', CAST(N'2016-10-03T01:07:38.7166229' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (522, N'Description', N'When Magikarp evolves into Gyarados, its brain cells undergo a structural transformation. It is said that this transformation is to blame for this Pokémon''s wildly violent nature.', CAST(N'2016-10-03T01:07:38.8826047' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (523, N'Description', N'Khi Magikarp tiến hóa thành Gyarados tế bào não của nó được tái cấu trúc. Các nhà khoa học cho rằng chính điều này đã dẫn đến hành vi hung bạo của Gyarados.', CAST(N'2016-10-03T01:07:38.8826047' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (524, N'Species', N'Atrocious Pokémon', CAST(N'2016-10-03T01:07:38.8826047' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (525, N'Species', N'Pokémon Hung Bạo', CAST(N'2016-10-03T01:07:38.8826047' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (526, N'Description', N'People have driven Lapras almost to the point of extinction. In the evenings, this Pokémon is said to sing plaintively as it seeks what few others of its kind still remain.', CAST(N'2016-10-03T01:07:39.0536132' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (527, N'Description', N'Lapras bị săn bắt quá mức tới độ gần tuyệt chủng. Nó cực kì thông minh, có khả năng đọc ý nghĩ và hiểu được ngôn ngữ của con người.', CAST(N'2016-10-03T01:07:39.0536132' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (528, N'Species', N'Transport Pokémon', CAST(N'2016-10-03T01:07:39.0536132' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (529, N'Species', N'Pokémon Vận Chuyển', CAST(N'2016-10-03T01:07:39.0536132' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (530, N'Description', N'Ditto rearranges its cell structure to transform itself into other shapes. However, if it tries to transform itself into something by relying on its memory, this Pokémon manages to get details wrong.', CAST(N'2016-10-03T01:07:39.2278514' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (531, N'Description', N'Ditto có khả năng sao chép mã di truyền của đối thủ để lập tức biến hình thành một bản sao y đúc. Nếu Ditto cố gắng biến hình theo trí nhớ thì sẽ có vài chi tiết không chuẩn so với bản gốc.', CAST(N'2016-10-03T01:07:39.2278514' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (532, N'Species', N'Transform Pokémon', CAST(N'2016-10-03T01:07:39.2278514' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (533, N'Species', N'Pokémon Biến Hình', CAST(N'2016-10-03T01:07:39.2278514' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (534, N'Description', N'Eevee has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various stones causes this Pokémon to evolve.', CAST(N'2016-10-03T01:07:39.4003618' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (535, N'Description', N'Eevee dễ đột biến để điều chỉnh cơ thể sao cho thích hợp với môi trường sống khắc nghiệt. Nó tiến hóa nhờ phóng xạ phát ra từ các loại đá tiến hóa hoặc nhờ kích thích từ môi trường.', CAST(N'2016-10-03T01:07:39.4003618' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (536, N'Species', N'Evolution Pokémon', CAST(N'2016-10-03T01:07:39.4003618' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (537, N'Species', N'Pokémon Tiến Hóa', CAST(N'2016-10-03T01:07:39.4003618' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (538, N'Description', N'Vaporeon underwent a spontaneous mutation and grew fins and gills that allow it to live underwater. This Pokémon has the ability to freely control water.', CAST(N'2016-10-03T01:07:39.6496194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (539, N'Description', N'Vaporeon trải qua một quá trình đột biến, mọc vây và vảy giúp nó sống được dưới nước. Pokémon này có khả năng tự do điều khiển nước.', CAST(N'2016-10-03T01:07:39.6496194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (540, N'Species', N'Bubble Jet Pokémon', CAST(N'2016-10-03T01:07:39.6496194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (541, N'Species', N'Pokémon Sủi Bọt', CAST(N'2016-10-03T01:07:39.6496194' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (542, N'Description', N'Jolteon''s cells generate a low level of electricity. This power is amplified by the static electricity of its fur, enabling the Pokémon to drop thunderbolts. The bristling fur is made of electrically charged needles.', CAST(N'2016-10-03T01:07:39.8276038' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (543, N'Description', N'Tế bào của Jolteon sinh ra điện tích nhỏ, lượng điện tích này được khuếch đại bởi lớp lông tích tĩnh điện. Lớp lông của Jolteon có cấu tạo giống như hàng ngàn mũi kim nhỏ được nạp điện tích.', CAST(N'2016-10-03T01:07:39.8276038' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (544, N'Species', N'Lightning Pokémon', CAST(N'2016-10-03T01:07:39.8276038' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (545, N'Species', N'Pokémon Sấm Sét', CAST(N'2016-10-03T01:07:39.8276038' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (546, N'Description', N'Flareon''s fluffy fur has a functional purpose-it releases heat into the air so that its body does not get excessively hot. This Pokémon''s body temperature can rise to a maximum of 1,650 degrees Fahrenheit.', CAST(N'2016-10-03T01:07:40.0020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (547, N'Description', N'Lớp lông cổ có chức năng thải bớt nhiệt lượng cho cơ thể để Booster không trở nên nóng ngoài mức kiểm soát. Khi tích tụ nhiệt năng, cơ thể Booster có thể nóng đến hơn 1650 độ F.', CAST(N'2016-10-03T01:07:40.0020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (548, N'Species', N'Flame Pokémon', CAST(N'2016-10-03T01:07:40.0020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (549, N'Species', N'Pokémon Bốc Cháy', CAST(N'2016-10-03T01:07:40.0020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (550, N'Description', N'Porygon is capable of reverting itself entirely back to program data and entering cyberspace. This Pokémon is copy-protected so it cannot be duplicated by copying.', CAST(N'2016-10-03T01:07:40.1785168' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (551, N'Description', N'Porygon có thể chuyển cơ thể về dạng mã và di chuyển tự do trong không gian mạng máy tính. Porygon có chương trình chặn copy nên nó không thể bị nhân bản.', CAST(N'2016-10-03T01:07:40.1785168' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (552, N'Species', N'Virtual Pokémon', CAST(N'2016-10-03T01:07:40.1785168' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (553, N'Species', N'Pokémon Ảo', CAST(N'2016-10-03T01:07:40.1785168' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (554, N'Description', N'Omanyte is one of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by people. If attacked by an enemy, it withdraws itself inside its hard shell.', CAST(N'2016-10-03T01:07:40.3615163' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (555, N'Description', N'Pokémon cổ đại đã tuyệt chủng và được phục sinh từ hóa thạch bằng công nghệ khoa học hiện đại. Nếu bị kẻ thù tấn công, Omanyte rút mình vào lớp vỏ cứng', CAST(N'2016-10-03T01:07:40.3615163' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (556, N'Species', N'Spiral Pokémon', CAST(N'2016-10-03T01:07:40.3615163' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (557, N'Species', N'Pokémon Xoắn Ốc', CAST(N'2016-10-03T01:07:40.3615163' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (558, N'Description', N'Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large and heavy, causing its movements to become too slow and ponderous.', CAST(N'2016-10-03T01:07:40.5530171' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (559, N'Description', N'Pokémon thời tiền sử đã tuyệt chủng. Chiếc vỏ xoắn ốc nặng nề của nó khiến nó di chuyển chậm chạp và vụng về. Điều lý giải sự tuyệt chủng của Omastar', CAST(N'2016-10-03T01:07:40.5530171' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (560, N'Species', N'Spiral Pokémon', CAST(N'2016-10-03T01:07:40.5530171' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (561, N'Species', N'Pokémon Xoắn Ốc', CAST(N'2016-10-03T01:07:40.5530171' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (562, N'Description', N'Kabuto is a Pokémon that has been regenerated from a fossil. However, in extremely rare cases, living examples have been discovered. The Pokémon has not changed at all for 300 million years.', CAST(N'2016-10-03T01:07:40.7285181' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (563, N'Description', N'Pokémon được tái tạo lại từ hóa thạch. Có vài con Kabuto vẫn còn sống trong tự nhiên từ thời cổ đại đến nay, chúng hầu như không thay đổi gì kể từ 300 triệu năm trước.', CAST(N'2016-10-03T01:07:40.7285181' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (564, N'Species', N'Shellfish Pokémon', CAST(N'2016-10-03T01:07:40.7285181' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (565, N'Species', N'Pokémon Giáp Xác', CAST(N'2016-10-03T01:07:40.7285181' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (566, N'Description', N'Kabutops swam underwater to hunt for its prey in ancient times. The Pokémon was apparently evolving from being a water-dweller to living on land as evident from the beginnings of change in its gills and legs.', CAST(N'2016-10-03T01:07:40.9020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (567, N'Description', N'Kabutops bơi rất nhanh giúp nó dễ dàng săn mồi dưới nước. Pokémon này tiến hóa từ sinh vật định cư hoàn toàn dưới nước thành loài sống trên cạn. Bằng chứng thể hiện ở vây và chân của nó.', CAST(N'2016-10-03T01:07:40.9020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (568, N'Species', N'Shellfish Pokémon', CAST(N'2016-10-03T01:07:40.9020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (569, N'Species', N'Pokémon Giáp Xác', CAST(N'2016-10-03T01:07:40.9020164' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (570, N'Description', N'Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from genetic material extracted from amber. It is imagined to have been the king of the skies in ancient times.', CAST(N'2016-10-03T01:07:41.0825179' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (571, N'Description', N'Aerodactyl đã tuyệt chủng từ thời kì khủng long và được tái sinh nhờ DNA lưu lại trong đá hổ phách. Aerodactyl được cho là vua của bầu trời thời cổ đại.', CAST(N'2016-10-03T01:07:41.0825179' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (572, N'Species', N'Fossil Pokémon', CAST(N'2016-10-03T01:07:41.0825179' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (573, N'Species', N'Pokémon Hóa Thạch', CAST(N'2016-10-03T01:07:41.0825179' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (574, N'Description', N'Snorlax''s typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its expansive belly as a place to play.', CAST(N'2016-10-03T01:07:41.2645184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (575, N'Description', N'Snorlax rất lười, chỉ ăn và ngủ. Snorlax rất hiền lành dễ bảo, có trẻ em còn dùng bụng khổng lồ của nó làm sân chơi.', CAST(N'2016-10-03T01:07:41.2645184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (576, N'Species', N'Sleeping Pokémon', CAST(N'2016-10-03T01:07:41.2645184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (577, N'Species', N'Pokémon Ham Ngủ', CAST(N'2016-10-03T01:07:41.2645184' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (578, N'Description', N'Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall.', CAST(N'2016-10-03T01:07:41.4475170' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (579, N'Description', N'Articuno là pokémon chim huyền thoại có khả năng điều khiển băng. Khi đang bay, động tác đập cánh của nó cũng làm lạnh hơi ẩm trong không khí và tạo ra bão tuyết.', CAST(N'2016-10-03T01:07:41.4475170' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (580, N'Species', N'Freeze Pokémon', CAST(N'2016-10-03T01:07:41.4475170' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (581, N'Species', N'Pokémon Đóng Băng', CAST(N'2016-10-03T01:07:41.4475170' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (582, N'Description', N'Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. The Pokémon gains power if it is stricken by lightning bolts.', CAST(N'2016-10-03T01:07:41.6315159' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (583, N'Description', N'Zapdos là pokémon chim huyền thoại có khả năng điều khiển điện. Pokémon này thường sống trong những đám mây tích và được tiếp thêm sức mạnh nếu bị sấm sét đánh trúng.', CAST(N'2016-10-03T01:07:41.6315159' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (584, N'Species', N'Electric Pokémon', CAST(N'2016-10-03T01:07:41.6315159' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (585, N'Species', N'Pokémon Điện', CAST(N'2016-10-03T01:07:41.6315159' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (586, N'Description', N'Moltres is a legendary bird Pokémon that has the ability to control fire. If this Pokémon is injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself.', CAST(N'2016-10-03T01:07:41.9482744' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (587, N'Description', N'Moltres là pokémon chim huyền thoại có khả năng điều khiển lửa. Nếu bị thương, Moltres đầm mình trong magma nóng chảy của núi lửa để tự hồi phục.', CAST(N'2016-10-03T01:07:41.9482744' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (588, N'Species', N'Flame Pokémon', CAST(N'2016-10-03T01:07:41.9482744' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (589, N'Species', N'Pokémon Bốc Cháy', CAST(N'2016-10-03T01:07:41.9482744' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (590, N'Description', N'Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels.', CAST(N'2016-10-03T01:07:42.1420456' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (591, N'Description', N'Dratini từng được cho là chỉ tồn tại trong thần thoại. Nó phải liên tục lột da vì nguồn năng lượng trong cơ thể đang tích tụ dần, đến mức độ không thể kiểm soát.', CAST(N'2016-10-03T01:07:42.1420456' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (592, N'Species', N'Dragon Pokémon', CAST(N'2016-10-03T01:07:42.1420456' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (593, N'Species', N'Pokémon Rồng', CAST(N'2016-10-03T01:07:42.1420456' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (594, N'Description', N'Dragonair stores an enormous amount of energy inside its body. It is said to alter weather conditions in its vicinity by discharging energy from its crystals on its neck and tail.', CAST(N'2016-10-03T01:07:42.3325461' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (595, N'Description', N'Dragonair sở hữu một nguồn năng lượng khổng lồ bên trong người nó. Người ta nói rằng pokémon này thay đổi điều kiện thời tiết ở khu vực lân cận nó bằng cách giải phóng năng lượng từ những viên ngọc cầu trên cổ và đuôi.', CAST(N'2016-10-03T01:07:42.3325461' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (596, N'Species', N'Dragon Pokémon', CAST(N'2016-10-03T01:07:42.3325461' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (597, N'Species', N'Pokémon Rồng', CAST(N'2016-10-03T01:07:42.3325461' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (598, N'Description', N'Dragonite is capable of circling the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land.', CAST(N'2016-10-03T01:07:42.5165451' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (599, N'Description', N'Dragonite có thể bay vòng quanh trái đất trong vòng 16 tiếng dù có thân hình to lớn. Dragonite là một pokémon tốt bụng và thường dẫn đường cho các con tàu bị lạc hay thủy thủ bị đắm tàu quay trờ về đất liền an toàn.', CAST(N'2016-10-03T01:07:42.5165451' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (600, N'Species', N'Dragon Pokémon', CAST(N'2016-10-03T01:07:42.5165451' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (601, N'Species', N'Pokémon Rồng', CAST(N'2016-10-03T01:07:42.5165451' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (602, N'Description', N'Mewtwo is a Pokémon that was created by genetic manipulation. However, even though the scientific power of humans created this Pokémon''s body, they failed to endow Mewtwo with a compassionate heart.', CAST(N'2016-10-03T01:07:42.7085454' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (603, N'Description', N'Mewtwo được tạo ra bởi các nhà khoa học bằng kĩ thuật gen di truyền. Mặc dù sức mạnh khoa học của con người tạo ra cơ thể cho pokémon này, họ lại thất bại trong việc trao cho nó một trái tim ấm áp. Ngược lại, Mewtwo có trái tim độc ác nhất trong các pokémon.', CAST(N'2016-10-03T01:07:42.7085454' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (604, N'Species', N'Genetic Pokémon', CAST(N'2016-10-03T01:07:42.7085454' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (605, N'Species', N'Pokémon Di Truyền', CAST(N'2016-10-03T01:07:42.7085454' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (606, N'Description', N'Người ta nói DNA của Mew chứa tất cả các mã di truyền của mọi Pokémon, vì vậy nó có thể sử dụng mọi loại kĩ năng. Mew có khả năng tàng hình theo ý thích, vì vậy nó hoàn toàn tránh được sự chú ý khi tiếp cận con người.', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (607, N'Description', N'Mew is said to possess the genetic composition of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people.', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (608, N'Species', N'New Species Pokémon', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[PageContents] ([Id], [ContentFlags], [ContentText], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId]) VALUES (609, N'Species', N'Pokémon Giống Loài Mới
', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PageContents] OFF
SET IDENTITY_INSERT [dbo].[PageLangs] ON 

INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (1, CAST(N'2016-09-17T00:00:00.0000000' AS DateTime2), NULL, N'vi', 2, N'Pokemons', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (3, CAST(N'2016-09-17T00:00:00.0000000' AS DateTime2), NULL, N'en', 4, N'Pokemons in English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (8, CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, N'vi', 7, N'Bulbasaur Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (9, CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, N'en', 6, N'Bulbasaur Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (11, CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, N'en', 8, N'Bulbasaur Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (12, CAST(N'2016-10-20T00:00:00.0000000' AS DateTime2), NULL, N'vi', 9, N'Bulbasaur Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (13, CAST(N'2016-10-03T00:53:27.2504272' AS DateTime2), NULL, N'en', 10, N'Ivysaur Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (14, CAST(N'2016-10-03T00:53:30.5167465' AS DateTime2), NULL, N'vi', 11, N'Ivysaur Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (16, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, N'en', 13, N'Ivysaur Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (17, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, N'vi', 15, N'Ivysaur Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (18, CAST(N'2016-10-03T01:07:23.8118028' AS DateTime2), NULL, N'en', 16, N'Venusaur Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (19, CAST(N'2016-10-03T01:07:23.8118028' AS DateTime2), NULL, N'vi', 17, N'Venusaur Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (20, CAST(N'2016-10-03T01:07:23.8118028' AS DateTime2), NULL, N'en', 18, N'Venusaur Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (21, CAST(N'2016-10-03T01:07:23.8118028' AS DateTime2), NULL, N'vi', 19, N'Venusaur Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (22, CAST(N'2016-10-03T01:07:23.8833018' AS DateTime2), NULL, N'en', 20, N'Charmander Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (23, CAST(N'2016-10-03T01:07:23.8833018' AS DateTime2), NULL, N'vi', 21, N'Charmander Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (24, CAST(N'2016-10-03T01:07:23.8833018' AS DateTime2), NULL, N'en', 22, N'Charmander Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (25, CAST(N'2016-10-03T01:07:23.8833018' AS DateTime2), NULL, N'vi', 23, N'Charmander Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (26, CAST(N'2016-10-03T01:07:23.9503045' AS DateTime2), NULL, N'en', 24, N'Charmeleon Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (27, CAST(N'2016-10-03T01:07:23.9503045' AS DateTime2), NULL, N'vi', 25, N'Charmeleon Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (28, CAST(N'2016-10-03T01:07:23.9503045' AS DateTime2), NULL, N'en', 26, N'Charmeleon Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (29, CAST(N'2016-10-03T01:07:23.9503045' AS DateTime2), NULL, N'vi', 27, N'Charmeleon Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (30, CAST(N'2016-10-03T01:07:24.0063036' AS DateTime2), NULL, N'en', 28, N'Charizard Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (31, CAST(N'2016-10-03T01:07:24.0063036' AS DateTime2), NULL, N'vi', 29, N'Charizard Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (32, CAST(N'2016-10-03T01:07:24.0063036' AS DateTime2), NULL, N'en', 30, N'Charizard Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (33, CAST(N'2016-10-03T01:07:24.0063036' AS DateTime2), NULL, N'vi', 31, N'Charizard Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (34, CAST(N'2016-10-03T01:07:24.0648173' AS DateTime2), NULL, N'en', 32, N'Squirtle Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (35, CAST(N'2016-10-03T01:07:24.0648173' AS DateTime2), NULL, N'vi', 33, N'Squirtle Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (36, CAST(N'2016-10-03T01:07:24.0648173' AS DateTime2), NULL, N'en', 34, N'Squirtle Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (37, CAST(N'2016-10-03T01:07:24.0648173' AS DateTime2), NULL, N'vi', 35, N'Squirtle Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (38, CAST(N'2016-10-03T01:07:24.1228294' AS DateTime2), NULL, N'en', 36, N'Wartortle Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (39, CAST(N'2016-10-03T01:07:24.1228294' AS DateTime2), NULL, N'vi', 37, N'Wartortle Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (40, CAST(N'2016-10-03T01:07:24.1228294' AS DateTime2), NULL, N'en', 38, N'Wartortle Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (41, CAST(N'2016-10-03T01:07:24.1228294' AS DateTime2), NULL, N'vi', 39, N'Wartortle Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (42, CAST(N'2016-10-03T01:07:24.1817195' AS DateTime2), NULL, N'en', 40, N'Blastoise Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (43, CAST(N'2016-10-03T01:07:24.1817195' AS DateTime2), NULL, N'vi', 41, N'Blastoise Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (44, CAST(N'2016-10-03T01:07:24.1817195' AS DateTime2), NULL, N'en', 42, N'Blastoise Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (45, CAST(N'2016-10-03T01:07:24.1817195' AS DateTime2), NULL, N'vi', 43, N'Blastoise Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (46, CAST(N'2016-10-03T01:07:24.2462212' AS DateTime2), NULL, N'en', 44, N'Caterpie Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (47, CAST(N'2016-10-03T01:07:24.2462212' AS DateTime2), NULL, N'vi', 45, N'Caterpie Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (48, CAST(N'2016-10-03T01:07:24.2462212' AS DateTime2), NULL, N'en', 46, N'Caterpie Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (49, CAST(N'2016-10-03T01:07:24.2462212' AS DateTime2), NULL, N'vi', 47, N'Caterpie Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (50, CAST(N'2016-10-03T01:07:24.2952329' AS DateTime2), NULL, N'en', 48, N'Metapod Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (51, CAST(N'2016-10-03T01:07:24.2952329' AS DateTime2), NULL, N'vi', 49, N'Metapod Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (52, CAST(N'2016-10-03T01:07:24.2952329' AS DateTime2), NULL, N'en', 50, N'Metapod Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (53, CAST(N'2016-10-03T01:07:24.2952329' AS DateTime2), NULL, N'vi', 51, N'Metapod Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (54, CAST(N'2016-10-03T01:07:24.3472031' AS DateTime2), NULL, N'en', 52, N'Butterfree Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (55, CAST(N'2016-10-03T01:07:24.3472031' AS DateTime2), NULL, N'vi', 53, N'Butterfree Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (56, CAST(N'2016-10-03T01:07:24.3472031' AS DateTime2), NULL, N'en', 54, N'Butterfree Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (57, CAST(N'2016-10-03T01:07:24.3472031' AS DateTime2), NULL, N'vi', 55, N'Butterfree Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (58, CAST(N'2016-10-03T01:07:24.4231925' AS DateTime2), NULL, N'en', 56, N'Weedle Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (59, CAST(N'2016-10-03T01:07:24.4231925' AS DateTime2), NULL, N'vi', 57, N'Weedle Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (60, CAST(N'2016-10-03T01:07:24.4231925' AS DateTime2), NULL, N'en', 58, N'Weedle Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (61, CAST(N'2016-10-03T01:07:24.4231925' AS DateTime2), NULL, N'vi', 59, N'Weedle Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (62, CAST(N'2016-10-03T01:07:24.4802116' AS DateTime2), NULL, N'en', 60, N'Kakuna Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (63, CAST(N'2016-10-03T01:07:24.4802116' AS DateTime2), NULL, N'vi', 61, N'Kakuna Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (64, CAST(N'2016-10-03T01:07:24.4802116' AS DateTime2), NULL, N'en', 62, N'Kakuna Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (65, CAST(N'2016-10-03T01:07:24.4802116' AS DateTime2), NULL, N'vi', 63, N'Kakuna Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (66, CAST(N'2016-10-03T01:07:24.5412040' AS DateTime2), NULL, N'en', 64, N'Beedrill Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (67, CAST(N'2016-10-03T01:07:24.5412040' AS DateTime2), NULL, N'vi', 65, N'Beedrill Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (68, CAST(N'2016-10-03T01:07:24.5412040' AS DateTime2), NULL, N'en', 66, N'Beedrill Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (69, CAST(N'2016-10-03T01:07:24.5412040' AS DateTime2), NULL, N'vi', 67, N'Beedrill Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (70, CAST(N'2016-10-03T01:07:24.6077170' AS DateTime2), NULL, N'en', 68, N'Pidgey Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (71, CAST(N'2016-10-03T01:07:24.6077170' AS DateTime2), NULL, N'vi', 69, N'Pidgey Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (72, CAST(N'2016-10-03T01:07:24.6077170' AS DateTime2), NULL, N'en', 70, N'Pidgey Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (73, CAST(N'2016-10-03T01:07:24.6077170' AS DateTime2), NULL, N'vi', 71, N'Pidgey Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (74, CAST(N'2016-10-03T01:07:24.6827202' AS DateTime2), NULL, N'en', 72, N'Pidgeotto Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (75, CAST(N'2016-10-03T01:07:24.6827202' AS DateTime2), NULL, N'vi', 73, N'Pidgeotto Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (76, CAST(N'2016-10-03T01:07:24.6827202' AS DateTime2), NULL, N'en', 74, N'Pidgeotto Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (77, CAST(N'2016-10-03T01:07:24.6827202' AS DateTime2), NULL, N'vi', 75, N'Pidgeotto Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (78, CAST(N'2016-10-03T01:07:24.7466934' AS DateTime2), NULL, N'en', 76, N'Pidgeot Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (79, CAST(N'2016-10-03T01:07:24.7466934' AS DateTime2), NULL, N'vi', 77, N'Pidgeot Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (80, CAST(N'2016-10-03T01:07:24.7466934' AS DateTime2), NULL, N'en', 78, N'Pidgeot Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (81, CAST(N'2016-10-03T01:07:24.7466934' AS DateTime2), NULL, N'vi', 79, N'Pidgeot Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (82, CAST(N'2016-10-03T01:07:24.8251926' AS DateTime2), NULL, N'en', 80, N'Rattata Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (83, CAST(N'2016-10-03T01:07:24.8251926' AS DateTime2), NULL, N'vi', 81, N'Rattata Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (84, CAST(N'2016-10-03T01:07:24.8251926' AS DateTime2), NULL, N'en', 82, N'Rattata Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (85, CAST(N'2016-10-03T01:07:24.8251926' AS DateTime2), NULL, N'vi', 83, N'Rattata Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (86, CAST(N'2016-10-03T01:07:24.9251926' AS DateTime2), NULL, N'en', 84, N'Raticate Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (87, CAST(N'2016-10-03T01:07:24.9251926' AS DateTime2), NULL, N'vi', 85, N'Raticate Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (88, CAST(N'2016-10-03T01:07:24.9251926' AS DateTime2), NULL, N'en', 86, N'Raticate Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (89, CAST(N'2016-10-03T01:07:24.9251926' AS DateTime2), NULL, N'vi', 87, N'Raticate Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (90, CAST(N'2016-10-03T01:07:25.0026929' AS DateTime2), NULL, N'en', 88, N'Spearow Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (91, CAST(N'2016-10-03T01:07:25.0026929' AS DateTime2), NULL, N'vi', 89, N'Spearow Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (92, CAST(N'2016-10-03T01:07:25.0026929' AS DateTime2), NULL, N'en', 90, N'Spearow Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (93, CAST(N'2016-10-03T01:07:25.0026929' AS DateTime2), NULL, N'vi', 91, N'Spearow Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (94, CAST(N'2016-10-03T01:07:25.2668936' AS DateTime2), NULL, N'en', 92, N'Fearow Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (95, CAST(N'2016-10-03T01:07:25.2668936' AS DateTime2), NULL, N'vi', 93, N'Fearow Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (96, CAST(N'2016-10-03T01:07:25.2668936' AS DateTime2), NULL, N'en', 94, N'Fearow Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (97, CAST(N'2016-10-03T01:07:25.2668936' AS DateTime2), NULL, N'vi', 95, N'Fearow Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (98, CAST(N'2016-10-03T01:07:25.4210936' AS DateTime2), NULL, N'en', 96, N'Ekans Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (99, CAST(N'2016-10-03T01:07:25.4210936' AS DateTime2), NULL, N'vi', 97, N'Ekans Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (100, CAST(N'2016-10-03T01:07:25.4210936' AS DateTime2), NULL, N'en', 98, N'Ekans Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (101, CAST(N'2016-10-03T01:07:25.4210936' AS DateTime2), NULL, N'vi', 99, N'Ekans Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (102, CAST(N'2016-10-03T01:07:25.4816002' AS DateTime2), NULL, N'en', 100, N'Arbok Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (103, CAST(N'2016-10-03T01:07:25.4816002' AS DateTime2), NULL, N'vi', 101, N'Arbok Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (104, CAST(N'2016-10-03T01:07:25.4816002' AS DateTime2), NULL, N'en', 102, N'Arbok Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (105, CAST(N'2016-10-03T01:07:25.4816002' AS DateTime2), NULL, N'vi', 103, N'Arbok Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (106, CAST(N'2016-10-03T01:07:25.5505953' AS DateTime2), NULL, N'en', 104, N'Pikachu Description English', NULL, NULL)
GO
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (107, CAST(N'2016-10-03T01:07:25.5505953' AS DateTime2), NULL, N'vi', 105, N'Pikachu Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (108, CAST(N'2016-10-03T01:07:25.5505953' AS DateTime2), NULL, N'en', 106, N'Pikachu Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (109, CAST(N'2016-10-03T01:07:25.5505953' AS DateTime2), NULL, N'vi', 107, N'Pikachu Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (110, CAST(N'2016-10-03T01:07:25.6170877' AS DateTime2), NULL, N'en', 108, N'Raichu Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (111, CAST(N'2016-10-03T01:07:25.6170877' AS DateTime2), NULL, N'vi', 109, N'Raichu Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (112, CAST(N'2016-10-03T01:07:25.6170877' AS DateTime2), NULL, N'en', 110, N'Raichu Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (113, CAST(N'2016-10-03T01:07:25.6170877' AS DateTime2), NULL, N'vi', 111, N'Raichu Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (114, CAST(N'2016-10-03T01:07:25.6835836' AS DateTime2), NULL, N'en', 112, N'Sandshrew Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (115, CAST(N'2016-10-03T01:07:25.6835836' AS DateTime2), NULL, N'vi', 113, N'Sandshrew Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (116, CAST(N'2016-10-03T01:07:25.6835836' AS DateTime2), NULL, N'en', 114, N'Sandshrew Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (117, CAST(N'2016-10-03T01:07:25.6835836' AS DateTime2), NULL, N'vi', 115, N'Sandshrew Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (118, CAST(N'2016-10-03T01:07:25.7593074' AS DateTime2), NULL, N'en', 116, N'Sandslash Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (119, CAST(N'2016-10-03T01:07:25.7593074' AS DateTime2), NULL, N'vi', 117, N'Sandslash Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (120, CAST(N'2016-10-03T01:07:25.7593074' AS DateTime2), NULL, N'en', 118, N'Sandslash Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (121, CAST(N'2016-10-03T01:07:25.7593074' AS DateTime2), NULL, N'vi', 119, N'Sandslash Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (122, CAST(N'2016-10-03T01:07:25.8417262' AS DateTime2), NULL, N'en', 120, N'NidoranFemale Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (123, CAST(N'2016-10-03T01:07:25.8417262' AS DateTime2), NULL, N'vi', 121, N'NidoranFemale Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (124, CAST(N'2016-10-03T01:07:25.8417262' AS DateTime2), NULL, N'en', 122, N'NidoranFemale Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (125, CAST(N'2016-10-03T01:07:25.8417262' AS DateTime2), NULL, N'vi', 123, N'NidoranFemale Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (126, CAST(N'2016-10-03T01:07:25.9178152' AS DateTime2), NULL, N'en', 124, N'Nidorina Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (127, CAST(N'2016-10-03T01:07:25.9178152' AS DateTime2), NULL, N'vi', 125, N'Nidorina Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (128, CAST(N'2016-10-03T01:07:25.9178152' AS DateTime2), NULL, N'en', 126, N'Nidorina Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (129, CAST(N'2016-10-03T01:07:25.9178152' AS DateTime2), NULL, N'vi', 127, N'Nidorina Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (130, CAST(N'2016-10-03T01:07:26.0109595' AS DateTime2), NULL, N'en', 128, N'Nidoqueen Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (131, CAST(N'2016-10-03T01:07:26.0109595' AS DateTime2), NULL, N'vi', 129, N'Nidoqueen Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (132, CAST(N'2016-10-03T01:07:26.0109595' AS DateTime2), NULL, N'en', 130, N'Nidoqueen Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (133, CAST(N'2016-10-03T01:07:26.0109595' AS DateTime2), NULL, N'vi', 131, N'Nidoqueen Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (134, CAST(N'2016-10-03T01:07:26.1434689' AS DateTime2), NULL, N'en', 132, N'NidoranMale Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (135, CAST(N'2016-10-03T01:07:26.1434689' AS DateTime2), NULL, N'vi', 133, N'NidoranMale Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (136, CAST(N'2016-10-03T01:07:26.1434689' AS DateTime2), NULL, N'en', 134, N'NidoranMale Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (137, CAST(N'2016-10-03T01:07:26.1434689' AS DateTime2), NULL, N'vi', 135, N'NidoranMale Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (138, CAST(N'2016-10-03T01:07:26.2194681' AS DateTime2), NULL, N'en', 136, N'Nidorino Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (139, CAST(N'2016-10-03T01:07:26.2194681' AS DateTime2), NULL, N'vi', 137, N'Nidorino Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (140, CAST(N'2016-10-03T01:07:26.2194681' AS DateTime2), NULL, N'en', 138, N'Nidorino Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (141, CAST(N'2016-10-03T01:07:26.2194681' AS DateTime2), NULL, N'vi', 139, N'Nidorino Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (142, CAST(N'2016-10-03T01:07:26.3115501' AS DateTime2), NULL, N'en', 140, N'Nidoking Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (143, CAST(N'2016-10-03T01:07:26.3115501' AS DateTime2), NULL, N'vi', 141, N'Nidoking Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (144, CAST(N'2016-10-03T01:07:26.3115501' AS DateTime2), NULL, N'en', 142, N'Nidoking Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (145, CAST(N'2016-10-03T01:07:26.3115501' AS DateTime2), NULL, N'vi', 143, N'Nidoking Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (146, CAST(N'2016-10-03T01:07:26.4162016' AS DateTime2), NULL, N'en', 144, N'Clefairy Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (147, CAST(N'2016-10-03T01:07:26.4162016' AS DateTime2), NULL, N'vi', 145, N'Clefairy Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (148, CAST(N'2016-10-03T01:07:26.4162016' AS DateTime2), NULL, N'en', 146, N'Clefairy Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (149, CAST(N'2016-10-03T01:07:26.4162016' AS DateTime2), NULL, N'vi', 147, N'Clefairy Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (150, CAST(N'2016-10-03T01:07:26.4948669' AS DateTime2), NULL, N'en', 148, N'Clefable Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (151, CAST(N'2016-10-03T01:07:26.4948669' AS DateTime2), NULL, N'vi', 149, N'Clefable Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (152, CAST(N'2016-10-03T01:07:26.4948669' AS DateTime2), NULL, N'en', 150, N'Clefable Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (153, CAST(N'2016-10-03T01:07:26.4948669' AS DateTime2), NULL, N'vi', 151, N'Clefable Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (154, CAST(N'2016-10-03T01:07:26.5701348' AS DateTime2), NULL, N'en', 152, N'Vulpix Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (155, CAST(N'2016-10-03T01:07:26.5701348' AS DateTime2), NULL, N'vi', 153, N'Vulpix Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (156, CAST(N'2016-10-03T01:07:26.5701348' AS DateTime2), NULL, N'en', 154, N'Vulpix Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (157, CAST(N'2016-10-03T01:07:26.5701348' AS DateTime2), NULL, N'vi', 155, N'Vulpix Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (158, CAST(N'2016-10-03T01:07:26.6456460' AS DateTime2), NULL, N'en', 156, N'Ninetales Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (159, CAST(N'2016-10-03T01:07:26.6456460' AS DateTime2), NULL, N'vi', 157, N'Ninetales Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (160, CAST(N'2016-10-03T01:07:26.6456460' AS DateTime2), NULL, N'en', 158, N'Ninetales Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (161, CAST(N'2016-10-03T01:07:26.6456460' AS DateTime2), NULL, N'vi', 159, N'Ninetales Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (162, CAST(N'2016-10-03T01:07:26.7206467' AS DateTime2), NULL, N'en', 160, N'Jigglypuff Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (163, CAST(N'2016-10-03T01:07:26.7206467' AS DateTime2), NULL, N'vi', 161, N'Jigglypuff Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (164, CAST(N'2016-10-03T01:07:26.7206467' AS DateTime2), NULL, N'en', 162, N'Jigglypuff Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (165, CAST(N'2016-10-03T01:07:26.7206467' AS DateTime2), NULL, N'vi', 163, N'Jigglypuff Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (166, CAST(N'2016-10-03T01:07:26.8454249' AS DateTime2), NULL, N'en', 164, N'Wigglytuff Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (167, CAST(N'2016-10-03T01:07:26.8454249' AS DateTime2), NULL, N'vi', 165, N'Wigglytuff Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (168, CAST(N'2016-10-03T01:07:26.8454249' AS DateTime2), NULL, N'en', 166, N'Wigglytuff Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (169, CAST(N'2016-10-03T01:07:26.8454249' AS DateTime2), NULL, N'vi', 167, N'Wigglytuff Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (170, CAST(N'2016-10-03T01:07:26.9289115' AS DateTime2), NULL, N'en', 168, N'Zubat Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (171, CAST(N'2016-10-03T01:07:26.9289115' AS DateTime2), NULL, N'vi', 169, N'Zubat Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (172, CAST(N'2016-10-03T01:07:26.9289115' AS DateTime2), NULL, N'en', 170, N'Zubat Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (173, CAST(N'2016-10-03T01:07:26.9289115' AS DateTime2), NULL, N'vi', 171, N'Zubat Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (174, CAST(N'2016-10-03T01:07:27.0254253' AS DateTime2), NULL, N'en', 172, N'Golbat Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (175, CAST(N'2016-10-03T01:07:27.0254253' AS DateTime2), NULL, N'vi', 173, N'Golbat Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (176, CAST(N'2016-10-03T01:07:27.0254253' AS DateTime2), NULL, N'en', 174, N'Golbat Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (177, CAST(N'2016-10-03T01:07:27.0254253' AS DateTime2), NULL, N'vi', 175, N'Golbat Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (178, CAST(N'2016-10-03T01:07:27.1024226' AS DateTime2), NULL, N'en', 176, N'Oddish Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (179, CAST(N'2016-10-03T01:07:27.1024226' AS DateTime2), NULL, N'vi', 177, N'Oddish Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (180, CAST(N'2016-10-03T01:07:27.1024226' AS DateTime2), NULL, N'en', 178, N'Oddish Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (181, CAST(N'2016-10-03T01:07:27.1024226' AS DateTime2), NULL, N'vi', 179, N'Oddish Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (182, CAST(N'2016-10-03T01:07:27.1875275' AS DateTime2), NULL, N'en', 180, N'Gloom Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (183, CAST(N'2016-10-03T01:07:27.1875275' AS DateTime2), NULL, N'vi', 181, N'Gloom Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (184, CAST(N'2016-10-03T01:07:27.1875275' AS DateTime2), NULL, N'en', 182, N'Gloom Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (185, CAST(N'2016-10-03T01:07:27.1875275' AS DateTime2), NULL, N'vi', 183, N'Gloom Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (186, CAST(N'2016-10-03T01:07:27.2675115' AS DateTime2), NULL, N'en', 184, N'Vileplume Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (187, CAST(N'2016-10-03T01:07:27.2675115' AS DateTime2), NULL, N'vi', 185, N'Vileplume Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (188, CAST(N'2016-10-03T01:07:27.2675115' AS DateTime2), NULL, N'en', 186, N'Vileplume Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (189, CAST(N'2016-10-03T01:07:27.2675115' AS DateTime2), NULL, N'vi', 187, N'Vileplume Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (190, CAST(N'2016-10-03T01:07:27.3545780' AS DateTime2), NULL, N'en', 188, N'Paras Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (191, CAST(N'2016-10-03T01:07:27.3545780' AS DateTime2), NULL, N'vi', 189, N'Paras Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (192, CAST(N'2016-10-03T01:07:27.3545780' AS DateTime2), NULL, N'en', 190, N'Paras Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (193, CAST(N'2016-10-03T01:07:27.3545780' AS DateTime2), NULL, N'vi', 191, N'Paras Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (194, CAST(N'2016-10-03T01:07:27.4630772' AS DateTime2), NULL, N'en', 192, N'Parasect Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (195, CAST(N'2016-10-03T01:07:27.4630772' AS DateTime2), NULL, N'vi', 193, N'Parasect Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (196, CAST(N'2016-10-03T01:07:27.4630772' AS DateTime2), NULL, N'en', 194, N'Parasect Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (197, CAST(N'2016-10-03T01:07:27.4630772' AS DateTime2), NULL, N'vi', 195, N'Parasect Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (198, CAST(N'2016-10-03T01:07:27.5458684' AS DateTime2), NULL, N'en', 196, N'Venonat Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (199, CAST(N'2016-10-03T01:07:27.5458684' AS DateTime2), NULL, N'vi', 197, N'Venonat Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (200, CAST(N'2016-10-03T01:07:27.5458684' AS DateTime2), NULL, N'en', 198, N'Venonat Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (201, CAST(N'2016-10-03T01:07:27.5458684' AS DateTime2), NULL, N'vi', 199, N'Venonat Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (202, CAST(N'2016-10-03T01:07:27.6298754' AS DateTime2), NULL, N'en', 200, N'Venomoth Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (203, CAST(N'2016-10-03T01:07:27.6298754' AS DateTime2), NULL, N'vi', 201, N'Venomoth Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (204, CAST(N'2016-10-03T01:07:27.6298754' AS DateTime2), NULL, N'en', 202, N'Venomoth Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (205, CAST(N'2016-10-03T01:07:27.6298754' AS DateTime2), NULL, N'vi', 203, N'Venomoth Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (206, CAST(N'2016-10-03T01:07:27.7215580' AS DateTime2), NULL, N'en', 204, N'Diglett Description English', NULL, NULL)
GO
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (207, CAST(N'2016-10-03T01:07:27.7215580' AS DateTime2), NULL, N'vi', 205, N'Diglett Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (208, CAST(N'2016-10-03T01:07:27.7215580' AS DateTime2), NULL, N'en', 206, N'Diglett Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (209, CAST(N'2016-10-03T01:07:27.7215580' AS DateTime2), NULL, N'vi', 207, N'Diglett Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (210, CAST(N'2016-10-03T01:07:27.8134292' AS DateTime2), NULL, N'en', 208, N'Dugtrio Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (211, CAST(N'2016-10-03T01:07:27.8134292' AS DateTime2), NULL, N'vi', 209, N'Dugtrio Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (212, CAST(N'2016-10-03T01:07:27.8134292' AS DateTime2), NULL, N'en', 210, N'Dugtrio Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (213, CAST(N'2016-10-03T01:07:27.8134292' AS DateTime2), NULL, N'vi', 211, N'Dugtrio Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (214, CAST(N'2016-10-03T01:07:27.9054363' AS DateTime2), NULL, N'en', 212, N'Meowth Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (215, CAST(N'2016-10-03T01:07:27.9054363' AS DateTime2), NULL, N'vi', 213, N'Meowth Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (216, CAST(N'2016-10-03T01:07:27.9054363' AS DateTime2), NULL, N'en', 214, N'Meowth Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (217, CAST(N'2016-10-03T01:07:27.9054363' AS DateTime2), NULL, N'vi', 215, N'Meowth Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (218, CAST(N'2016-10-03T01:07:28.1041008' AS DateTime2), NULL, N'en', 216, N'Persian Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (219, CAST(N'2016-10-03T01:07:28.1041008' AS DateTime2), NULL, N'vi', 217, N'Persian Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (220, CAST(N'2016-10-03T01:07:28.1041008' AS DateTime2), NULL, N'en', 218, N'Persian Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (221, CAST(N'2016-10-03T01:07:28.1041008' AS DateTime2), NULL, N'vi', 219, N'Persian Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (222, CAST(N'2016-10-03T01:07:28.6785446' AS DateTime2), NULL, N'en', 220, N'Psyduck Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (223, CAST(N'2016-10-03T01:07:28.6785446' AS DateTime2), NULL, N'vi', 221, N'Psyduck Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (224, CAST(N'2016-10-03T01:07:28.6785446' AS DateTime2), NULL, N'en', 222, N'Psyduck Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (225, CAST(N'2016-10-03T01:07:28.6785446' AS DateTime2), NULL, N'vi', 223, N'Psyduck Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (226, CAST(N'2016-10-03T01:07:28.7695091' AS DateTime2), NULL, N'en', 224, N'Golduck Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (227, CAST(N'2016-10-03T01:07:28.7695091' AS DateTime2), NULL, N'vi', 225, N'Golduck Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (228, CAST(N'2016-10-03T01:07:28.7695091' AS DateTime2), NULL, N'en', 226, N'Golduck Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (229, CAST(N'2016-10-03T01:07:28.7695091' AS DateTime2), NULL, N'vi', 227, N'Golduck Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (230, CAST(N'2016-10-03T01:07:28.8640287' AS DateTime2), NULL, N'en', 228, N'Mankey Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (231, CAST(N'2016-10-03T01:07:28.8640287' AS DateTime2), NULL, N'vi', 229, N'Mankey Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (232, CAST(N'2016-10-03T01:07:28.8640287' AS DateTime2), NULL, N'en', 230, N'Mankey Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (233, CAST(N'2016-10-03T01:07:28.8640287' AS DateTime2), NULL, N'vi', 231, N'Mankey Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (234, CAST(N'2016-10-03T01:07:28.9725562' AS DateTime2), NULL, N'en', 232, N'Primeape Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (235, CAST(N'2016-10-03T01:07:28.9725562' AS DateTime2), NULL, N'vi', 233, N'Primeape Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (236, CAST(N'2016-10-03T01:07:28.9725562' AS DateTime2), NULL, N'en', 234, N'Primeape Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (237, CAST(N'2016-10-03T01:07:28.9725562' AS DateTime2), NULL, N'vi', 235, N'Primeape Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (238, CAST(N'2016-10-03T01:07:29.0814364' AS DateTime2), NULL, N'en', 236, N'Growlithe Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (239, CAST(N'2016-10-03T01:07:29.0814364' AS DateTime2), NULL, N'vi', 237, N'Growlithe Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (240, CAST(N'2016-10-03T01:07:29.0814364' AS DateTime2), NULL, N'en', 238, N'Growlithe Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (241, CAST(N'2016-10-03T01:07:29.0814364' AS DateTime2), NULL, N'vi', 239, N'Growlithe Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (242, CAST(N'2016-10-03T01:07:29.1814928' AS DateTime2), NULL, N'en', 240, N'Arcanine Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (243, CAST(N'2016-10-03T01:07:29.1814928' AS DateTime2), NULL, N'vi', 241, N'Arcanine Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (244, CAST(N'2016-10-03T01:07:29.1814928' AS DateTime2), NULL, N'en', 242, N'Arcanine Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (245, CAST(N'2016-10-03T01:07:29.1814928' AS DateTime2), NULL, N'vi', 243, N'Arcanine Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (246, CAST(N'2016-10-03T01:07:29.3100610' AS DateTime2), NULL, N'en', 244, N'Poliwag Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (247, CAST(N'2016-10-03T01:07:29.3100610' AS DateTime2), NULL, N'vi', 245, N'Poliwag Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (248, CAST(N'2016-10-03T01:07:29.3100610' AS DateTime2), NULL, N'en', 246, N'Poliwag Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (249, CAST(N'2016-10-03T01:07:29.3100610' AS DateTime2), NULL, N'vi', 247, N'Poliwag Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (250, CAST(N'2016-10-03T01:07:29.4136276' AS DateTime2), NULL, N'en', 248, N'Poliwhirl Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (251, CAST(N'2016-10-03T01:07:29.4136276' AS DateTime2), NULL, N'vi', 249, N'Poliwhirl Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (252, CAST(N'2016-10-03T01:07:29.4136276' AS DateTime2), NULL, N'en', 250, N'Poliwhirl Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (253, CAST(N'2016-10-03T01:07:29.4136276' AS DateTime2), NULL, N'vi', 251, N'Poliwhirl Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (254, CAST(N'2016-10-03T01:07:29.5151056' AS DateTime2), NULL, N'en', 252, N'Poliwrath Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (255, CAST(N'2016-10-03T01:07:29.5151056' AS DateTime2), NULL, N'vi', 253, N'Poliwrath Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (256, CAST(N'2016-10-03T01:07:29.5151056' AS DateTime2), NULL, N'en', 254, N'Poliwrath Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (257, CAST(N'2016-10-03T01:07:29.5151056' AS DateTime2), NULL, N'vi', 255, N'Poliwrath Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (258, CAST(N'2016-10-03T01:07:29.6150329' AS DateTime2), NULL, N'en', 256, N'Abra Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (259, CAST(N'2016-10-03T01:07:29.6150329' AS DateTime2), NULL, N'vi', 257, N'Abra Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (260, CAST(N'2016-10-03T01:07:29.6150329' AS DateTime2), NULL, N'en', 258, N'Abra Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (261, CAST(N'2016-10-03T01:07:29.6150329' AS DateTime2), NULL, N'vi', 259, N'Abra Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (262, CAST(N'2016-10-03T01:07:29.7225373' AS DateTime2), NULL, N'en', 260, N'Kadabra Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (263, CAST(N'2016-10-03T01:07:29.7225373' AS DateTime2), NULL, N'vi', 261, N'Kadabra Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (264, CAST(N'2016-10-03T01:07:29.7225373' AS DateTime2), NULL, N'en', 262, N'Kadabra Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (265, CAST(N'2016-10-03T01:07:29.7225373' AS DateTime2), NULL, N'vi', 263, N'Kadabra Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (266, CAST(N'2016-10-03T01:07:29.8311203' AS DateTime2), NULL, N'en', 264, N'Alakazam Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (267, CAST(N'2016-10-03T01:07:29.8311203' AS DateTime2), NULL, N'vi', 265, N'Alakazam Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (268, CAST(N'2016-10-03T01:07:29.8311203' AS DateTime2), NULL, N'en', 266, N'Alakazam Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (269, CAST(N'2016-10-03T01:07:29.8311203' AS DateTime2), NULL, N'vi', 267, N'Alakazam Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (270, CAST(N'2016-10-03T01:07:29.9407716' AS DateTime2), NULL, N'en', 268, N'Machop Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (271, CAST(N'2016-10-03T01:07:29.9407716' AS DateTime2), NULL, N'vi', 269, N'Machop Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (272, CAST(N'2016-10-03T01:07:29.9407716' AS DateTime2), NULL, N'en', 270, N'Machop Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (273, CAST(N'2016-10-03T01:07:29.9407716' AS DateTime2), NULL, N'vi', 271, N'Machop Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (274, CAST(N'2016-10-03T01:07:30.0408683' AS DateTime2), NULL, N'en', 272, N'Machoke Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (275, CAST(N'2016-10-03T01:07:30.0408683' AS DateTime2), NULL, N'vi', 273, N'Machoke Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (276, CAST(N'2016-10-03T01:07:30.0408683' AS DateTime2), NULL, N'en', 274, N'Machoke Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (277, CAST(N'2016-10-03T01:07:30.0408683' AS DateTime2), NULL, N'vi', 275, N'Machoke Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (278, CAST(N'2016-10-03T01:07:30.1658706' AS DateTime2), NULL, N'en', 276, N'Machamp Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (279, CAST(N'2016-10-03T01:07:30.1658706' AS DateTime2), NULL, N'vi', 277, N'Machamp Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (280, CAST(N'2016-10-03T01:07:30.1658706' AS DateTime2), NULL, N'en', 278, N'Machamp Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (281, CAST(N'2016-10-03T01:07:30.1658706' AS DateTime2), NULL, N'vi', 279, N'Machamp Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (282, CAST(N'2016-10-03T01:07:30.2743519' AS DateTime2), NULL, N'en', 280, N'Bellsprout Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (283, CAST(N'2016-10-03T01:07:30.2743519' AS DateTime2), NULL, N'vi', 281, N'Bellsprout Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (284, CAST(N'2016-10-03T01:07:30.2743519' AS DateTime2), NULL, N'en', 282, N'Bellsprout Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (285, CAST(N'2016-10-03T01:07:30.2743519' AS DateTime2), NULL, N'vi', 283, N'Bellsprout Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (286, CAST(N'2016-10-03T01:07:30.3912767' AS DateTime2), NULL, N'en', 284, N'Weepinbell Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (287, CAST(N'2016-10-03T01:07:30.3912767' AS DateTime2), NULL, N'vi', 285, N'Weepinbell Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (288, CAST(N'2016-10-03T01:07:30.3912767' AS DateTime2), NULL, N'en', 286, N'Weepinbell Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (289, CAST(N'2016-10-03T01:07:30.3912767' AS DateTime2), NULL, N'vi', 287, N'Weepinbell Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (290, CAST(N'2016-10-03T01:07:30.5027716' AS DateTime2), NULL, N'en', 288, N'Victreebel Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (291, CAST(N'2016-10-03T01:07:30.5027716' AS DateTime2), NULL, N'vi', 289, N'Victreebel Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (292, CAST(N'2016-10-03T01:07:30.5027716' AS DateTime2), NULL, N'en', 290, N'Victreebel Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (293, CAST(N'2016-10-03T01:07:30.5027716' AS DateTime2), NULL, N'vi', 291, N'Victreebel Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (294, CAST(N'2016-10-03T01:07:30.6072714' AS DateTime2), NULL, N'en', 292, N'Tentacool Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (295, CAST(N'2016-10-03T01:07:30.6072714' AS DateTime2), NULL, N'vi', 293, N'Tentacool Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (296, CAST(N'2016-10-03T01:07:30.6072714' AS DateTime2), NULL, N'en', 294, N'Tentacool Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (297, CAST(N'2016-10-03T01:07:30.6072714' AS DateTime2), NULL, N'vi', 295, N'Tentacool Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (298, CAST(N'2016-10-03T01:07:30.7186572' AS DateTime2), NULL, N'en', 296, N'Tentacruel Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (299, CAST(N'2016-10-03T01:07:30.7186572' AS DateTime2), NULL, N'vi', 297, N'Tentacruel Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (300, CAST(N'2016-10-03T01:07:30.7186572' AS DateTime2), NULL, N'en', 298, N'Tentacruel Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (301, CAST(N'2016-10-03T01:07:30.7186572' AS DateTime2), NULL, N'vi', 299, N'Tentacruel Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (302, CAST(N'2016-10-03T01:07:30.8274746' AS DateTime2), NULL, N'en', 300, N'Geodude Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (303, CAST(N'2016-10-03T01:07:30.8274746' AS DateTime2), NULL, N'vi', 301, N'Geodude Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (304, CAST(N'2016-10-03T01:07:30.8274746' AS DateTime2), NULL, N'en', 302, N'Geodude Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (305, CAST(N'2016-10-03T01:07:30.8274746' AS DateTime2), NULL, N'vi', 303, N'Geodude Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (306, CAST(N'2016-10-03T01:07:30.9404920' AS DateTime2), NULL, N'en', 304, N'Graveler Description English', NULL, NULL)
GO
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (307, CAST(N'2016-10-03T01:07:30.9404920' AS DateTime2), NULL, N'vi', 305, N'Graveler Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (308, CAST(N'2016-10-03T01:07:30.9404920' AS DateTime2), NULL, N'en', 306, N'Graveler Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (309, CAST(N'2016-10-03T01:07:30.9404920' AS DateTime2), NULL, N'vi', 307, N'Graveler Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (310, CAST(N'2016-10-03T01:07:31.0584902' AS DateTime2), NULL, N'en', 308, N'Golem Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (311, CAST(N'2016-10-03T01:07:31.0584902' AS DateTime2), NULL, N'vi', 309, N'Golem Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (312, CAST(N'2016-10-03T01:07:31.0584902' AS DateTime2), NULL, N'en', 310, N'Golem Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (313, CAST(N'2016-10-03T01:07:31.0584902' AS DateTime2), NULL, N'vi', 311, N'Golem Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (314, CAST(N'2016-10-03T01:07:31.1920713' AS DateTime2), NULL, N'en', 312, N'Ponyta Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (315, CAST(N'2016-10-03T01:07:31.1920713' AS DateTime2), NULL, N'vi', 313, N'Ponyta Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (316, CAST(N'2016-10-03T01:07:31.1920713' AS DateTime2), NULL, N'en', 314, N'Ponyta Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (317, CAST(N'2016-10-03T01:07:31.1920713' AS DateTime2), NULL, N'vi', 315, N'Ponyta Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (318, CAST(N'2016-10-03T01:07:31.3087335' AS DateTime2), NULL, N'en', 316, N'Rapidash Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (319, CAST(N'2016-10-03T01:07:31.3087335' AS DateTime2), NULL, N'vi', 317, N'Rapidash Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (320, CAST(N'2016-10-03T01:07:31.3087335' AS DateTime2), NULL, N'en', 318, N'Rapidash Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (321, CAST(N'2016-10-03T01:07:31.3087335' AS DateTime2), NULL, N'vi', 319, N'Rapidash Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (322, CAST(N'2016-10-03T01:07:31.4258008' AS DateTime2), NULL, N'en', 320, N'Slowpoke Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (323, CAST(N'2016-10-03T01:07:31.4258008' AS DateTime2), NULL, N'vi', 321, N'Slowpoke Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (324, CAST(N'2016-10-03T01:07:31.4258008' AS DateTime2), NULL, N'en', 322, N'Slowpoke Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (325, CAST(N'2016-10-03T01:07:31.4258008' AS DateTime2), NULL, N'vi', 323, N'Slowpoke Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (326, CAST(N'2016-10-03T01:07:31.6996912' AS DateTime2), NULL, N'en', 324, N'Slowbro Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (327, CAST(N'2016-10-03T01:07:31.6996912' AS DateTime2), NULL, N'vi', 325, N'Slowbro Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (328, CAST(N'2016-10-03T01:07:31.6996912' AS DateTime2), NULL, N'en', 326, N'Slowbro Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (329, CAST(N'2016-10-03T01:07:31.6996912' AS DateTime2), NULL, N'vi', 327, N'Slowbro Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (330, CAST(N'2016-10-03T01:07:31.8170715' AS DateTime2), NULL, N'en', 328, N'Magnemite Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (331, CAST(N'2016-10-03T01:07:31.8170715' AS DateTime2), NULL, N'vi', 329, N'Magnemite Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (332, CAST(N'2016-10-03T01:07:31.8170715' AS DateTime2), NULL, N'en', 330, N'Magnemite Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (333, CAST(N'2016-10-03T01:07:31.8170715' AS DateTime2), NULL, N'vi', 331, N'Magnemite Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (334, CAST(N'2016-10-03T01:07:31.9590149' AS DateTime2), NULL, N'en', 332, N'Magneton Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (335, CAST(N'2016-10-03T01:07:31.9590149' AS DateTime2), NULL, N'vi', 333, N'Magneton Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (336, CAST(N'2016-10-03T01:07:31.9590149' AS DateTime2), NULL, N'en', 334, N'Magneton Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (337, CAST(N'2016-10-03T01:07:31.9590149' AS DateTime2), NULL, N'vi', 335, N'Magneton Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (338, CAST(N'2016-10-03T01:07:32.0751772' AS DateTime2), NULL, N'en', 336, N'Farfetchd Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (339, CAST(N'2016-10-03T01:07:32.0751772' AS DateTime2), NULL, N'vi', 337, N'Farfetchd Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (340, CAST(N'2016-10-03T01:07:32.0751772' AS DateTime2), NULL, N'en', 338, N'Farfetchd Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (341, CAST(N'2016-10-03T01:07:32.0751772' AS DateTime2), NULL, N'vi', 339, N'Farfetchd Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (342, CAST(N'2016-10-03T01:07:32.1928693' AS DateTime2), NULL, N'en', 340, N'Doduo Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (343, CAST(N'2016-10-03T01:07:32.1928693' AS DateTime2), NULL, N'vi', 341, N'Doduo Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (344, CAST(N'2016-10-03T01:07:32.1928693' AS DateTime2), NULL, N'en', 342, N'Doduo Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (345, CAST(N'2016-10-03T01:07:32.1928693' AS DateTime2), NULL, N'vi', 343, N'Doduo Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (346, CAST(N'2016-10-03T01:07:32.3183527' AS DateTime2), NULL, N'en', 344, N'Dodrio Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (347, CAST(N'2016-10-03T01:07:32.3183527' AS DateTime2), NULL, N'vi', 345, N'Dodrio Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (348, CAST(N'2016-10-03T01:07:32.3183527' AS DateTime2), NULL, N'en', 346, N'Dodrio Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (349, CAST(N'2016-10-03T01:07:32.3183527' AS DateTime2), NULL, N'vi', 347, N'Dodrio Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (350, CAST(N'2016-10-03T01:07:32.4433880' AS DateTime2), NULL, N'en', 348, N'Seel Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (351, CAST(N'2016-10-03T01:07:32.4433880' AS DateTime2), NULL, N'vi', 349, N'Seel Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (352, CAST(N'2016-10-03T01:07:32.4433880' AS DateTime2), NULL, N'en', 350, N'Seel Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (353, CAST(N'2016-10-03T01:07:32.4433880' AS DateTime2), NULL, N'vi', 351, N'Seel Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (354, CAST(N'2016-10-03T01:07:32.5682916' AS DateTime2), NULL, N'en', 352, N'Dewgong Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (355, CAST(N'2016-10-03T01:07:32.5682916' AS DateTime2), NULL, N'vi', 353, N'Dewgong Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (356, CAST(N'2016-10-03T01:07:32.5682916' AS DateTime2), NULL, N'en', 354, N'Dewgong Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (357, CAST(N'2016-10-03T01:07:32.5682916' AS DateTime2), NULL, N'vi', 355, N'Dewgong Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (358, CAST(N'2016-10-03T01:07:32.6932952' AS DateTime2), NULL, N'en', 356, N'Grimer Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (359, CAST(N'2016-10-03T01:07:32.6932952' AS DateTime2), NULL, N'vi', 357, N'Grimer Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (360, CAST(N'2016-10-03T01:07:32.6932952' AS DateTime2), NULL, N'en', 358, N'Grimer Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (361, CAST(N'2016-10-03T01:07:32.6932952' AS DateTime2), NULL, N'vi', 359, N'Grimer Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (362, CAST(N'2016-10-03T01:07:32.8187830' AS DateTime2), NULL, N'en', 360, N'Muk Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (363, CAST(N'2016-10-03T01:07:32.8187830' AS DateTime2), NULL, N'vi', 361, N'Muk Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (364, CAST(N'2016-10-03T01:07:32.8187830' AS DateTime2), NULL, N'en', 362, N'Muk Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (365, CAST(N'2016-10-03T01:07:32.8187830' AS DateTime2), NULL, N'vi', 363, N'Muk Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (366, CAST(N'2016-10-03T01:07:32.9667841' AS DateTime2), NULL, N'en', 364, N'Shellder Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (367, CAST(N'2016-10-03T01:07:32.9667841' AS DateTime2), NULL, N'vi', 365, N'Shellder Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (368, CAST(N'2016-10-03T01:07:32.9667841' AS DateTime2), NULL, N'en', 366, N'Shellder Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (369, CAST(N'2016-10-03T01:07:32.9667841' AS DateTime2), NULL, N'vi', 367, N'Shellder Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (370, CAST(N'2016-10-03T01:07:33.0904231' AS DateTime2), NULL, N'en', 368, N'Cloyster Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (371, CAST(N'2016-10-03T01:07:33.0904231' AS DateTime2), NULL, N'vi', 369, N'Cloyster Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (372, CAST(N'2016-10-03T01:07:33.0904231' AS DateTime2), NULL, N'en', 370, N'Cloyster Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (373, CAST(N'2016-10-03T01:07:33.0904231' AS DateTime2), NULL, N'vi', 371, N'Cloyster Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (374, CAST(N'2016-10-03T01:07:33.2270991' AS DateTime2), NULL, N'en', 372, N'Gastly Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (375, CAST(N'2016-10-03T01:07:33.2270991' AS DateTime2), NULL, N'vi', 373, N'Gastly Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (376, CAST(N'2016-10-03T01:07:33.2270991' AS DateTime2), NULL, N'en', 374, N'Gastly Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (377, CAST(N'2016-10-03T01:07:33.2270991' AS DateTime2), NULL, N'vi', 375, N'Gastly Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (378, CAST(N'2016-10-03T01:07:33.3610565' AS DateTime2), NULL, N'en', 376, N'Haunter Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (379, CAST(N'2016-10-03T01:07:33.3610565' AS DateTime2), NULL, N'vi', 377, N'Haunter Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (380, CAST(N'2016-10-03T01:07:33.3610565' AS DateTime2), NULL, N'en', 378, N'Haunter Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (381, CAST(N'2016-10-03T01:07:33.3610565' AS DateTime2), NULL, N'vi', 379, N'Haunter Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (382, CAST(N'2016-10-03T01:07:33.4955673' AS DateTime2), NULL, N'en', 380, N'Gengar Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (383, CAST(N'2016-10-03T01:07:33.4955673' AS DateTime2), NULL, N'vi', 381, N'Gengar Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (384, CAST(N'2016-10-03T01:07:33.4955673' AS DateTime2), NULL, N'en', 382, N'Gengar Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (385, CAST(N'2016-10-03T01:07:33.4955673' AS DateTime2), NULL, N'vi', 383, N'Gengar Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (386, CAST(N'2016-10-03T01:07:33.6251636' AS DateTime2), NULL, N'en', 384, N'Onix Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (387, CAST(N'2016-10-03T01:07:33.6251636' AS DateTime2), NULL, N'vi', 385, N'Onix Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (388, CAST(N'2016-10-03T01:07:33.6251636' AS DateTime2), NULL, N'en', 386, N'Onix Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (389, CAST(N'2016-10-03T01:07:33.6251636' AS DateTime2), NULL, N'vi', 387, N'Onix Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (390, CAST(N'2016-10-03T01:07:33.7621911' AS DateTime2), NULL, N'en', 388, N'Drowzee Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (391, CAST(N'2016-10-03T01:07:33.7621911' AS DateTime2), NULL, N'vi', 389, N'Drowzee Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (392, CAST(N'2016-10-03T01:07:33.7621911' AS DateTime2), NULL, N'en', 390, N'Drowzee Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (393, CAST(N'2016-10-03T01:07:33.7621911' AS DateTime2), NULL, N'vi', 391, N'Drowzee Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (394, CAST(N'2016-10-03T01:07:33.8956743' AS DateTime2), NULL, N'en', 392, N'Hypno Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (395, CAST(N'2016-10-03T01:07:33.8956743' AS DateTime2), NULL, N'vi', 393, N'Hypno Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (396, CAST(N'2016-10-03T01:07:33.8956743' AS DateTime2), NULL, N'en', 394, N'Hypno Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (397, CAST(N'2016-10-03T01:07:33.8956743' AS DateTime2), NULL, N'vi', 395, N'Hypno Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (398, CAST(N'2016-10-03T01:07:34.0376682' AS DateTime2), NULL, N'en', 396, N'Krabby Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (399, CAST(N'2016-10-03T01:07:34.0376682' AS DateTime2), NULL, N'vi', 397, N'Krabby Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (400, CAST(N'2016-10-03T01:07:34.0376682' AS DateTime2), NULL, N'en', 398, N'Krabby Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (401, CAST(N'2016-10-03T01:07:34.0376682' AS DateTime2), NULL, N'vi', 399, N'Krabby Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (402, CAST(N'2016-10-03T01:07:34.1785155' AS DateTime2), NULL, N'en', 400, N'Kingler Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (403, CAST(N'2016-10-03T01:07:34.1785155' AS DateTime2), NULL, N'vi', 401, N'Kingler Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (404, CAST(N'2016-10-03T01:07:34.1785155' AS DateTime2), NULL, N'en', 402, N'Kingler Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (405, CAST(N'2016-10-03T01:07:34.1785155' AS DateTime2), NULL, N'vi', 403, N'Kingler Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (406, CAST(N'2016-10-03T01:07:34.3140091' AS DateTime2), NULL, N'en', 404, N'Voltorb Description English', NULL, NULL)
GO
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (407, CAST(N'2016-10-03T01:07:34.3140091' AS DateTime2), NULL, N'vi', 405, N'Voltorb Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (408, CAST(N'2016-10-03T01:07:34.3140091' AS DateTime2), NULL, N'en', 406, N'Voltorb Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (409, CAST(N'2016-10-03T01:07:34.3140091' AS DateTime2), NULL, N'vi', 407, N'Voltorb Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (410, CAST(N'2016-10-03T01:07:34.4575074' AS DateTime2), NULL, N'en', 408, N'Electrode Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (411, CAST(N'2016-10-03T01:07:34.4575074' AS DateTime2), NULL, N'vi', 409, N'Electrode Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (412, CAST(N'2016-10-03T01:07:34.4575074' AS DateTime2), NULL, N'en', 410, N'Electrode Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (413, CAST(N'2016-10-03T01:07:34.4575074' AS DateTime2), NULL, N'vi', 411, N'Electrode Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (414, CAST(N'2016-10-03T01:07:34.5940107' AS DateTime2), NULL, N'en', 412, N'Exeggcute Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (415, CAST(N'2016-10-03T01:07:34.5940107' AS DateTime2), NULL, N'vi', 413, N'Exeggcute Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (416, CAST(N'2016-10-03T01:07:34.5940107' AS DateTime2), NULL, N'en', 414, N'Exeggcute Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (417, CAST(N'2016-10-03T01:07:34.5940107' AS DateTime2), NULL, N'vi', 415, N'Exeggcute Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (418, CAST(N'2016-10-03T01:07:34.7384071' AS DateTime2), NULL, N'en', 416, N'Exeggutor Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (419, CAST(N'2016-10-03T01:07:34.7384071' AS DateTime2), NULL, N'vi', 417, N'Exeggutor Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (420, CAST(N'2016-10-03T01:07:34.7384071' AS DateTime2), NULL, N'en', 418, N'Exeggutor Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (421, CAST(N'2016-10-03T01:07:34.7384071' AS DateTime2), NULL, N'vi', 419, N'Exeggutor Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (422, CAST(N'2016-10-03T01:07:34.8884200' AS DateTime2), NULL, N'en', 420, N'Cubone Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (423, CAST(N'2016-10-03T01:07:34.8884200' AS DateTime2), NULL, N'vi', 421, N'Cubone Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (424, CAST(N'2016-10-03T01:07:34.8884200' AS DateTime2), NULL, N'en', 422, N'Cubone Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (425, CAST(N'2016-10-03T01:07:34.8884200' AS DateTime2), NULL, N'vi', 423, N'Cubone Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (426, CAST(N'2016-10-03T01:07:35.0520322' AS DateTime2), NULL, N'en', 424, N'Marowak Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (427, CAST(N'2016-10-03T01:07:35.0520322' AS DateTime2), NULL, N'vi', 425, N'Marowak Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (428, CAST(N'2016-10-03T01:07:35.0520322' AS DateTime2), NULL, N'en', 426, N'Marowak Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (429, CAST(N'2016-10-03T01:07:35.0520322' AS DateTime2), NULL, N'vi', 427, N'Marowak Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (430, CAST(N'2016-10-03T01:07:35.2040973' AS DateTime2), NULL, N'en', 428, N'Hitmonlee Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (431, CAST(N'2016-10-03T01:07:35.2040973' AS DateTime2), NULL, N'vi', 429, N'Hitmonlee Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (432, CAST(N'2016-10-03T01:07:35.2040973' AS DateTime2), NULL, N'en', 430, N'Hitmonlee Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (433, CAST(N'2016-10-03T01:07:35.2040973' AS DateTime2), NULL, N'vi', 431, N'Hitmonlee Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (434, CAST(N'2016-10-03T01:07:35.3546238' AS DateTime2), NULL, N'en', 432, N'Hitmonchan Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (435, CAST(N'2016-10-03T01:07:35.3546238' AS DateTime2), NULL, N'vi', 433, N'Hitmonchan Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (436, CAST(N'2016-10-03T01:07:35.3546238' AS DateTime2), NULL, N'en', 434, N'Hitmonchan Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (437, CAST(N'2016-10-03T01:07:35.3546238' AS DateTime2), NULL, N'vi', 435, N'Hitmonchan Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (438, CAST(N'2016-10-03T01:07:35.5046178' AS DateTime2), NULL, N'en', 436, N'Lickitung Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (439, CAST(N'2016-10-03T01:07:35.5046178' AS DateTime2), NULL, N'vi', 437, N'Lickitung Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (440, CAST(N'2016-10-03T01:07:35.5046178' AS DateTime2), NULL, N'en', 438, N'Lickitung Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (441, CAST(N'2016-10-03T01:07:35.5046178' AS DateTime2), NULL, N'vi', 439, N'Lickitung Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (442, CAST(N'2016-10-03T01:07:35.6491169' AS DateTime2), NULL, N'en', 440, N'Koffing Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (443, CAST(N'2016-10-03T01:07:35.6491169' AS DateTime2), NULL, N'vi', 441, N'Koffing Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (444, CAST(N'2016-10-03T01:07:35.6491169' AS DateTime2), NULL, N'en', 442, N'Koffing Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (445, CAST(N'2016-10-03T01:07:35.6491169' AS DateTime2), NULL, N'vi', 443, N'Koffing Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (446, CAST(N'2016-10-03T01:07:35.7976068' AS DateTime2), NULL, N'en', 444, N'Weezing Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (447, CAST(N'2016-10-03T01:07:35.7976068' AS DateTime2), NULL, N'vi', 445, N'Weezing Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (448, CAST(N'2016-10-03T01:07:35.7976068' AS DateTime2), NULL, N'en', 446, N'Weezing Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (449, CAST(N'2016-10-03T01:07:35.7976068' AS DateTime2), NULL, N'vi', 447, N'Weezing Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (450, CAST(N'2016-10-03T01:07:35.9476068' AS DateTime2), NULL, N'en', 448, N'Rhyhorn Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (451, CAST(N'2016-10-03T01:07:35.9476068' AS DateTime2), NULL, N'vi', 449, N'Rhyhorn Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (452, CAST(N'2016-10-03T01:07:35.9476068' AS DateTime2), NULL, N'en', 450, N'Rhyhorn Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (453, CAST(N'2016-10-03T01:07:35.9476068' AS DateTime2), NULL, N'vi', 451, N'Rhyhorn Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (454, CAST(N'2016-10-03T01:07:36.0966202' AS DateTime2), NULL, N'en', 452, N'Rhydon Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (455, CAST(N'2016-10-03T01:07:36.0966202' AS DateTime2), NULL, N'vi', 453, N'Rhydon Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (456, CAST(N'2016-10-03T01:07:36.0966202' AS DateTime2), NULL, N'en', 454, N'Rhydon Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (457, CAST(N'2016-10-03T01:07:36.0966202' AS DateTime2), NULL, N'vi', 455, N'Rhydon Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (458, CAST(N'2016-10-03T01:07:36.2471240' AS DateTime2), NULL, N'en', 456, N'Chansey Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (459, CAST(N'2016-10-03T01:07:36.2471240' AS DateTime2), NULL, N'vi', 457, N'Chansey Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (460, CAST(N'2016-10-03T01:07:36.2471240' AS DateTime2), NULL, N'en', 458, N'Chansey Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (461, CAST(N'2016-10-03T01:07:36.2471240' AS DateTime2), NULL, N'vi', 459, N'Chansey Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (462, CAST(N'2016-10-03T01:07:36.3972964' AS DateTime2), NULL, N'en', 460, N'Tangela Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (463, CAST(N'2016-10-03T01:07:36.3972964' AS DateTime2), NULL, N'vi', 461, N'Tangela Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (464, CAST(N'2016-10-03T01:07:36.3972964' AS DateTime2), NULL, N'en', 462, N'Tangela Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (465, CAST(N'2016-10-03T01:07:36.3972964' AS DateTime2), NULL, N'vi', 463, N'Tangela Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (466, CAST(N'2016-10-03T01:07:36.5553247' AS DateTime2), NULL, N'en', 464, N'Kangaskhan Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (467, CAST(N'2016-10-03T01:07:36.5553247' AS DateTime2), NULL, N'vi', 465, N'Kangaskhan Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (468, CAST(N'2016-10-03T01:07:36.5553247' AS DateTime2), NULL, N'en', 466, N'Kangaskhan Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (469, CAST(N'2016-10-03T01:07:36.5553247' AS DateTime2), NULL, N'vi', 467, N'Kangaskhan Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (470, CAST(N'2016-10-03T01:07:36.7138247' AS DateTime2), NULL, N'en', 468, N'Horsea Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (471, CAST(N'2016-10-03T01:07:36.7138247' AS DateTime2), NULL, N'vi', 469, N'Horsea Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (472, CAST(N'2016-10-03T01:07:36.7138247' AS DateTime2), NULL, N'en', 470, N'Horsea Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (473, CAST(N'2016-10-03T01:07:36.7138247' AS DateTime2), NULL, N'vi', 471, N'Horsea Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (474, CAST(N'2016-10-03T01:07:36.8723244' AS DateTime2), NULL, N'en', 472, N'Seadra Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (475, CAST(N'2016-10-03T01:07:36.8723244' AS DateTime2), NULL, N'vi', 473, N'Seadra Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (476, CAST(N'2016-10-03T01:07:36.8723244' AS DateTime2), NULL, N'en', 474, N'Seadra Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (477, CAST(N'2016-10-03T01:07:36.8723244' AS DateTime2), NULL, N'vi', 475, N'Seadra Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (478, CAST(N'2016-10-03T01:07:37.0307979' AS DateTime2), NULL, N'en', 476, N'Goldeen Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (479, CAST(N'2016-10-03T01:07:37.0307979' AS DateTime2), NULL, N'vi', 477, N'Goldeen Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (480, CAST(N'2016-10-03T01:07:37.0307979' AS DateTime2), NULL, N'en', 478, N'Goldeen Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (481, CAST(N'2016-10-03T01:07:37.0307979' AS DateTime2), NULL, N'vi', 479, N'Goldeen Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (482, CAST(N'2016-10-03T01:07:37.1893078' AS DateTime2), NULL, N'en', 480, N'Seaking Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (483, CAST(N'2016-10-03T01:07:37.1893078' AS DateTime2), NULL, N'vi', 481, N'Seaking Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (484, CAST(N'2016-10-03T01:07:37.1893078' AS DateTime2), NULL, N'en', 482, N'Seaking Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (485, CAST(N'2016-10-03T01:07:37.1893078' AS DateTime2), NULL, N'vi', 483, N'Seaking Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (486, CAST(N'2016-10-03T01:07:37.3477959' AS DateTime2), NULL, N'en', 484, N'Staryu Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (487, CAST(N'2016-10-03T01:07:37.3477959' AS DateTime2), NULL, N'vi', 485, N'Staryu Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (488, CAST(N'2016-10-03T01:07:37.3477959' AS DateTime2), NULL, N'en', 486, N'Staryu Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (489, CAST(N'2016-10-03T01:07:37.3477959' AS DateTime2), NULL, N'vi', 487, N'Staryu Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (490, CAST(N'2016-10-03T01:07:37.5073129' AS DateTime2), NULL, N'en', 488, N'Starmie Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (491, CAST(N'2016-10-03T01:07:37.5073129' AS DateTime2), NULL, N'vi', 489, N'Starmie Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (492, CAST(N'2016-10-03T01:07:37.5073129' AS DateTime2), NULL, N'en', 490, N'Starmie Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (493, CAST(N'2016-10-03T01:07:37.5073129' AS DateTime2), NULL, N'vi', 491, N'Starmie Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (494, CAST(N'2016-10-03T01:07:37.6658642' AS DateTime2), NULL, N'en', 492, N'MrMime Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (495, CAST(N'2016-10-03T01:07:37.6658642' AS DateTime2), NULL, N'vi', 493, N'MrMime Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (496, CAST(N'2016-10-03T01:07:37.6658642' AS DateTime2), NULL, N'en', 494, N'MrMime Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (497, CAST(N'2016-10-03T01:07:37.6658642' AS DateTime2), NULL, N'vi', 495, N'MrMime Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (498, CAST(N'2016-10-03T01:07:37.8313919' AS DateTime2), NULL, N'en', 496, N'Scyther Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (499, CAST(N'2016-10-03T01:07:37.8313919' AS DateTime2), NULL, N'vi', 497, N'Scyther Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (500, CAST(N'2016-10-03T01:07:37.8313919' AS DateTime2), NULL, N'en', 498, N'Scyther Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (501, CAST(N'2016-10-03T01:07:37.8313919' AS DateTime2), NULL, N'vi', 499, N'Scyther Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (502, CAST(N'2016-10-03T01:07:38.0068749' AS DateTime2), NULL, N'en', 500, N'Jynx Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (503, CAST(N'2016-10-03T01:07:38.0068749' AS DateTime2), NULL, N'vi', 501, N'Jynx Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (504, CAST(N'2016-10-03T01:07:38.0068749' AS DateTime2), NULL, N'en', 502, N'Jynx Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (505, CAST(N'2016-10-03T01:07:38.0068749' AS DateTime2), NULL, N'vi', 503, N'Jynx Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (506, CAST(N'2016-10-03T01:07:38.1733627' AS DateTime2), NULL, N'en', 504, N'Electabuzz Description English', NULL, NULL)
GO
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (507, CAST(N'2016-10-03T01:07:38.1733627' AS DateTime2), NULL, N'vi', 505, N'Electabuzz Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (508, CAST(N'2016-10-03T01:07:38.1733627' AS DateTime2), NULL, N'en', 506, N'Electabuzz Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (509, CAST(N'2016-10-03T01:07:38.1733627' AS DateTime2), NULL, N'vi', 507, N'Electabuzz Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (510, CAST(N'2016-10-03T01:07:38.3343756' AS DateTime2), NULL, N'en', 508, N'Magmar Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (511, CAST(N'2016-10-03T01:07:38.3343756' AS DateTime2), NULL, N'vi', 509, N'Magmar Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (512, CAST(N'2016-10-03T01:07:38.3343756' AS DateTime2), NULL, N'en', 510, N'Magmar Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (513, CAST(N'2016-10-03T01:07:38.3343756' AS DateTime2), NULL, N'vi', 511, N'Magmar Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (514, CAST(N'2016-10-03T01:07:38.4985284' AS DateTime2), NULL, N'en', 512, N'Pinsir Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (515, CAST(N'2016-10-03T01:07:38.4985284' AS DateTime2), NULL, N'vi', 513, N'Pinsir Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (516, CAST(N'2016-10-03T01:07:38.4985284' AS DateTime2), NULL, N'en', 514, N'Pinsir Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (517, CAST(N'2016-10-03T01:07:38.4985284' AS DateTime2), NULL, N'vi', 515, N'Pinsir Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (518, CAST(N'2016-10-03T01:07:38.6656149' AS DateTime2), NULL, N'en', 516, N'Tauros Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (519, CAST(N'2016-10-03T01:07:38.6656149' AS DateTime2), NULL, N'vi', 517, N'Tauros Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (520, CAST(N'2016-10-03T01:07:38.6656149' AS DateTime2), NULL, N'en', 518, N'Tauros Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (521, CAST(N'2016-10-03T01:07:38.6656149' AS DateTime2), NULL, N'vi', 519, N'Tauros Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (522, CAST(N'2016-10-03T01:07:38.8321322' AS DateTime2), NULL, N'en', 520, N'Magikarp Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (523, CAST(N'2016-10-03T01:07:38.8321322' AS DateTime2), NULL, N'vi', 521, N'Magikarp Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (524, CAST(N'2016-10-03T01:07:38.8321322' AS DateTime2), NULL, N'en', 522, N'Magikarp Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (525, CAST(N'2016-10-03T01:07:38.8321322' AS DateTime2), NULL, N'vi', 523, N'Magikarp Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (526, CAST(N'2016-10-03T01:07:38.9981136' AS DateTime2), NULL, N'en', 524, N'Gyarados Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (527, CAST(N'2016-10-03T01:07:38.9981136' AS DateTime2), NULL, N'vi', 525, N'Gyarados Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (528, CAST(N'2016-10-03T01:07:38.9981136' AS DateTime2), NULL, N'en', 526, N'Gyarados Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (529, CAST(N'2016-10-03T01:07:38.9981136' AS DateTime2), NULL, N'vi', 527, N'Gyarados Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (530, CAST(N'2016-10-03T01:07:39.1751298' AS DateTime2), NULL, N'en', 528, N'Lapras Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (531, CAST(N'2016-10-03T01:07:39.1751298' AS DateTime2), NULL, N'vi', 529, N'Lapras Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (532, CAST(N'2016-10-03T01:07:39.1751298' AS DateTime2), NULL, N'en', 530, N'Lapras Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (533, CAST(N'2016-10-03T01:07:39.1751298' AS DateTime2), NULL, N'vi', 531, N'Lapras Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (534, CAST(N'2016-10-03T01:07:39.3493495' AS DateTime2), NULL, N'en', 532, N'Ditto Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (535, CAST(N'2016-10-03T01:07:39.3493495' AS DateTime2), NULL, N'vi', 533, N'Ditto Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (536, CAST(N'2016-10-03T01:07:39.3493495' AS DateTime2), NULL, N'en', 534, N'Ditto Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (537, CAST(N'2016-10-03T01:07:39.3493495' AS DateTime2), NULL, N'vi', 535, N'Ditto Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (538, CAST(N'2016-10-03T01:07:39.5616292' AS DateTime2), NULL, N'en', 536, N'Eevee Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (539, CAST(N'2016-10-03T01:07:39.5616292' AS DateTime2), NULL, N'vi', 537, N'Eevee Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (540, CAST(N'2016-10-03T01:07:39.5616292' AS DateTime2), NULL, N'en', 538, N'Eevee Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (541, CAST(N'2016-10-03T01:07:39.5616292' AS DateTime2), NULL, N'vi', 539, N'Eevee Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (542, CAST(N'2016-10-03T01:07:39.7746020' AS DateTime2), NULL, N'en', 540, N'Vaporeon Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (543, CAST(N'2016-10-03T01:07:39.7746020' AS DateTime2), NULL, N'vi', 541, N'Vaporeon Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (544, CAST(N'2016-10-03T01:07:39.7746020' AS DateTime2), NULL, N'en', 542, N'Vaporeon Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (545, CAST(N'2016-10-03T01:07:39.7746020' AS DateTime2), NULL, N'vi', 543, N'Vaporeon Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (546, CAST(N'2016-10-03T01:07:39.9500179' AS DateTime2), NULL, N'en', 544, N'Jolteon Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (547, CAST(N'2016-10-03T01:07:39.9500179' AS DateTime2), NULL, N'vi', 545, N'Jolteon Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (548, CAST(N'2016-10-03T01:07:39.9500179' AS DateTime2), NULL, N'en', 546, N'Jolteon Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (549, CAST(N'2016-10-03T01:07:39.9500179' AS DateTime2), NULL, N'vi', 547, N'Jolteon Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (550, CAST(N'2016-10-03T01:07:40.1250288' AS DateTime2), NULL, N'en', 548, N'Flareon Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (551, CAST(N'2016-10-03T01:07:40.1250288' AS DateTime2), NULL, N'vi', 549, N'Flareon Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (552, CAST(N'2016-10-03T01:07:40.1250288' AS DateTime2), NULL, N'en', 550, N'Flareon Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (553, CAST(N'2016-10-03T01:07:40.1250288' AS DateTime2), NULL, N'vi', 551, N'Flareon Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (554, CAST(N'2016-10-03T01:07:40.3085167' AS DateTime2), NULL, N'en', 552, N'Porygon Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (555, CAST(N'2016-10-03T01:07:40.3085167' AS DateTime2), NULL, N'vi', 553, N'Porygon Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (556, CAST(N'2016-10-03T01:07:40.3085167' AS DateTime2), NULL, N'en', 554, N'Porygon Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (557, CAST(N'2016-10-03T01:07:40.3085167' AS DateTime2), NULL, N'vi', 555, N'Porygon Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (558, CAST(N'2016-10-03T01:07:40.4835165' AS DateTime2), NULL, N'en', 556, N'Omanyte Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (559, CAST(N'2016-10-03T01:07:40.4835165' AS DateTime2), NULL, N'vi', 557, N'Omanyte Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (560, CAST(N'2016-10-03T01:07:40.4835165' AS DateTime2), NULL, N'en', 558, N'Omanyte Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (561, CAST(N'2016-10-03T01:07:40.4835165' AS DateTime2), NULL, N'vi', 559, N'Omanyte Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (562, CAST(N'2016-10-03T01:07:40.6750156' AS DateTime2), NULL, N'en', 560, N'Omastar Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (563, CAST(N'2016-10-03T01:07:40.6750156' AS DateTime2), NULL, N'vi', 561, N'Omastar Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (564, CAST(N'2016-10-03T01:07:40.6750156' AS DateTime2), NULL, N'en', 562, N'Omastar Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (565, CAST(N'2016-10-03T01:07:40.6750156' AS DateTime2), NULL, N'vi', 563, N'Omastar Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (566, CAST(N'2016-10-03T01:07:40.8470171' AS DateTime2), NULL, N'en', 564, N'Kabuto Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (567, CAST(N'2016-10-03T01:07:40.8470171' AS DateTime2), NULL, N'vi', 565, N'Kabuto Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (568, CAST(N'2016-10-03T01:07:40.8470171' AS DateTime2), NULL, N'en', 566, N'Kabuto Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (569, CAST(N'2016-10-03T01:07:40.8470171' AS DateTime2), NULL, N'vi', 567, N'Kabuto Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (570, CAST(N'2016-10-03T01:07:41.0270166' AS DateTime2), NULL, N'en', 568, N'Kabutops Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (571, CAST(N'2016-10-03T01:07:41.0270166' AS DateTime2), NULL, N'vi', 569, N'Kabutops Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (572, CAST(N'2016-10-03T01:07:41.0270166' AS DateTime2), NULL, N'en', 570, N'Kabutops Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (573, CAST(N'2016-10-03T01:07:41.0270166' AS DateTime2), NULL, N'vi', 571, N'Kabutops Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (574, CAST(N'2016-10-03T01:07:41.2090166' AS DateTime2), NULL, N'en', 572, N'Aerodactyl Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (575, CAST(N'2016-10-03T01:07:41.2090166' AS DateTime2), NULL, N'vi', 573, N'Aerodactyl Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (576, CAST(N'2016-10-03T01:07:41.2090166' AS DateTime2), NULL, N'en', 574, N'Aerodactyl Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (577, CAST(N'2016-10-03T01:07:41.2090166' AS DateTime2), NULL, N'vi', 575, N'Aerodactyl Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (578, CAST(N'2016-10-03T01:07:41.3925178' AS DateTime2), NULL, N'en', 576, N'Snorlax Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (579, CAST(N'2016-10-03T01:07:41.3925178' AS DateTime2), NULL, N'vi', 577, N'Snorlax Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (580, CAST(N'2016-10-03T01:07:41.3925178' AS DateTime2), NULL, N'en', 578, N'Snorlax Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (581, CAST(N'2016-10-03T01:07:41.3925178' AS DateTime2), NULL, N'vi', 579, N'Snorlax Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (582, CAST(N'2016-10-03T01:07:41.5760172' AS DateTime2), NULL, N'en', 580, N'Articuno Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (583, CAST(N'2016-10-03T01:07:41.5760172' AS DateTime2), NULL, N'vi', 581, N'Articuno Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (584, CAST(N'2016-10-03T01:07:41.5760172' AS DateTime2), NULL, N'en', 582, N'Articuno Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (585, CAST(N'2016-10-03T01:07:41.5760172' AS DateTime2), NULL, N'vi', 583, N'Articuno Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (586, CAST(N'2016-10-03T01:07:41.8927619' AS DateTime2), NULL, N'en', 584, N'Zapdos Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (587, CAST(N'2016-10-03T01:07:41.8927619' AS DateTime2), NULL, N'vi', 585, N'Zapdos Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (588, CAST(N'2016-10-03T01:07:41.8927619' AS DateTime2), NULL, N'en', 586, N'Zapdos Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (589, CAST(N'2016-10-03T01:07:41.8927619' AS DateTime2), NULL, N'vi', 587, N'Zapdos Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (590, CAST(N'2016-10-03T01:07:42.0855521' AS DateTime2), NULL, N'en', 588, N'Moltres Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (591, CAST(N'2016-10-03T01:07:42.0855521' AS DateTime2), NULL, N'vi', 589, N'Moltres Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (592, CAST(N'2016-10-03T01:07:42.0855521' AS DateTime2), NULL, N'en', 590, N'Moltres Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (593, CAST(N'2016-10-03T01:07:42.0855521' AS DateTime2), NULL, N'vi', 591, N'Moltres Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (594, CAST(N'2016-10-03T01:07:42.2765466' AS DateTime2), NULL, N'en', 592, N'Dratini Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (595, CAST(N'2016-10-03T01:07:42.2765466' AS DateTime2), NULL, N'vi', 593, N'Dratini Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (596, CAST(N'2016-10-03T01:07:42.2765466' AS DateTime2), NULL, N'en', 594, N'Dratini Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (597, CAST(N'2016-10-03T01:07:42.2765466' AS DateTime2), NULL, N'vi', 595, N'Dratini Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (598, CAST(N'2016-10-03T01:07:42.4605352' AS DateTime2), NULL, N'en', 596, N'Dragonair Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (599, CAST(N'2016-10-03T01:07:42.4605352' AS DateTime2), NULL, N'vi', 597, N'Dragonair Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (600, CAST(N'2016-10-03T01:07:42.4605352' AS DateTime2), NULL, N'en', 598, N'Dragonair Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (601, CAST(N'2016-10-03T01:07:42.4605352' AS DateTime2), NULL, N'vi', 599, N'Dragonair Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (602, CAST(N'2016-10-03T01:07:42.6515451' AS DateTime2), NULL, N'en', 600, N'Dragonite Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (603, CAST(N'2016-10-03T01:07:42.6515451' AS DateTime2), NULL, N'vi', 601, N'Dragonite Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (604, CAST(N'2016-10-03T01:07:42.6515451' AS DateTime2), NULL, N'en', 602, N'Dragonite Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (605, CAST(N'2016-10-03T01:07:42.6515451' AS DateTime2), NULL, N'vi', 603, N'Dragonite Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (606, CAST(N'2016-10-03T01:07:42.8430767' AS DateTime2), NULL, N'en', 604, N'Mewtwo Description English', NULL, NULL)
GO
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (607, CAST(N'2016-10-03T01:07:42.8430767' AS DateTime2), NULL, N'vi', 605, N'Mewtwo Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (608, CAST(N'2016-10-03T01:07:42.8430767' AS DateTime2), NULL, N'en', 606, N'Mewtwo Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (609, CAST(N'2016-10-03T01:07:42.8430767' AS DateTime2), NULL, N'vi', 607, N'Mewtwo Species Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (610, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, N'en', 608, N'Mew Description English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (611, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, N'vi', 609, N'Mew Description Vietnamese', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (612, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, N'en', 610, N'Mew Species English', NULL, NULL)
INSERT [dbo].[PageLangs] ([Id], [CreatedDate], [CreatedUserId], [Language], [PageId], [Title], [UpdatedDate], [UpdatedUserId]) VALUES (613, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, N'vi', 611, N'Mew Species Vietnamese', NULL, NULL)
SET IDENTITY_INSERT [dbo].[PageLangs] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (2, N'vi', CAST(N'2016-09-17T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Pokemons', NULL, NULL, NULL, 2, 0)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (4, N'en', CAST(N'2016-09-17T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Pokemons English', NULL, NULL, NULL, 3, 0)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (6, N'en', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Bulbasaur', NULL, NULL, NULL, 4, 6)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (7, N'vi', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Bulbasaur', NULL, NULL, NULL, 5, 6)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (8, N'en', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Bulbasaur', NULL, NULL, NULL, 6, 6)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (9, N'vi', CAST(N'2016-10-02T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Bulbasaur', NULL, NULL, NULL, 7, 6)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (10, N'en', CAST(N'2016-10-03T00:52:28.7886560' AS DateTime2), NULL, 1, NULL, N'Ivysaur', NULL, NULL, NULL, 8, 10)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (11, N'vi', CAST(N'2016-10-03T00:52:43.4450063' AS DateTime2), NULL, 1, NULL, N'Ivysaur', NULL, NULL, NULL, 9, 10)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (13, N'en', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Ivysaur', NULL, NULL, NULL, 10, 10)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (15, N'vi', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Ivysaur', NULL, NULL, NULL, 13, 10)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (16, N'en', CAST(N'2016-10-03T01:07:23.7658022' AS DateTime2), NULL, 1, NULL, N'Venusaur', NULL, NULL, NULL, 14, 16)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (17, N'vi', CAST(N'2016-10-03T01:07:23.7658022' AS DateTime2), NULL, 1, NULL, N'Venusaur', NULL, NULL, NULL, 15, 16)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (18, N'en', CAST(N'2016-10-03T01:07:23.7658022' AS DateTime2), NULL, 1, NULL, N'Venusaur', NULL, NULL, NULL, 16, 16)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (19, N'vi', CAST(N'2016-10-03T01:07:23.7658022' AS DateTime2), NULL, 1, NULL, N'Venusaur', NULL, NULL, NULL, 17, 16)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (20, N'en', CAST(N'2016-10-03T01:07:23.8573026' AS DateTime2), NULL, 1, NULL, N'Charmander', NULL, NULL, NULL, 18, 20)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (21, N'vi', CAST(N'2016-10-03T01:07:23.8573026' AS DateTime2), NULL, 1, NULL, N'Charmander', NULL, NULL, NULL, 19, 20)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (22, N'en', CAST(N'2016-10-03T01:07:23.8573026' AS DateTime2), NULL, 1, NULL, N'Charmander', NULL, NULL, NULL, 20, 20)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (23, N'vi', CAST(N'2016-10-03T01:07:23.8573026' AS DateTime2), NULL, 1, NULL, N'Charmander', NULL, NULL, NULL, 21, 20)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (24, N'en', CAST(N'2016-10-03T01:07:23.9238028' AS DateTime2), NULL, 1, NULL, N'Charmeleon', NULL, NULL, NULL, 22, 24)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (25, N'vi', CAST(N'2016-10-03T01:07:23.9238028' AS DateTime2), NULL, 1, NULL, N'Charmeleon', NULL, NULL, NULL, 23, 24)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (26, N'en', CAST(N'2016-10-03T01:07:23.9238028' AS DateTime2), NULL, 1, NULL, N'Charmeleon', NULL, NULL, NULL, 24, 24)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (27, N'vi', CAST(N'2016-10-03T01:07:23.9238028' AS DateTime2), NULL, 1, NULL, N'Charmeleon', NULL, NULL, NULL, 25, 24)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (28, N'en', CAST(N'2016-10-03T01:07:23.9838022' AS DateTime2), NULL, 1, NULL, N'Charizard', NULL, NULL, NULL, 26, 28)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (29, N'vi', CAST(N'2016-10-03T01:07:23.9838022' AS DateTime2), NULL, 1, NULL, N'Charizard', NULL, NULL, NULL, 27, 28)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (30, N'en', CAST(N'2016-10-03T01:07:23.9838022' AS DateTime2), NULL, 1, NULL, N'Charizard', NULL, NULL, NULL, 28, 28)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (31, N'vi', CAST(N'2016-10-03T01:07:23.9838022' AS DateTime2), NULL, 1, NULL, N'Charizard', NULL, NULL, NULL, 29, 28)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (32, N'en', CAST(N'2016-10-03T01:07:24.0378024' AS DateTime2), NULL, 1, NULL, N'Squirtle', NULL, NULL, NULL, 30, 32)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (33, N'vi', CAST(N'2016-10-03T01:07:24.0378024' AS DateTime2), NULL, 1, NULL, N'Squirtle', NULL, NULL, NULL, 31, 32)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (34, N'en', CAST(N'2016-10-03T01:07:24.0378024' AS DateTime2), NULL, 1, NULL, N'Squirtle', NULL, NULL, NULL, 32, 32)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (35, N'vi', CAST(N'2016-10-03T01:07:24.0378024' AS DateTime2), NULL, 1, NULL, N'Squirtle', NULL, NULL, NULL, 33, 32)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (36, N'en', CAST(N'2016-10-03T01:07:24.0983146' AS DateTime2), NULL, 1, NULL, N'Wartortle', NULL, NULL, NULL, 34, 36)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (37, N'vi', CAST(N'2016-10-03T01:07:24.0983146' AS DateTime2), NULL, 1, NULL, N'Wartortle', NULL, NULL, NULL, 35, 36)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (38, N'en', CAST(N'2016-10-03T01:07:24.0983146' AS DateTime2), NULL, 1, NULL, N'Wartortle', NULL, NULL, NULL, 36, 36)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (39, N'vi', CAST(N'2016-10-03T01:07:24.0983146' AS DateTime2), NULL, 1, NULL, N'Wartortle', NULL, NULL, NULL, 37, 36)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (40, N'en', CAST(N'2016-10-03T01:07:24.1567317' AS DateTime2), NULL, 1, NULL, N'Blastoise', NULL, NULL, NULL, 38, 40)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (41, N'vi', CAST(N'2016-10-03T01:07:24.1567317' AS DateTime2), NULL, 1, NULL, N'Blastoise', NULL, NULL, NULL, 39, 40)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (42, N'en', CAST(N'2016-10-03T01:07:24.1567317' AS DateTime2), NULL, 1, NULL, N'Blastoise', NULL, NULL, NULL, 40, 40)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (43, N'vi', CAST(N'2016-10-03T01:07:24.1567317' AS DateTime2), NULL, 1, NULL, N'Blastoise', NULL, NULL, NULL, 41, 40)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (44, N'en', CAST(N'2016-10-03T01:07:24.2267219' AS DateTime2), NULL, 1, NULL, N'Caterpie', NULL, NULL, NULL, 42, 44)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (45, N'vi', CAST(N'2016-10-03T01:07:24.2267219' AS DateTime2), NULL, 1, NULL, N'Caterpie', NULL, NULL, NULL, 43, 44)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (46, N'en', CAST(N'2016-10-03T01:07:24.2267219' AS DateTime2), NULL, 1, NULL, N'Caterpie', NULL, NULL, NULL, 44, 44)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (47, N'vi', CAST(N'2016-10-03T01:07:24.2267219' AS DateTime2), NULL, 1, NULL, N'Caterpie', NULL, NULL, NULL, 45, 44)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (48, N'en', CAST(N'2016-10-03T01:07:24.2757353' AS DateTime2), NULL, 1, NULL, N'Metapod', NULL, NULL, NULL, 46, 48)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (49, N'vi', CAST(N'2016-10-03T01:07:24.2757353' AS DateTime2), NULL, 1, NULL, N'Metapod', NULL, NULL, NULL, 47, 48)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (50, N'en', CAST(N'2016-10-03T01:07:24.2757353' AS DateTime2), NULL, 1, NULL, N'Metapod', NULL, NULL, NULL, 48, 48)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (51, N'vi', CAST(N'2016-10-03T01:07:24.2757353' AS DateTime2), NULL, 1, NULL, N'Metapod', NULL, NULL, NULL, 49, 48)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (52, N'en', CAST(N'2016-10-03T01:07:24.3257328' AS DateTime2), NULL, 1, NULL, N'Butterfree', NULL, NULL, NULL, 50, 52)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (53, N'vi', CAST(N'2016-10-03T01:07:24.3257328' AS DateTime2), NULL, 1, NULL, N'Butterfree', NULL, NULL, NULL, 51, 52)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (54, N'en', CAST(N'2016-10-03T01:07:24.3257328' AS DateTime2), NULL, 1, NULL, N'Butterfree', NULL, NULL, NULL, 52, 52)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (55, N'vi', CAST(N'2016-10-03T01:07:24.3257328' AS DateTime2), NULL, 1, NULL, N'Butterfree', NULL, NULL, NULL, 53, 52)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (56, N'en', CAST(N'2016-10-03T01:07:24.3822198' AS DateTime2), NULL, 1, NULL, N'Weedle', NULL, NULL, NULL, 54, 56)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (57, N'vi', CAST(N'2016-10-03T01:07:24.3822198' AS DateTime2), NULL, 1, NULL, N'Weedle', NULL, NULL, NULL, 55, 56)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (58, N'en', CAST(N'2016-10-03T01:07:24.3822198' AS DateTime2), NULL, 1, NULL, N'Weedle', NULL, NULL, NULL, 56, 56)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (59, N'vi', CAST(N'2016-10-03T01:07:24.3822198' AS DateTime2), NULL, 1, NULL, N'Weedle', NULL, NULL, NULL, 57, 56)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (60, N'en', CAST(N'2016-10-03T01:07:24.4561924' AS DateTime2), NULL, 1, NULL, N'Kakuna', NULL, NULL, NULL, 58, 60)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (61, N'vi', CAST(N'2016-10-03T01:07:24.4561924' AS DateTime2), NULL, 1, NULL, N'Kakuna', NULL, NULL, NULL, 59, 60)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (62, N'en', CAST(N'2016-10-03T01:07:24.4561924' AS DateTime2), NULL, 1, NULL, N'Kakuna', NULL, NULL, NULL, 60, 60)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (63, N'vi', CAST(N'2016-10-03T01:07:24.4561924' AS DateTime2), NULL, 1, NULL, N'Kakuna', NULL, NULL, NULL, 61, 60)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (64, N'en', CAST(N'2016-10-03T01:07:24.5146937' AS DateTime2), NULL, 1, NULL, N'Beedrill', NULL, NULL, NULL, 62, 64)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (65, N'vi', CAST(N'2016-10-03T01:07:24.5146937' AS DateTime2), NULL, 1, NULL, N'Beedrill', NULL, NULL, NULL, 63, 64)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (66, N'en', CAST(N'2016-10-03T01:07:24.5146937' AS DateTime2), NULL, 1, NULL, N'Beedrill', NULL, NULL, NULL, 64, 64)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (67, N'vi', CAST(N'2016-10-03T01:07:24.5146937' AS DateTime2), NULL, 1, NULL, N'Beedrill', NULL, NULL, NULL, 65, 64)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (68, N'en', CAST(N'2016-10-03T01:07:24.5816994' AS DateTime2), NULL, 1, NULL, N'Pidgey', NULL, NULL, NULL, 66, 68)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (69, N'vi', CAST(N'2016-10-03T01:07:24.5816994' AS DateTime2), NULL, 1, NULL, N'Pidgey', NULL, NULL, NULL, 67, 68)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (70, N'en', CAST(N'2016-10-03T01:07:24.5816994' AS DateTime2), NULL, 1, NULL, N'Pidgey', NULL, NULL, NULL, 68, 68)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (71, N'vi', CAST(N'2016-10-03T01:07:24.5816994' AS DateTime2), NULL, 1, NULL, N'Pidgey', NULL, NULL, NULL, 69, 68)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (72, N'en', CAST(N'2016-10-03T01:07:24.6492080' AS DateTime2), NULL, 1, NULL, N'Pidgeotto', NULL, NULL, NULL, 70, 72)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (73, N'vi', CAST(N'2016-10-03T01:07:24.6492080' AS DateTime2), NULL, 1, NULL, N'Pidgeotto', NULL, NULL, NULL, 71, 72)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (74, N'en', CAST(N'2016-10-03T01:07:24.6492080' AS DateTime2), NULL, 1, NULL, N'Pidgeotto', NULL, NULL, NULL, 72, 72)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (75, N'vi', CAST(N'2016-10-03T01:07:24.6492080' AS DateTime2), NULL, 1, NULL, N'Pidgeotto', NULL, NULL, NULL, 73, 72)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (76, N'en', CAST(N'2016-10-03T01:07:24.7237138' AS DateTime2), NULL, 1, NULL, N'Pidgeot', NULL, NULL, NULL, 74, 76)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (77, N'vi', CAST(N'2016-10-03T01:07:24.7237138' AS DateTime2), NULL, 1, NULL, N'Pidgeot', NULL, NULL, NULL, 75, 76)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (78, N'en', CAST(N'2016-10-03T01:07:24.7237138' AS DateTime2), NULL, 1, NULL, N'Pidgeot', NULL, NULL, NULL, 76, 76)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (79, N'vi', CAST(N'2016-10-03T01:07:24.7237138' AS DateTime2), NULL, 1, NULL, N'Pidgeot', NULL, NULL, NULL, 77, 76)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (80, N'en', CAST(N'2016-10-03T01:07:24.7901926' AS DateTime2), NULL, 1, NULL, N'Rattata', NULL, NULL, NULL, 78, 80)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (81, N'vi', CAST(N'2016-10-03T01:07:24.7906925' AS DateTime2), NULL, 1, NULL, N'Rattata', NULL, NULL, NULL, 79, 80)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (82, N'en', CAST(N'2016-10-03T01:07:24.7906925' AS DateTime2), NULL, 1, NULL, N'Rattata', NULL, NULL, NULL, 80, 80)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (83, N'vi', CAST(N'2016-10-03T01:07:24.7906925' AS DateTime2), NULL, 1, NULL, N'Rattata', NULL, NULL, NULL, 81, 80)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (84, N'en', CAST(N'2016-10-03T01:07:24.8776931' AS DateTime2), NULL, 1, NULL, N'Raticate', NULL, NULL, NULL, 82, 84)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (85, N'vi', CAST(N'2016-10-03T01:07:24.8776931' AS DateTime2), NULL, 1, NULL, N'Raticate', NULL, NULL, NULL, 83, 84)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (86, N'en', CAST(N'2016-10-03T01:07:24.8776931' AS DateTime2), NULL, 1, NULL, N'Raticate', NULL, NULL, NULL, 84, 84)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (87, N'vi', CAST(N'2016-10-03T01:07:24.8776931' AS DateTime2), NULL, 1, NULL, N'Raticate', NULL, NULL, NULL, 85, 84)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (88, N'en', CAST(N'2016-10-03T01:07:24.9701934' AS DateTime2), NULL, 1, NULL, N'Spearow', NULL, NULL, NULL, 86, 88)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (89, N'vi', CAST(N'2016-10-03T01:07:24.9701934' AS DateTime2), NULL, 1, NULL, N'Spearow', NULL, NULL, NULL, 87, 88)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (90, N'en', CAST(N'2016-10-03T01:07:24.9701934' AS DateTime2), NULL, 1, NULL, N'Spearow', NULL, NULL, NULL, 88, 88)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (91, N'vi', CAST(N'2016-10-03T01:07:24.9701934' AS DateTime2), NULL, 1, NULL, N'Spearow', NULL, NULL, NULL, 89, 88)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (92, N'en', CAST(N'2016-10-03T01:07:25.1176099' AS DateTime2), NULL, 1, NULL, N'Fearow', NULL, NULL, NULL, 90, 92)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (93, N'vi', CAST(N'2016-10-03T01:07:25.1176099' AS DateTime2), NULL, 1, NULL, N'Fearow', NULL, NULL, NULL, 91, 92)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (94, N'en', CAST(N'2016-10-03T01:07:25.1176099' AS DateTime2), NULL, 1, NULL, N'Fearow', NULL, NULL, NULL, 92, 92)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (95, N'vi', CAST(N'2016-10-03T01:07:25.1176099' AS DateTime2), NULL, 1, NULL, N'Fearow', NULL, NULL, NULL, 93, 92)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (96, N'en', CAST(N'2016-10-03T01:07:25.3871084' AS DateTime2), NULL, 1, NULL, N'Ekans', NULL, NULL, NULL, 94, 96)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (97, N'vi', CAST(N'2016-10-03T01:07:25.3871084' AS DateTime2), NULL, 1, NULL, N'Ekans', NULL, NULL, NULL, 95, 96)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (98, N'en', CAST(N'2016-10-03T01:07:25.3871084' AS DateTime2), NULL, 1, NULL, N'Ekans', NULL, NULL, NULL, 96, 96)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (99, N'vi', CAST(N'2016-10-03T01:07:25.3871084' AS DateTime2), NULL, 1, NULL, N'Ekans', NULL, NULL, NULL, 97, 96)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (100, N'en', CAST(N'2016-10-03T01:07:25.4575977' AS DateTime2), NULL, 1, NULL, N'Arbok', NULL, NULL, NULL, 98, 100)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (101, N'vi', CAST(N'2016-10-03T01:07:25.4575977' AS DateTime2), NULL, 1, NULL, N'Arbok', NULL, NULL, NULL, 99, 100)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (102, N'en', CAST(N'2016-10-03T01:07:25.4575977' AS DateTime2), NULL, 1, NULL, N'Arbok', NULL, NULL, NULL, 100, 100)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (103, N'vi', CAST(N'2016-10-03T01:07:25.4575977' AS DateTime2), NULL, 1, NULL, N'Arbok', NULL, NULL, NULL, 101, 100)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (104, N'en', CAST(N'2016-10-03T01:07:25.5245969' AS DateTime2), NULL, 1, NULL, N'Pikachu', NULL, NULL, NULL, 102, 104)
GO
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (105, N'vi', CAST(N'2016-10-03T01:07:25.5245969' AS DateTime2), NULL, 1, NULL, N'Pikachu', NULL, NULL, NULL, 103, 104)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (106, N'en', CAST(N'2016-10-03T01:07:25.5245969' AS DateTime2), NULL, 1, NULL, N'Pikachu', NULL, NULL, NULL, 104, 104)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (107, N'vi', CAST(N'2016-10-03T01:07:25.5245969' AS DateTime2), NULL, 1, NULL, N'Pikachu', NULL, NULL, NULL, 105, 104)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (108, N'en', CAST(N'2016-10-03T01:07:25.5911236' AS DateTime2), NULL, 1, NULL, N'Raichu', NULL, NULL, NULL, 106, 108)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (109, N'vi', CAST(N'2016-10-03T01:07:25.5911236' AS DateTime2), NULL, 1, NULL, N'Raichu', NULL, NULL, NULL, 107, 108)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (110, N'en', CAST(N'2016-10-03T01:07:25.5911236' AS DateTime2), NULL, 1, NULL, N'Raichu', NULL, NULL, NULL, 108, 108)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (111, N'vi', CAST(N'2016-10-03T01:07:25.5911236' AS DateTime2), NULL, 1, NULL, N'Raichu', NULL, NULL, NULL, 109, 108)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (112, N'en', CAST(N'2016-10-03T01:07:25.6580843' AS DateTime2), NULL, 1, NULL, N'Sandshrew', NULL, NULL, NULL, 110, 112)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (113, N'vi', CAST(N'2016-10-03T01:07:25.6580843' AS DateTime2), NULL, 1, NULL, N'Sandshrew', NULL, NULL, NULL, 111, 112)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (114, N'en', CAST(N'2016-10-03T01:07:25.6580843' AS DateTime2), NULL, 1, NULL, N'Sandshrew', NULL, NULL, NULL, 112, 112)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (115, N'vi', CAST(N'2016-10-03T01:07:25.6580843' AS DateTime2), NULL, 1, NULL, N'Sandshrew', NULL, NULL, NULL, 113, 112)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (116, N'en', CAST(N'2016-10-03T01:07:25.7251007' AS DateTime2), NULL, 1, NULL, N'Sandslash', NULL, NULL, NULL, 114, 116)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (117, N'vi', CAST(N'2016-10-03T01:07:25.7251007' AS DateTime2), NULL, 1, NULL, N'Sandslash', NULL, NULL, NULL, 115, 116)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (118, N'en', CAST(N'2016-10-03T01:07:25.7251007' AS DateTime2), NULL, 1, NULL, N'Sandslash', NULL, NULL, NULL, 116, 116)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (119, N'vi', CAST(N'2016-10-03T01:07:25.7251007' AS DateTime2), NULL, 1, NULL, N'Sandslash', NULL, NULL, NULL, 117, 116)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (120, N'en', CAST(N'2016-10-03T01:07:25.8042034' AS DateTime2), NULL, 1, NULL, N'NidoranFemale', NULL, NULL, NULL, 118, 120)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (121, N'vi', CAST(N'2016-10-03T01:07:25.8042034' AS DateTime2), NULL, 1, NULL, N'NidoranFemale', NULL, NULL, NULL, 119, 120)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (122, N'en', CAST(N'2016-10-03T01:07:25.8042034' AS DateTime2), NULL, 1, NULL, N'NidoranFemale', NULL, NULL, NULL, 120, 120)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (123, N'vi', CAST(N'2016-10-03T01:07:25.8042034' AS DateTime2), NULL, 1, NULL, N'NidoranFemale', NULL, NULL, NULL, 121, 120)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (124, N'en', CAST(N'2016-10-03T01:07:25.8837325' AS DateTime2), NULL, 1, NULL, N'Nidorina', NULL, NULL, NULL, 122, 124)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (125, N'vi', CAST(N'2016-10-03T01:07:25.8837325' AS DateTime2), NULL, 1, NULL, N'Nidorina', NULL, NULL, NULL, 123, 124)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (126, N'en', CAST(N'2016-10-03T01:07:25.8837325' AS DateTime2), NULL, 1, NULL, N'Nidorina', NULL, NULL, NULL, 124, 124)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (127, N'vi', CAST(N'2016-10-03T01:07:25.8837325' AS DateTime2), NULL, 1, NULL, N'Nidorina', NULL, NULL, NULL, 125, 124)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (128, N'en', CAST(N'2016-10-03T01:07:25.9623310' AS DateTime2), NULL, 1, NULL, N'Nidoqueen', NULL, NULL, NULL, 126, 128)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (129, N'vi', CAST(N'2016-10-03T01:07:25.9623310' AS DateTime2), NULL, 1, NULL, N'Nidoqueen', NULL, NULL, NULL, 127, 128)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (130, N'en', CAST(N'2016-10-03T01:07:25.9623310' AS DateTime2), NULL, 1, NULL, N'Nidoqueen', NULL, NULL, NULL, 128, 128)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (131, N'vi', CAST(N'2016-10-03T01:07:25.9623310' AS DateTime2), NULL, 1, NULL, N'Nidoqueen', NULL, NULL, NULL, 129, 128)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (132, N'en', CAST(N'2016-10-03T01:07:26.1029679' AS DateTime2), NULL, 1, NULL, N'NidoranMale', NULL, NULL, NULL, 130, 132)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (133, N'vi', CAST(N'2016-10-03T01:07:26.1029679' AS DateTime2), NULL, 1, NULL, N'NidoranMale', NULL, NULL, NULL, 131, 132)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (134, N'en', CAST(N'2016-10-03T01:07:26.1029679' AS DateTime2), NULL, 1, NULL, N'NidoranMale', NULL, NULL, NULL, 132, 132)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (135, N'vi', CAST(N'2016-10-03T01:07:26.1029679' AS DateTime2), NULL, 1, NULL, N'NidoranMale', NULL, NULL, NULL, 133, 132)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (136, N'en', CAST(N'2016-10-03T01:07:26.1854700' AS DateTime2), NULL, 1, NULL, N'Nidorino', NULL, NULL, NULL, 134, 136)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (137, N'vi', CAST(N'2016-10-03T01:07:26.1854700' AS DateTime2), NULL, 1, NULL, N'Nidorino', NULL, NULL, NULL, 135, 136)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (138, N'en', CAST(N'2016-10-03T01:07:26.1854700' AS DateTime2), NULL, 1, NULL, N'Nidorino', NULL, NULL, NULL, 136, 136)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (139, N'vi', CAST(N'2016-10-03T01:07:26.1854700' AS DateTime2), NULL, 1, NULL, N'Nidorino', NULL, NULL, NULL, 137, 136)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (140, N'en', CAST(N'2016-10-03T01:07:26.2639586' AS DateTime2), NULL, 1, NULL, N'Nidoking', NULL, NULL, NULL, 138, 140)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (141, N'vi', CAST(N'2016-10-03T01:07:26.2639586' AS DateTime2), NULL, 1, NULL, N'Nidoking', NULL, NULL, NULL, 139, 140)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (142, N'en', CAST(N'2016-10-03T01:07:26.2639586' AS DateTime2), NULL, 1, NULL, N'Nidoking', NULL, NULL, NULL, 140, 140)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (143, N'vi', CAST(N'2016-10-03T01:07:26.2639586' AS DateTime2), NULL, 1, NULL, N'Nidoking', NULL, NULL, NULL, 141, 140)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (144, N'en', CAST(N'2016-10-03T01:07:26.3570700' AS DateTime2), NULL, 1, NULL, N'Clefairy', NULL, NULL, NULL, 142, 144)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (145, N'vi', CAST(N'2016-10-03T01:07:26.3570700' AS DateTime2), NULL, 1, NULL, N'Clefairy', NULL, NULL, NULL, 143, 144)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (146, N'en', CAST(N'2016-10-03T01:07:26.3570700' AS DateTime2), NULL, 1, NULL, N'Clefairy', NULL, NULL, NULL, 144, 144)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (147, N'vi', CAST(N'2016-10-03T01:07:26.3570700' AS DateTime2), NULL, 1, NULL, N'Clefairy', NULL, NULL, NULL, 145, 144)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (148, N'en', CAST(N'2016-10-03T01:07:26.4602158' AS DateTime2), NULL, 1, NULL, N'Clefable', NULL, NULL, NULL, 146, 148)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (149, N'vi', CAST(N'2016-10-03T01:07:26.4602158' AS DateTime2), NULL, 1, NULL, N'Clefable', NULL, NULL, NULL, 147, 148)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (150, N'en', CAST(N'2016-10-03T01:07:26.4602158' AS DateTime2), NULL, 1, NULL, N'Clefable', NULL, NULL, NULL, 148, 148)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (151, N'vi', CAST(N'2016-10-03T01:07:26.4602158' AS DateTime2), NULL, 1, NULL, N'Clefable', NULL, NULL, NULL, 149, 148)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (152, N'en', CAST(N'2016-10-03T01:07:26.5406301' AS DateTime2), NULL, 1, NULL, N'Vulpix', NULL, NULL, NULL, 150, 152)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (153, N'vi', CAST(N'2016-10-03T01:07:26.5406301' AS DateTime2), NULL, 1, NULL, N'Vulpix', NULL, NULL, NULL, 151, 152)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (154, N'en', CAST(N'2016-10-03T01:07:26.5406301' AS DateTime2), NULL, 1, NULL, N'Vulpix', NULL, NULL, NULL, 152, 152)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (155, N'vi', CAST(N'2016-10-03T01:07:26.5406301' AS DateTime2), NULL, 1, NULL, N'Vulpix', NULL, NULL, NULL, 153, 152)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (156, N'en', CAST(N'2016-10-03T01:07:26.6151475' AS DateTime2), NULL, 1, NULL, N'Ninetales', NULL, NULL, NULL, 154, 156)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (157, N'vi', CAST(N'2016-10-03T01:07:26.6151475' AS DateTime2), NULL, 1, NULL, N'Ninetales', NULL, NULL, NULL, 155, 156)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (158, N'en', CAST(N'2016-10-03T01:07:26.6151475' AS DateTime2), NULL, 1, NULL, N'Ninetales', NULL, NULL, NULL, 156, 156)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (159, N'vi', CAST(N'2016-10-03T01:07:26.6151475' AS DateTime2), NULL, 1, NULL, N'Ninetales', NULL, NULL, NULL, 157, 156)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (160, N'en', CAST(N'2016-10-03T01:07:26.6906463' AS DateTime2), NULL, 1, NULL, N'Jigglypuff', NULL, NULL, NULL, 158, 160)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (161, N'vi', CAST(N'2016-10-03T01:07:26.6906463' AS DateTime2), NULL, 1, NULL, N'Jigglypuff', NULL, NULL, NULL, 159, 160)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (162, N'en', CAST(N'2016-10-03T01:07:26.6906463' AS DateTime2), NULL, 1, NULL, N'Jigglypuff', NULL, NULL, NULL, 160, 160)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (163, N'vi', CAST(N'2016-10-03T01:07:26.6906463' AS DateTime2), NULL, 1, NULL, N'Jigglypuff', NULL, NULL, NULL, 161, 160)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (164, N'en', CAST(N'2016-10-03T01:07:26.8154229' AS DateTime2), NULL, 1, NULL, N'Wigglytuff', NULL, NULL, NULL, 162, 164)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (165, N'vi', CAST(N'2016-10-03T01:07:26.8154229' AS DateTime2), NULL, 1, NULL, N'Wigglytuff', NULL, NULL, NULL, 163, 164)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (166, N'en', CAST(N'2016-10-03T01:07:26.8154229' AS DateTime2), NULL, 1, NULL, N'Wigglytuff', NULL, NULL, NULL, 164, 164)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (167, N'vi', CAST(N'2016-10-03T01:07:26.8154229' AS DateTime2), NULL, 1, NULL, N'Wigglytuff', NULL, NULL, NULL, 165, 164)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (168, N'en', CAST(N'2016-10-03T01:07:26.8914131' AS DateTime2), NULL, 1, NULL, N'Zubat', NULL, NULL, NULL, 166, 168)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (169, N'vi', CAST(N'2016-10-03T01:07:26.8914131' AS DateTime2), NULL, 1, NULL, N'Zubat', NULL, NULL, NULL, 167, 168)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (170, N'en', CAST(N'2016-10-03T01:07:26.8914131' AS DateTime2), NULL, 1, NULL, N'Zubat', NULL, NULL, NULL, 168, 168)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (171, N'vi', CAST(N'2016-10-03T01:07:26.8914131' AS DateTime2), NULL, 1, NULL, N'Zubat', NULL, NULL, NULL, 169, 168)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (172, N'en', CAST(N'2016-10-03T01:07:26.9884371' AS DateTime2), NULL, 1, NULL, N'Golbat', NULL, NULL, NULL, 170, 172)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (173, N'vi', CAST(N'2016-10-03T01:07:26.9884371' AS DateTime2), NULL, 1, NULL, N'Golbat', NULL, NULL, NULL, 171, 172)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (174, N'en', CAST(N'2016-10-03T01:07:26.9884371' AS DateTime2), NULL, 1, NULL, N'Golbat', NULL, NULL, NULL, 172, 172)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (175, N'vi', CAST(N'2016-10-03T01:07:26.9884371' AS DateTime2), NULL, 1, NULL, N'Golbat', NULL, NULL, NULL, 173, 172)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (176, N'en', CAST(N'2016-10-03T01:07:27.0714130' AS DateTime2), NULL, 1, NULL, N'Oddish', NULL, NULL, NULL, 174, 176)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (177, N'vi', CAST(N'2016-10-03T01:07:27.0714130' AS DateTime2), NULL, 1, NULL, N'Oddish', NULL, NULL, NULL, 175, 176)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (178, N'en', CAST(N'2016-10-03T01:07:27.0714130' AS DateTime2), NULL, 1, NULL, N'Oddish', NULL, NULL, NULL, 176, 176)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (179, N'vi', CAST(N'2016-10-03T01:07:27.0714130' AS DateTime2), NULL, 1, NULL, N'Oddish', NULL, NULL, NULL, 177, 176)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (180, N'en', CAST(N'2016-10-03T01:07:27.1495112' AS DateTime2), NULL, 1, NULL, N'Gloom', NULL, NULL, NULL, 178, 180)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (181, N'vi', CAST(N'2016-10-03T01:07:27.1495112' AS DateTime2), NULL, 1, NULL, N'Gloom', NULL, NULL, NULL, 179, 180)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (182, N'en', CAST(N'2016-10-03T01:07:27.1495112' AS DateTime2), NULL, 1, NULL, N'Gloom', NULL, NULL, NULL, 180, 180)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (183, N'vi', CAST(N'2016-10-03T01:07:27.1495112' AS DateTime2), NULL, 1, NULL, N'Gloom', NULL, NULL, NULL, 181, 180)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (184, N'en', CAST(N'2016-10-03T01:07:27.2365379' AS DateTime2), NULL, 1, NULL, N'Vileplume', NULL, NULL, NULL, 182, 184)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (185, N'vi', CAST(N'2016-10-03T01:07:27.2365379' AS DateTime2), NULL, 1, NULL, N'Vileplume', NULL, NULL, NULL, 183, 184)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (186, N'en', CAST(N'2016-10-03T01:07:27.2365379' AS DateTime2), NULL, 1, NULL, N'Vileplume', NULL, NULL, NULL, 184, 184)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (187, N'vi', CAST(N'2016-10-03T01:07:27.2365379' AS DateTime2), NULL, 1, NULL, N'Vileplume', NULL, NULL, NULL, 185, 184)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (188, N'en', CAST(N'2016-10-03T01:07:27.3150132' AS DateTime2), NULL, 1, NULL, N'Paras', NULL, NULL, NULL, 186, 188)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (189, N'vi', CAST(N'2016-10-03T01:07:27.3150132' AS DateTime2), NULL, 1, NULL, N'Paras', NULL, NULL, NULL, 187, 188)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (190, N'en', CAST(N'2016-10-03T01:07:27.3150132' AS DateTime2), NULL, 1, NULL, N'Paras', NULL, NULL, NULL, 188, 188)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (191, N'vi', CAST(N'2016-10-03T01:07:27.3150132' AS DateTime2), NULL, 1, NULL, N'Paras', NULL, NULL, NULL, 189, 188)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (192, N'en', CAST(N'2016-10-03T01:07:27.4230805' AS DateTime2), NULL, 1, NULL, N'Parasect', NULL, NULL, NULL, 190, 192)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (193, N'vi', CAST(N'2016-10-03T01:07:27.4230805' AS DateTime2), NULL, 1, NULL, N'Parasect', NULL, NULL, NULL, 191, 192)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (194, N'en', CAST(N'2016-10-03T01:07:27.4230805' AS DateTime2), NULL, 1, NULL, N'Parasect', NULL, NULL, NULL, 192, 192)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (195, N'vi', CAST(N'2016-10-03T01:07:27.4230805' AS DateTime2), NULL, 1, NULL, N'Parasect', NULL, NULL, NULL, 193, 192)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (196, N'en', CAST(N'2016-10-03T01:07:27.5125952' AS DateTime2), NULL, 1, NULL, N'Venonat', NULL, NULL, NULL, 194, 196)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (197, N'vi', CAST(N'2016-10-03T01:07:27.5125952' AS DateTime2), NULL, 1, NULL, N'Venonat', NULL, NULL, NULL, 195, 196)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (198, N'en', CAST(N'2016-10-03T01:07:27.5125952' AS DateTime2), NULL, 1, NULL, N'Venonat', NULL, NULL, NULL, 196, 196)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (199, N'vi', CAST(N'2016-10-03T01:07:27.5125952' AS DateTime2), NULL, 1, NULL, N'Venonat', NULL, NULL, NULL, 197, 196)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (200, N'en', CAST(N'2016-10-03T01:07:27.5964017' AS DateTime2), NULL, 1, NULL, N'Venomoth', NULL, NULL, NULL, 198, 200)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (201, N'vi', CAST(N'2016-10-03T01:07:27.5964017' AS DateTime2), NULL, 1, NULL, N'Venomoth', NULL, NULL, NULL, 199, 200)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (202, N'en', CAST(N'2016-10-03T01:07:27.5964017' AS DateTime2), NULL, 1, NULL, N'Venomoth', NULL, NULL, NULL, 200, 200)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (203, N'vi', CAST(N'2016-10-03T01:07:27.5964017' AS DateTime2), NULL, 1, NULL, N'Venomoth', NULL, NULL, NULL, 201, 200)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (204, N'en', CAST(N'2016-10-03T01:07:27.6813940' AS DateTime2), NULL, 1, NULL, N'Diglett', NULL, NULL, NULL, 202, 204)
GO
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (205, N'vi', CAST(N'2016-10-03T01:07:27.6813940' AS DateTime2), NULL, 1, NULL, N'Diglett', NULL, NULL, NULL, 203, 204)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (206, N'en', CAST(N'2016-10-03T01:07:27.6813940' AS DateTime2), NULL, 1, NULL, N'Diglett', NULL, NULL, NULL, 204, 204)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (207, N'vi', CAST(N'2016-10-03T01:07:27.6813940' AS DateTime2), NULL, 1, NULL, N'Diglett', NULL, NULL, NULL, 205, 204)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (208, N'en', CAST(N'2016-10-03T01:07:27.7735436' AS DateTime2), NULL, 1, NULL, N'Dugtrio', NULL, NULL, NULL, 206, 208)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (209, N'vi', CAST(N'2016-10-03T01:07:27.7735436' AS DateTime2), NULL, 1, NULL, N'Dugtrio', NULL, NULL, NULL, 207, 208)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (210, N'en', CAST(N'2016-10-03T01:07:27.7735436' AS DateTime2), NULL, 1, NULL, N'Dugtrio', NULL, NULL, NULL, 208, 208)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (211, N'vi', CAST(N'2016-10-03T01:07:27.7735436' AS DateTime2), NULL, 1, NULL, N'Dugtrio', NULL, NULL, NULL, 209, 208)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (212, N'en', CAST(N'2016-10-03T01:07:27.8674393' AS DateTime2), NULL, 1, NULL, N'Meowth', NULL, NULL, NULL, 210, 212)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (213, N'vi', CAST(N'2016-10-03T01:07:27.8674393' AS DateTime2), NULL, 1, NULL, N'Meowth', NULL, NULL, NULL, 211, 212)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (214, N'en', CAST(N'2016-10-03T01:07:27.8674393' AS DateTime2), NULL, 1, NULL, N'Meowth', NULL, NULL, NULL, 212, 212)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (215, N'vi', CAST(N'2016-10-03T01:07:27.8674393' AS DateTime2), NULL, 1, NULL, N'Meowth', NULL, NULL, NULL, 213, 212)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (216, N'en', CAST(N'2016-10-03T01:07:27.9604373' AS DateTime2), NULL, 1, NULL, N'Persian', NULL, NULL, NULL, 214, 216)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (217, N'vi', CAST(N'2016-10-03T01:07:27.9604373' AS DateTime2), NULL, 1, NULL, N'Persian', NULL, NULL, NULL, 215, 216)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (218, N'en', CAST(N'2016-10-03T01:07:27.9604373' AS DateTime2), NULL, 1, NULL, N'Persian', NULL, NULL, NULL, 216, 216)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (219, N'vi', CAST(N'2016-10-03T01:07:27.9604373' AS DateTime2), NULL, 1, NULL, N'Persian', NULL, NULL, NULL, 217, 216)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (220, N'en', CAST(N'2016-10-03T01:07:28.6410034' AS DateTime2), NULL, 1, NULL, N'Psyduck', NULL, NULL, NULL, 218, 220)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (221, N'vi', CAST(N'2016-10-03T01:07:28.6410034' AS DateTime2), NULL, 1, NULL, N'Psyduck', NULL, NULL, NULL, 219, 220)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (222, N'en', CAST(N'2016-10-03T01:07:28.6410034' AS DateTime2), NULL, 1, NULL, N'Psyduck', NULL, NULL, NULL, 220, 220)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (223, N'vi', CAST(N'2016-10-03T01:07:28.6410034' AS DateTime2), NULL, 1, NULL, N'Psyduck', NULL, NULL, NULL, 221, 220)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (224, N'en', CAST(N'2016-10-03T01:07:28.7325017' AS DateTime2), NULL, 1, NULL, N'Golduck', NULL, NULL, NULL, 222, 224)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (225, N'vi', CAST(N'2016-10-03T01:07:28.7325017' AS DateTime2), NULL, 1, NULL, N'Golduck', NULL, NULL, NULL, 223, 224)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (226, N'en', CAST(N'2016-10-03T01:07:28.7325017' AS DateTime2), NULL, 1, NULL, N'Golduck', NULL, NULL, NULL, 224, 224)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (227, N'vi', CAST(N'2016-10-03T01:07:28.7325017' AS DateTime2), NULL, 1, NULL, N'Golduck', NULL, NULL, NULL, 225, 224)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (228, N'en', CAST(N'2016-10-03T01:07:28.8255168' AS DateTime2), NULL, 1, NULL, N'Mankey', NULL, NULL, NULL, 226, 228)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (229, N'vi', CAST(N'2016-10-03T01:07:28.8255168' AS DateTime2), NULL, 1, NULL, N'Mankey', NULL, NULL, NULL, 227, 228)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (230, N'en', CAST(N'2016-10-03T01:07:28.8255168' AS DateTime2), NULL, 1, NULL, N'Mankey', NULL, NULL, NULL, 228, 228)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (231, N'vi', CAST(N'2016-10-03T01:07:28.8255168' AS DateTime2), NULL, 1, NULL, N'Mankey', NULL, NULL, NULL, 229, 228)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (232, N'en', CAST(N'2016-10-03T01:07:28.9190083' AS DateTime2), NULL, 1, NULL, N'Primeape', NULL, NULL, NULL, 230, 232)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (233, N'vi', CAST(N'2016-10-03T01:07:28.9190083' AS DateTime2), NULL, 1, NULL, N'Primeape', NULL, NULL, NULL, 231, 232)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (234, N'en', CAST(N'2016-10-03T01:07:28.9190083' AS DateTime2), NULL, 1, NULL, N'Primeape', NULL, NULL, NULL, 232, 232)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (235, N'vi', CAST(N'2016-10-03T01:07:28.9190083' AS DateTime2), NULL, 1, NULL, N'Primeape', NULL, NULL, NULL, 233, 232)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (236, N'en', CAST(N'2016-10-03T01:07:29.0280665' AS DateTime2), NULL, 1, NULL, N'Growlithe', NULL, NULL, NULL, 234, 236)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (237, N'vi', CAST(N'2016-10-03T01:07:29.0280665' AS DateTime2), NULL, 1, NULL, N'Growlithe', NULL, NULL, NULL, 235, 236)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (238, N'en', CAST(N'2016-10-03T01:07:29.0280665' AS DateTime2), NULL, 1, NULL, N'Growlithe', NULL, NULL, NULL, 236, 236)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (239, N'vi', CAST(N'2016-10-03T01:07:29.0280665' AS DateTime2), NULL, 1, NULL, N'Growlithe', NULL, NULL, NULL, 237, 236)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (240, N'en', CAST(N'2016-10-03T01:07:29.1369544' AS DateTime2), NULL, 1, NULL, N'Arcanine', NULL, NULL, NULL, 238, 240)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (241, N'vi', CAST(N'2016-10-03T01:07:29.1369544' AS DateTime2), NULL, 1, NULL, N'Arcanine', NULL, NULL, NULL, 239, 240)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (242, N'en', CAST(N'2016-10-03T01:07:29.1369544' AS DateTime2), NULL, 1, NULL, N'Arcanine', NULL, NULL, NULL, 240, 240)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (243, N'vi', CAST(N'2016-10-03T01:07:29.1369544' AS DateTime2), NULL, 1, NULL, N'Arcanine', NULL, NULL, NULL, 241, 240)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (244, N'en', CAST(N'2016-10-03T01:07:29.2670796' AS DateTime2), NULL, 1, NULL, N'Poliwag', NULL, NULL, NULL, 242, 244)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (245, N'vi', CAST(N'2016-10-03T01:07:29.2670796' AS DateTime2), NULL, 1, NULL, N'Poliwag', NULL, NULL, NULL, 243, 244)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (246, N'en', CAST(N'2016-10-03T01:07:29.2670796' AS DateTime2), NULL, 1, NULL, N'Poliwag', NULL, NULL, NULL, 244, 244)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (247, N'vi', CAST(N'2016-10-03T01:07:29.2670796' AS DateTime2), NULL, 1, NULL, N'Poliwag', NULL, NULL, NULL, 245, 244)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (248, N'en', CAST(N'2016-10-03T01:07:29.3680863' AS DateTime2), NULL, 1, NULL, N'Poliwhirl', NULL, NULL, NULL, 246, 248)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (249, N'vi', CAST(N'2016-10-03T01:07:29.3680863' AS DateTime2), NULL, 1, NULL, N'Poliwhirl', NULL, NULL, NULL, 247, 248)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (250, N'en', CAST(N'2016-10-03T01:07:29.3680863' AS DateTime2), NULL, 1, NULL, N'Poliwhirl', NULL, NULL, NULL, 248, 248)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (251, N'vi', CAST(N'2016-10-03T01:07:29.3680863' AS DateTime2), NULL, 1, NULL, N'Poliwhirl', NULL, NULL, NULL, 249, 248)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (252, N'en', CAST(N'2016-10-03T01:07:29.4716132' AS DateTime2), NULL, 1, NULL, N'Poliwrath', NULL, NULL, NULL, 250, 252)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (253, N'vi', CAST(N'2016-10-03T01:07:29.4716132' AS DateTime2), NULL, 1, NULL, N'Poliwrath', NULL, NULL, NULL, 251, 252)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (254, N'en', CAST(N'2016-10-03T01:07:29.4716132' AS DateTime2), NULL, 1, NULL, N'Poliwrath', NULL, NULL, NULL, 252, 252)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (255, N'vi', CAST(N'2016-10-03T01:07:29.4716132' AS DateTime2), NULL, 1, NULL, N'Poliwrath', NULL, NULL, NULL, 253, 252)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (256, N'en', CAST(N'2016-10-03T01:07:29.5735988' AS DateTime2), NULL, 1, NULL, N'Abra', NULL, NULL, NULL, 254, 256)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (257, N'vi', CAST(N'2016-10-03T01:07:29.5735988' AS DateTime2), NULL, 1, NULL, N'Abra', NULL, NULL, NULL, 255, 256)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (258, N'en', CAST(N'2016-10-03T01:07:29.5735988' AS DateTime2), NULL, 1, NULL, N'Abra', NULL, NULL, NULL, 256, 256)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (259, N'vi', CAST(N'2016-10-03T01:07:29.5735988' AS DateTime2), NULL, 1, NULL, N'Abra', NULL, NULL, NULL, 257, 256)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (260, N'en', CAST(N'2016-10-03T01:07:29.6745383' AS DateTime2), NULL, 1, NULL, N'Kadabra', NULL, NULL, NULL, 258, 260)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (261, N'vi', CAST(N'2016-10-03T01:07:29.6745383' AS DateTime2), NULL, 1, NULL, N'Kadabra', NULL, NULL, NULL, 259, 260)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (262, N'en', CAST(N'2016-10-03T01:07:29.6745383' AS DateTime2), NULL, 1, NULL, N'Kadabra', NULL, NULL, NULL, 260, 260)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (263, N'vi', CAST(N'2016-10-03T01:07:29.6745383' AS DateTime2), NULL, 1, NULL, N'Kadabra', NULL, NULL, NULL, 261, 260)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (264, N'en', CAST(N'2016-10-03T01:07:29.7835387' AS DateTime2), NULL, 1, NULL, N'Alakazam', NULL, NULL, NULL, 262, 264)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (265, N'vi', CAST(N'2016-10-03T01:07:29.7835387' AS DateTime2), NULL, 1, NULL, N'Alakazam', NULL, NULL, NULL, 263, 264)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (266, N'en', CAST(N'2016-10-03T01:07:29.7835387' AS DateTime2), NULL, 1, NULL, N'Alakazam', NULL, NULL, NULL, 264, 264)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (267, N'vi', CAST(N'2016-10-03T01:07:29.7835387' AS DateTime2), NULL, 1, NULL, N'Alakazam', NULL, NULL, NULL, 265, 264)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (268, N'en', CAST(N'2016-10-03T01:07:29.8906369' AS DateTime2), NULL, 1, NULL, N'Machop', NULL, NULL, NULL, 266, 268)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (269, N'vi', CAST(N'2016-10-03T01:07:29.8906369' AS DateTime2), NULL, 1, NULL, N'Machop', NULL, NULL, NULL, 267, 268)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (270, N'en', CAST(N'2016-10-03T01:07:29.8906369' AS DateTime2), NULL, 1, NULL, N'Machop', NULL, NULL, NULL, 268, 268)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (271, N'vi', CAST(N'2016-10-03T01:07:29.8906369' AS DateTime2), NULL, 1, NULL, N'Machop', NULL, NULL, NULL, 269, 268)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (272, N'en', CAST(N'2016-10-03T01:07:30.0007723' AS DateTime2), NULL, 1, NULL, N'Machoke', NULL, NULL, NULL, 270, 272)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (273, N'vi', CAST(N'2016-10-03T01:07:30.0007723' AS DateTime2), NULL, 1, NULL, N'Machoke', NULL, NULL, NULL, 271, 272)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (274, N'en', CAST(N'2016-10-03T01:07:30.0007723' AS DateTime2), NULL, 1, NULL, N'Machoke', NULL, NULL, NULL, 272, 272)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (275, N'vi', CAST(N'2016-10-03T01:07:30.0007723' AS DateTime2), NULL, 1, NULL, N'Machoke', NULL, NULL, NULL, 273, 272)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (276, N'en', CAST(N'2016-10-03T01:07:30.1038741' AS DateTime2), NULL, 1, NULL, N'Machamp', NULL, NULL, NULL, 274, 276)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (277, N'vi', CAST(N'2016-10-03T01:07:30.1038741' AS DateTime2), NULL, 1, NULL, N'Machamp', NULL, NULL, NULL, 275, 276)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (278, N'en', CAST(N'2016-10-03T01:07:30.1038741' AS DateTime2), NULL, 1, NULL, N'Machamp', NULL, NULL, NULL, 276, 276)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (279, N'vi', CAST(N'2016-10-03T01:07:30.1038741' AS DateTime2), NULL, 1, NULL, N'Machamp', NULL, NULL, NULL, 277, 276)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (280, N'en', CAST(N'2016-10-03T01:07:30.2292759' AS DateTime2), NULL, 1, NULL, N'Bellsprout', NULL, NULL, NULL, 278, 280)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (281, N'vi', CAST(N'2016-10-03T01:07:30.2292759' AS DateTime2), NULL, 1, NULL, N'Bellsprout', NULL, NULL, NULL, 279, 280)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (282, N'en', CAST(N'2016-10-03T01:07:30.2292759' AS DateTime2), NULL, 1, NULL, N'Bellsprout', NULL, NULL, NULL, 280, 280)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (283, N'vi', CAST(N'2016-10-03T01:07:30.2292759' AS DateTime2), NULL, 1, NULL, N'Bellsprout', NULL, NULL, NULL, 281, 280)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (284, N'en', CAST(N'2016-10-03T01:07:30.3388519' AS DateTime2), NULL, 1, NULL, N'Weepinbell', NULL, NULL, NULL, 282, 284)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (285, N'vi', CAST(N'2016-10-03T01:07:30.3388519' AS DateTime2), NULL, 1, NULL, N'Weepinbell', NULL, NULL, NULL, 283, 284)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (286, N'en', CAST(N'2016-10-03T01:07:30.3388519' AS DateTime2), NULL, 1, NULL, N'Weepinbell', NULL, NULL, NULL, 284, 284)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (287, N'vi', CAST(N'2016-10-03T01:07:30.3388519' AS DateTime2), NULL, 1, NULL, N'Weepinbell', NULL, NULL, NULL, 285, 284)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (288, N'en', CAST(N'2016-10-03T01:07:30.4578000' AS DateTime2), NULL, 1, NULL, N'Victreebel', NULL, NULL, NULL, 286, 288)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (289, N'vi', CAST(N'2016-10-03T01:07:30.4578000' AS DateTime2), NULL, 1, NULL, N'Victreebel', NULL, NULL, NULL, 287, 288)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (290, N'en', CAST(N'2016-10-03T01:07:30.4578000' AS DateTime2), NULL, 1, NULL, N'Victreebel', NULL, NULL, NULL, 288, 288)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (291, N'vi', CAST(N'2016-10-03T01:07:30.4578000' AS DateTime2), NULL, 1, NULL, N'Victreebel', NULL, NULL, NULL, 289, 288)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (292, N'en', CAST(N'2016-10-03T01:07:30.5652702' AS DateTime2), NULL, 1, NULL, N'Tentacool', NULL, NULL, NULL, 290, 292)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (293, N'vi', CAST(N'2016-10-03T01:07:30.5652702' AS DateTime2), NULL, 1, NULL, N'Tentacool', NULL, NULL, NULL, 291, 292)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (294, N'en', CAST(N'2016-10-03T01:07:30.5652702' AS DateTime2), NULL, 1, NULL, N'Tentacool', NULL, NULL, NULL, 292, 292)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (295, N'vi', CAST(N'2016-10-03T01:07:30.5652702' AS DateTime2), NULL, 1, NULL, N'Tentacool', NULL, NULL, NULL, 293, 292)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (296, N'en', CAST(N'2016-10-03T01:07:30.6712706' AS DateTime2), NULL, 1, NULL, N'Tentacruel', NULL, NULL, NULL, 294, 296)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (297, N'vi', CAST(N'2016-10-03T01:07:30.6712706' AS DateTime2), NULL, 1, NULL, N'Tentacruel', NULL, NULL, NULL, 295, 296)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (298, N'en', CAST(N'2016-10-03T01:07:30.6712706' AS DateTime2), NULL, 1, NULL, N'Tentacruel', NULL, NULL, NULL, 296, 296)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (299, N'vi', CAST(N'2016-10-03T01:07:30.6712706' AS DateTime2), NULL, 1, NULL, N'Tentacruel', NULL, NULL, NULL, 297, 296)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (300, N'en', CAST(N'2016-10-03T01:07:30.7850060' AS DateTime2), NULL, 1, NULL, N'Geodude', NULL, NULL, NULL, 298, 300)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (301, N'vi', CAST(N'2016-10-03T01:07:30.7850060' AS DateTime2), NULL, 1, NULL, N'Geodude', NULL, NULL, NULL, 299, 300)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (302, N'en', CAST(N'2016-10-03T01:07:30.7850060' AS DateTime2), NULL, 1, NULL, N'Geodude', NULL, NULL, NULL, 300, 300)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (303, N'vi', CAST(N'2016-10-03T01:07:30.7850060' AS DateTime2), NULL, 1, NULL, N'Geodude', NULL, NULL, NULL, 301, 300)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (304, N'en', CAST(N'2016-10-03T01:07:30.8934941' AS DateTime2), NULL, 1, NULL, N'Graveler', NULL, NULL, NULL, 302, 304)
GO
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (305, N'vi', CAST(N'2016-10-03T01:07:30.8934941' AS DateTime2), NULL, 1, NULL, N'Graveler', NULL, NULL, NULL, 303, 304)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (306, N'en', CAST(N'2016-10-03T01:07:30.8934941' AS DateTime2), NULL, 1, NULL, N'Graveler', NULL, NULL, NULL, 304, 304)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (307, N'vi', CAST(N'2016-10-03T01:07:30.8934941' AS DateTime2), NULL, 1, NULL, N'Graveler', NULL, NULL, NULL, 305, 304)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (308, N'en', CAST(N'2016-10-03T01:07:31.0074865' AS DateTime2), NULL, 1, NULL, N'Golem', NULL, NULL, NULL, 306, 308)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (309, N'vi', CAST(N'2016-10-03T01:07:31.0074865' AS DateTime2), NULL, 1, NULL, N'Golem', NULL, NULL, NULL, 307, 308)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (310, N'en', CAST(N'2016-10-03T01:07:31.0074865' AS DateTime2), NULL, 1, NULL, N'Golem', NULL, NULL, NULL, 308, 308)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (311, N'vi', CAST(N'2016-10-03T01:07:31.0074865' AS DateTime2), NULL, 1, NULL, N'Golem', NULL, NULL, NULL, 309, 308)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (312, N'en', CAST(N'2016-10-03T01:07:31.1449875' AS DateTime2), NULL, 1, NULL, N'Ponyta', NULL, NULL, NULL, 310, 312)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (313, N'vi', CAST(N'2016-10-03T01:07:31.1449875' AS DateTime2), NULL, 1, NULL, N'Ponyta', NULL, NULL, NULL, 311, 312)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (314, N'en', CAST(N'2016-10-03T01:07:31.1449875' AS DateTime2), NULL, 1, NULL, N'Ponyta', NULL, NULL, NULL, 312, 312)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (315, N'vi', CAST(N'2016-10-03T01:07:31.1449875' AS DateTime2), NULL, 1, NULL, N'Ponyta', NULL, NULL, NULL, 313, 312)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (316, N'en', CAST(N'2016-10-03T01:07:31.2602179' AS DateTime2), NULL, 1, NULL, N'Rapidash', NULL, NULL, NULL, 314, 316)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (317, N'vi', CAST(N'2016-10-03T01:07:31.2602179' AS DateTime2), NULL, 1, NULL, N'Rapidash', NULL, NULL, NULL, 315, 316)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (318, N'en', CAST(N'2016-10-03T01:07:31.2602179' AS DateTime2), NULL, 1, NULL, N'Rapidash', NULL, NULL, NULL, 316, 316)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (319, N'vi', CAST(N'2016-10-03T01:07:31.2602179' AS DateTime2), NULL, 1, NULL, N'Rapidash', NULL, NULL, NULL, 317, 316)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (320, N'en', CAST(N'2016-10-03T01:07:31.3772411' AS DateTime2), NULL, 1, NULL, N'Slowpoke', NULL, NULL, NULL, 318, 320)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (321, N'vi', CAST(N'2016-10-03T01:07:31.3772411' AS DateTime2), NULL, 1, NULL, N'Slowpoke', NULL, NULL, NULL, 319, 320)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (322, N'en', CAST(N'2016-10-03T01:07:31.3772411' AS DateTime2), NULL, 1, NULL, N'Slowpoke', NULL, NULL, NULL, 320, 320)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (323, N'vi', CAST(N'2016-10-03T01:07:31.3772411' AS DateTime2), NULL, 1, NULL, N'Slowpoke', NULL, NULL, NULL, 321, 320)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (324, N'en', CAST(N'2016-10-03T01:07:31.6176963' AS DateTime2), NULL, 1, NULL, N'Slowbro', NULL, NULL, NULL, 322, 324)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (325, N'vi', CAST(N'2016-10-03T01:07:31.6176963' AS DateTime2), NULL, 1, NULL, N'Slowbro', NULL, NULL, NULL, 323, 324)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (326, N'en', CAST(N'2016-10-03T01:07:31.6176963' AS DateTime2), NULL, 1, NULL, N'Slowbro', NULL, NULL, NULL, 324, 324)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (327, N'vi', CAST(N'2016-10-03T01:07:31.6176963' AS DateTime2), NULL, 1, NULL, N'Slowbro', NULL, NULL, NULL, 325, 324)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (328, N'en', CAST(N'2016-10-03T01:07:31.7722033' AS DateTime2), NULL, 1, NULL, N'Magnemite', NULL, NULL, NULL, 326, 328)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (329, N'vi', CAST(N'2016-10-03T01:07:31.7722033' AS DateTime2), NULL, 1, NULL, N'Magnemite', NULL, NULL, NULL, 327, 328)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (330, N'en', CAST(N'2016-10-03T01:07:31.7722033' AS DateTime2), NULL, 1, NULL, N'Magnemite', NULL, NULL, NULL, 328, 328)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (331, N'vi', CAST(N'2016-10-03T01:07:31.7722033' AS DateTime2), NULL, 1, NULL, N'Magnemite', NULL, NULL, NULL, 329, 328)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (332, N'en', CAST(N'2016-10-03T01:07:31.9129930' AS DateTime2), NULL, 1, NULL, N'Magneton', NULL, NULL, NULL, 330, 332)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (333, N'vi', CAST(N'2016-10-03T01:07:31.9129930' AS DateTime2), NULL, 1, NULL, N'Magneton', NULL, NULL, NULL, 331, 332)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (334, N'en', CAST(N'2016-10-03T01:07:31.9129930' AS DateTime2), NULL, 1, NULL, N'Magneton', NULL, NULL, NULL, 332, 332)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (335, N'vi', CAST(N'2016-10-03T01:07:31.9129930' AS DateTime2), NULL, 1, NULL, N'Magneton', NULL, NULL, NULL, 333, 332)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (336, N'en', CAST(N'2016-10-03T01:07:32.0285352' AS DateTime2), NULL, 1, NULL, N'Farfetchd', NULL, NULL, NULL, 334, 336)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (337, N'vi', CAST(N'2016-10-03T01:07:32.0285352' AS DateTime2), NULL, 1, NULL, N'Farfetchd', NULL, NULL, NULL, 335, 336)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (338, N'en', CAST(N'2016-10-03T01:07:32.0285352' AS DateTime2), NULL, 1, NULL, N'Farfetchd', NULL, NULL, NULL, 336, 336)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (339, N'vi', CAST(N'2016-10-03T01:07:32.0285352' AS DateTime2), NULL, 1, NULL, N'Farfetchd', NULL, NULL, NULL, 337, 336)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (340, N'en', CAST(N'2016-10-03T01:07:32.1458415' AS DateTime2), NULL, 1, NULL, N'Doduo', NULL, NULL, NULL, 338, 340)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (341, N'vi', CAST(N'2016-10-03T01:07:32.1458415' AS DateTime2), NULL, 1, NULL, N'Doduo', NULL, NULL, NULL, 339, 340)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (342, N'en', CAST(N'2016-10-03T01:07:32.1458415' AS DateTime2), NULL, 1, NULL, N'Doduo', NULL, NULL, NULL, 340, 340)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (343, N'vi', CAST(N'2016-10-03T01:07:32.1458415' AS DateTime2), NULL, 1, NULL, N'Doduo', NULL, NULL, NULL, 341, 340)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (344, N'en', CAST(N'2016-10-03T01:07:32.2648528' AS DateTime2), NULL, 1, NULL, N'Dodrio', NULL, NULL, NULL, 342, 344)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (345, N'vi', CAST(N'2016-10-03T01:07:32.2648528' AS DateTime2), NULL, 1, NULL, N'Dodrio', NULL, NULL, NULL, 343, 344)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (346, N'en', CAST(N'2016-10-03T01:07:32.2648528' AS DateTime2), NULL, 1, NULL, N'Dodrio', NULL, NULL, NULL, 344, 344)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (347, N'vi', CAST(N'2016-10-03T01:07:32.2648528' AS DateTime2), NULL, 1, NULL, N'Dodrio', NULL, NULL, NULL, 345, 344)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (348, N'en', CAST(N'2016-10-03T01:07:32.3903457' AS DateTime2), NULL, 1, NULL, N'Seel', NULL, NULL, NULL, 346, 348)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (349, N'vi', CAST(N'2016-10-03T01:07:32.3903457' AS DateTime2), NULL, 1, NULL, N'Seel', NULL, NULL, NULL, 347, 348)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (350, N'en', CAST(N'2016-10-03T01:07:32.3903457' AS DateTime2), NULL, 1, NULL, N'Seel', NULL, NULL, NULL, 348, 348)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (351, N'vi', CAST(N'2016-10-03T01:07:32.3903457' AS DateTime2), NULL, 1, NULL, N'Seel', NULL, NULL, NULL, 349, 348)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (352, N'en', CAST(N'2016-10-03T01:07:32.5163795' AS DateTime2), NULL, 1, NULL, N'Dewgong', NULL, NULL, NULL, 350, 352)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (353, N'vi', CAST(N'2016-10-03T01:07:32.5163795' AS DateTime2), NULL, 1, NULL, N'Dewgong', NULL, NULL, NULL, 351, 352)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (354, N'en', CAST(N'2016-10-03T01:07:32.5163795' AS DateTime2), NULL, 1, NULL, N'Dewgong', NULL, NULL, NULL, 352, 352)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (355, N'vi', CAST(N'2016-10-03T01:07:32.5163795' AS DateTime2), NULL, 1, NULL, N'Dewgong', NULL, NULL, NULL, 353, 352)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (356, N'en', CAST(N'2016-10-03T01:07:32.6422830' AS DateTime2), NULL, 1, NULL, N'Grimer', NULL, NULL, NULL, 354, 356)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (357, N'vi', CAST(N'2016-10-03T01:07:32.6422830' AS DateTime2), NULL, 1, NULL, N'Grimer', NULL, NULL, NULL, 355, 356)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (358, N'en', CAST(N'2016-10-03T01:07:32.6422830' AS DateTime2), NULL, 1, NULL, N'Grimer', NULL, NULL, NULL, 356, 356)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (359, N'vi', CAST(N'2016-10-03T01:07:32.6422830' AS DateTime2), NULL, 1, NULL, N'Grimer', NULL, NULL, NULL, 357, 356)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (360, N'en', CAST(N'2016-10-03T01:07:32.7672819' AS DateTime2), NULL, 1, NULL, N'Muk', NULL, NULL, NULL, 358, 360)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (361, N'vi', CAST(N'2016-10-03T01:07:32.7672819' AS DateTime2), NULL, 1, NULL, N'Muk', NULL, NULL, NULL, 359, 360)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (362, N'en', CAST(N'2016-10-03T01:07:32.7672819' AS DateTime2), NULL, 1, NULL, N'Muk', NULL, NULL, NULL, 360, 360)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (363, N'vi', CAST(N'2016-10-03T01:07:32.7672819' AS DateTime2), NULL, 1, NULL, N'Muk', NULL, NULL, NULL, 361, 360)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (364, N'en', CAST(N'2016-10-03T01:07:32.9152818' AS DateTime2), NULL, 1, NULL, N'Shellder', NULL, NULL, NULL, 362, 364)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (365, N'vi', CAST(N'2016-10-03T01:07:32.9152818' AS DateTime2), NULL, 1, NULL, N'Shellder', NULL, NULL, NULL, 363, 364)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (366, N'en', CAST(N'2016-10-03T01:07:32.9152818' AS DateTime2), NULL, 1, NULL, N'Shellder', NULL, NULL, NULL, 364, 364)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (367, N'vi', CAST(N'2016-10-03T01:07:32.9152818' AS DateTime2), NULL, 1, NULL, N'Shellder', NULL, NULL, NULL, 365, 364)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (368, N'en', CAST(N'2016-10-03T01:07:33.0407917' AS DateTime2), NULL, 1, NULL, N'Cloyster', NULL, NULL, NULL, 366, 368)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (369, N'vi', CAST(N'2016-10-03T01:07:33.0407917' AS DateTime2), NULL, 1, NULL, N'Cloyster', NULL, NULL, NULL, 367, 368)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (370, N'en', CAST(N'2016-10-03T01:07:33.0407917' AS DateTime2), NULL, 1, NULL, N'Cloyster', NULL, NULL, NULL, 368, 368)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (371, N'vi', CAST(N'2016-10-03T01:07:33.0407917' AS DateTime2), NULL, 1, NULL, N'Cloyster', NULL, NULL, NULL, 369, 368)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (372, N'en', CAST(N'2016-10-03T01:07:33.1715554' AS DateTime2), NULL, 1, NULL, N'Gastly', NULL, NULL, NULL, 370, 372)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (373, N'vi', CAST(N'2016-10-03T01:07:33.1715554' AS DateTime2), NULL, 1, NULL, N'Gastly', NULL, NULL, NULL, 371, 372)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (374, N'en', CAST(N'2016-10-03T01:07:33.1715554' AS DateTime2), NULL, 1, NULL, N'Gastly', NULL, NULL, NULL, 372, 372)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (375, N'vi', CAST(N'2016-10-03T01:07:33.1715554' AS DateTime2), NULL, 1, NULL, N'Gastly', NULL, NULL, NULL, 373, 372)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (376, N'en', CAST(N'2016-10-03T01:07:33.3025698' AS DateTime2), NULL, 1, NULL, N'Haunter', NULL, NULL, NULL, 374, 376)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (377, N'vi', CAST(N'2016-10-03T01:07:33.3025698' AS DateTime2), NULL, 1, NULL, N'Haunter', NULL, NULL, NULL, 375, 376)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (378, N'en', CAST(N'2016-10-03T01:07:33.3025698' AS DateTime2), NULL, 1, NULL, N'Haunter', NULL, NULL, NULL, 376, 376)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (379, N'vi', CAST(N'2016-10-03T01:07:33.3025698' AS DateTime2), NULL, 1, NULL, N'Haunter', NULL, NULL, NULL, 377, 376)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (380, N'en', CAST(N'2016-10-03T01:07:33.4375681' AS DateTime2), NULL, 1, NULL, N'Gengar', NULL, NULL, NULL, 378, 380)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (381, N'vi', CAST(N'2016-10-03T01:07:33.4375681' AS DateTime2), NULL, 1, NULL, N'Gengar', NULL, NULL, NULL, 379, 380)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (382, N'en', CAST(N'2016-10-03T01:07:33.4375681' AS DateTime2), NULL, 1, NULL, N'Gengar', NULL, NULL, NULL, 380, 380)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (383, N'vi', CAST(N'2016-10-03T01:07:33.4375681' AS DateTime2), NULL, 1, NULL, N'Gengar', NULL, NULL, NULL, 381, 380)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (384, N'en', CAST(N'2016-10-03T01:07:33.5725557' AS DateTime2), NULL, 1, NULL, N'Onix', NULL, NULL, NULL, 382, 384)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (385, N'vi', CAST(N'2016-10-03T01:07:33.5725557' AS DateTime2), NULL, 1, NULL, N'Onix', NULL, NULL, NULL, 383, 384)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (386, N'en', CAST(N'2016-10-03T01:07:33.5725557' AS DateTime2), NULL, 1, NULL, N'Onix', NULL, NULL, NULL, 384, 384)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (387, N'vi', CAST(N'2016-10-03T01:07:33.5725557' AS DateTime2), NULL, 1, NULL, N'Onix', NULL, NULL, NULL, 385, 384)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (388, N'en', CAST(N'2016-10-03T01:07:33.7036744' AS DateTime2), NULL, 1, NULL, N'Drowzee', NULL, NULL, NULL, 386, 388)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (389, N'vi', CAST(N'2016-10-03T01:07:33.7036744' AS DateTime2), NULL, 1, NULL, N'Drowzee', NULL, NULL, NULL, 387, 388)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (390, N'en', CAST(N'2016-10-03T01:07:33.7036744' AS DateTime2), NULL, 1, NULL, N'Drowzee', NULL, NULL, NULL, 388, 388)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (391, N'vi', CAST(N'2016-10-03T01:07:33.7036744' AS DateTime2), NULL, 1, NULL, N'Drowzee', NULL, NULL, NULL, 389, 388)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (392, N'en', CAST(N'2016-10-03T01:07:33.8401746' AS DateTime2), NULL, 1, NULL, N'Hypno', NULL, NULL, NULL, 390, 392)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (393, N'vi', CAST(N'2016-10-03T01:07:33.8401746' AS DateTime2), NULL, 1, NULL, N'Hypno', NULL, NULL, NULL, 391, 392)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (394, N'en', CAST(N'2016-10-03T01:07:33.8401746' AS DateTime2), NULL, 1, NULL, N'Hypno', NULL, NULL, NULL, 392, 392)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (395, N'vi', CAST(N'2016-10-03T01:07:33.8401746' AS DateTime2), NULL, 1, NULL, N'Hypno', NULL, NULL, NULL, 393, 392)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (396, N'en', CAST(N'2016-10-03T01:07:33.9766625' AS DateTime2), NULL, 1, NULL, N'Krabby', NULL, NULL, NULL, 394, 396)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (397, N'vi', CAST(N'2016-10-03T01:07:33.9766625' AS DateTime2), NULL, 1, NULL, N'Krabby', NULL, NULL, NULL, 395, 396)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (398, N'en', CAST(N'2016-10-03T01:07:33.9766625' AS DateTime2), NULL, 1, NULL, N'Krabby', NULL, NULL, NULL, 396, 396)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (399, N'vi', CAST(N'2016-10-03T01:07:33.9766625' AS DateTime2), NULL, 1, NULL, N'Krabby', NULL, NULL, NULL, 397, 396)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (400, N'en', CAST(N'2016-10-03T01:07:34.1201758' AS DateTime2), NULL, 1, NULL, N'Kingler', NULL, NULL, NULL, 398, 400)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (401, N'vi', CAST(N'2016-10-03T01:07:34.1201758' AS DateTime2), NULL, 1, NULL, N'Kingler', NULL, NULL, NULL, 399, 400)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (402, N'en', CAST(N'2016-10-03T01:07:34.1201758' AS DateTime2), NULL, 1, NULL, N'Kingler', NULL, NULL, NULL, 400, 400)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (403, N'vi', CAST(N'2016-10-03T01:07:34.1201758' AS DateTime2), NULL, 1, NULL, N'Kingler', NULL, NULL, NULL, 401, 400)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (404, N'en', CAST(N'2016-10-03T01:07:34.2610074' AS DateTime2), NULL, 1, NULL, N'Voltorb', NULL, NULL, NULL, 402, 404)
GO
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (405, N'vi', CAST(N'2016-10-03T01:07:34.2610074' AS DateTime2), NULL, 1, NULL, N'Voltorb', NULL, NULL, NULL, 403, 404)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (406, N'en', CAST(N'2016-10-03T01:07:34.2610074' AS DateTime2), NULL, 1, NULL, N'Voltorb', NULL, NULL, NULL, 404, 404)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (407, N'vi', CAST(N'2016-10-03T01:07:34.2610074' AS DateTime2), NULL, 1, NULL, N'Voltorb', NULL, NULL, NULL, 405, 404)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (408, N'en', CAST(N'2016-10-03T01:07:34.4030333' AS DateTime2), NULL, 1, NULL, N'Electrode', NULL, NULL, NULL, 406, 408)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (409, N'vi', CAST(N'2016-10-03T01:07:34.4030333' AS DateTime2), NULL, 1, NULL, N'Electrode', NULL, NULL, NULL, 407, 408)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (410, N'en', CAST(N'2016-10-03T01:07:34.4030333' AS DateTime2), NULL, 1, NULL, N'Electrode', NULL, NULL, NULL, 408, 408)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (411, N'vi', CAST(N'2016-10-03T01:07:34.4030333' AS DateTime2), NULL, 1, NULL, N'Electrode', NULL, NULL, NULL, 409, 408)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (412, N'en', CAST(N'2016-10-03T01:07:34.5405082' AS DateTime2), NULL, 1, NULL, N'Exeggcute', NULL, NULL, NULL, 410, 412)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (413, N'vi', CAST(N'2016-10-03T01:07:34.5405082' AS DateTime2), NULL, 1, NULL, N'Exeggcute', NULL, NULL, NULL, 411, 412)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (414, N'en', CAST(N'2016-10-03T01:07:34.5405082' AS DateTime2), NULL, 1, NULL, N'Exeggcute', NULL, NULL, NULL, 412, 412)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (415, N'vi', CAST(N'2016-10-03T01:07:34.5405082' AS DateTime2), NULL, 1, NULL, N'Exeggcute', NULL, NULL, NULL, 413, 412)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (416, N'en', CAST(N'2016-10-03T01:07:34.6760133' AS DateTime2), NULL, 1, NULL, N'Exeggutor', NULL, NULL, NULL, 414, 416)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (417, N'vi', CAST(N'2016-10-03T01:07:34.6760133' AS DateTime2), NULL, 1, NULL, N'Exeggutor', NULL, NULL, NULL, 415, 416)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (418, N'en', CAST(N'2016-10-03T01:07:34.6760133' AS DateTime2), NULL, 1, NULL, N'Exeggutor', NULL, NULL, NULL, 416, 416)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (419, N'vi', CAST(N'2016-10-03T01:07:34.6760133' AS DateTime2), NULL, 1, NULL, N'Exeggutor', NULL, NULL, NULL, 417, 416)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (420, N'en', CAST(N'2016-10-03T01:07:34.8234405' AS DateTime2), NULL, 1, NULL, N'Cubone', NULL, NULL, NULL, 418, 420)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (421, N'vi', CAST(N'2016-10-03T01:07:34.8234405' AS DateTime2), NULL, 1, NULL, N'Cubone', NULL, NULL, NULL, 419, 420)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (422, N'en', CAST(N'2016-10-03T01:07:34.8234405' AS DateTime2), NULL, 1, NULL, N'Cubone', NULL, NULL, NULL, 420, 420)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (423, N'vi', CAST(N'2016-10-03T01:07:34.8234405' AS DateTime2), NULL, 1, NULL, N'Cubone', NULL, NULL, NULL, 421, 420)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (424, N'en', CAST(N'2016-10-03T01:07:34.9739208' AS DateTime2), NULL, 1, NULL, N'Marowak', NULL, NULL, NULL, 422, 424)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (425, N'vi', CAST(N'2016-10-03T01:07:34.9739208' AS DateTime2), NULL, 1, NULL, N'Marowak', NULL, NULL, NULL, 423, 424)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (426, N'en', CAST(N'2016-10-03T01:07:34.9739208' AS DateTime2), NULL, 1, NULL, N'Marowak', NULL, NULL, NULL, 424, 424)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (427, N'vi', CAST(N'2016-10-03T01:07:34.9739208' AS DateTime2), NULL, 1, NULL, N'Marowak', NULL, NULL, NULL, 425, 424)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (428, N'en', CAST(N'2016-10-03T01:07:35.1440466' AS DateTime2), NULL, 1, NULL, N'Hitmonlee', NULL, NULL, NULL, 426, 428)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (429, N'vi', CAST(N'2016-10-03T01:07:35.1440466' AS DateTime2), NULL, 1, NULL, N'Hitmonlee', NULL, NULL, NULL, 427, 428)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (430, N'en', CAST(N'2016-10-03T01:07:35.1440466' AS DateTime2), NULL, 1, NULL, N'Hitmonlee', NULL, NULL, NULL, 428, 428)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (431, N'vi', CAST(N'2016-10-03T01:07:35.1440466' AS DateTime2), NULL, 1, NULL, N'Hitmonlee', NULL, NULL, NULL, 429, 428)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (432, N'en', CAST(N'2016-10-03T01:07:35.2901122' AS DateTime2), NULL, 1, NULL, N'Hitmonchan', NULL, NULL, NULL, 430, 432)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (433, N'vi', CAST(N'2016-10-03T01:07:35.2901122' AS DateTime2), NULL, 1, NULL, N'Hitmonchan', NULL, NULL, NULL, 431, 432)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (434, N'en', CAST(N'2016-10-03T01:07:35.2901122' AS DateTime2), NULL, 1, NULL, N'Hitmonchan', NULL, NULL, NULL, 432, 432)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (435, N'vi', CAST(N'2016-10-03T01:07:35.2901122' AS DateTime2), NULL, 1, NULL, N'Hitmonchan', NULL, NULL, NULL, 433, 432)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (436, N'en', CAST(N'2016-10-03T01:07:35.4396238' AS DateTime2), NULL, 1, NULL, N'Lickitung', NULL, NULL, NULL, 434, 436)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (437, N'vi', CAST(N'2016-10-03T01:07:35.4396238' AS DateTime2), NULL, 1, NULL, N'Lickitung', NULL, NULL, NULL, 435, 436)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (438, N'en', CAST(N'2016-10-03T01:07:35.4396238' AS DateTime2), NULL, 1, NULL, N'Lickitung', NULL, NULL, NULL, 436, 436)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (439, N'vi', CAST(N'2016-10-03T01:07:35.4396238' AS DateTime2), NULL, 1, NULL, N'Lickitung', NULL, NULL, NULL, 437, 436)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (440, N'en', CAST(N'2016-10-03T01:07:35.5916073' AS DateTime2), NULL, 1, NULL, N'Koffing', NULL, NULL, NULL, 438, 440)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (441, N'vi', CAST(N'2016-10-03T01:07:35.5916073' AS DateTime2), NULL, 1, NULL, N'Koffing', NULL, NULL, NULL, 439, 440)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (442, N'en', CAST(N'2016-10-03T01:07:35.5916073' AS DateTime2), NULL, 1, NULL, N'Koffing', NULL, NULL, NULL, 440, 440)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (443, N'vi', CAST(N'2016-10-03T01:07:35.5916073' AS DateTime2), NULL, 1, NULL, N'Koffing', NULL, NULL, NULL, 441, 440)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (444, N'en', CAST(N'2016-10-03T01:07:35.7401182' AS DateTime2), NULL, 1, NULL, N'Weezing', NULL, NULL, NULL, 442, 444)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (445, N'vi', CAST(N'2016-10-03T01:07:35.7401182' AS DateTime2), NULL, 1, NULL, N'Weezing', NULL, NULL, NULL, 443, 444)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (446, N'en', CAST(N'2016-10-03T01:07:35.7401182' AS DateTime2), NULL, 1, NULL, N'Weezing', NULL, NULL, NULL, 444, 444)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (447, N'vi', CAST(N'2016-10-03T01:07:35.7401182' AS DateTime2), NULL, 1, NULL, N'Weezing', NULL, NULL, NULL, 445, 444)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (448, N'en', CAST(N'2016-10-03T01:07:35.8856235' AS DateTime2), NULL, 1, NULL, N'Rhyhorn', NULL, NULL, NULL, 446, 448)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (449, N'vi', CAST(N'2016-10-03T01:07:35.8856235' AS DateTime2), NULL, 1, NULL, N'Rhyhorn', NULL, NULL, NULL, 447, 448)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (450, N'en', CAST(N'2016-10-03T01:07:35.8856235' AS DateTime2), NULL, 1, NULL, N'Rhyhorn', NULL, NULL, NULL, 448, 448)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (451, N'vi', CAST(N'2016-10-03T01:07:35.8856235' AS DateTime2), NULL, 1, NULL, N'Rhyhorn', NULL, NULL, NULL, 449, 448)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (452, N'en', CAST(N'2016-10-03T01:07:36.0341058' AS DateTime2), NULL, 1, NULL, N'Rhydon', NULL, NULL, NULL, 450, 452)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (453, N'vi', CAST(N'2016-10-03T01:07:36.0341058' AS DateTime2), NULL, 1, NULL, N'Rhydon', NULL, NULL, NULL, 451, 452)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (454, N'en', CAST(N'2016-10-03T01:07:36.0341058' AS DateTime2), NULL, 1, NULL, N'Rhydon', NULL, NULL, NULL, 452, 452)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (455, N'vi', CAST(N'2016-10-03T01:07:36.0341058' AS DateTime2), NULL, 1, NULL, N'Rhydon', NULL, NULL, NULL, 453, 452)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (456, N'en', CAST(N'2016-10-03T01:07:36.1856167' AS DateTime2), NULL, 1, NULL, N'Chansey', NULL, NULL, NULL, 454, 456)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (457, N'vi', CAST(N'2016-10-03T01:07:36.1856167' AS DateTime2), NULL, 1, NULL, N'Chansey', NULL, NULL, NULL, 455, 456)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (458, N'en', CAST(N'2016-10-03T01:07:36.1856167' AS DateTime2), NULL, 1, NULL, N'Chansey', NULL, NULL, NULL, 456, 456)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (459, N'vi', CAST(N'2016-10-03T01:07:36.1856167' AS DateTime2), NULL, 1, NULL, N'Chansey', NULL, NULL, NULL, 457, 456)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (460, N'en', CAST(N'2016-10-03T01:07:36.3361055' AS DateTime2), NULL, 1, NULL, N'Tangela', NULL, NULL, NULL, 458, 460)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (461, N'vi', CAST(N'2016-10-03T01:07:36.3361055' AS DateTime2), NULL, 1, NULL, N'Tangela', NULL, NULL, NULL, 459, 460)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (462, N'en', CAST(N'2016-10-03T01:07:36.3361055' AS DateTime2), NULL, 1, NULL, N'Tangela', NULL, NULL, NULL, 460, 460)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (463, N'vi', CAST(N'2016-10-03T01:07:36.3361055' AS DateTime2), NULL, 1, NULL, N'Tangela', NULL, NULL, NULL, 461, 460)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (464, N'en', CAST(N'2016-10-03T01:07:36.4897957' AS DateTime2), NULL, 1, NULL, N'Kangaskhan', NULL, NULL, NULL, 462, 464)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (465, N'vi', CAST(N'2016-10-03T01:07:36.4897957' AS DateTime2), NULL, 1, NULL, N'Kangaskhan', NULL, NULL, NULL, 463, 464)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (466, N'en', CAST(N'2016-10-03T01:07:36.4897957' AS DateTime2), NULL, 1, NULL, N'Kangaskhan', NULL, NULL, NULL, 464, 464)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (467, N'vi', CAST(N'2016-10-03T01:07:36.4897957' AS DateTime2), NULL, 1, NULL, N'Kangaskhan', NULL, NULL, NULL, 465, 464)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (468, N'en', CAST(N'2016-10-03T01:07:36.6472972' AS DateTime2), NULL, 1, NULL, N'Horsea', NULL, NULL, NULL, 466, 468)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (469, N'vi', CAST(N'2016-10-03T01:07:36.6472972' AS DateTime2), NULL, 1, NULL, N'Horsea', NULL, NULL, NULL, 467, 468)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (470, N'en', CAST(N'2016-10-03T01:07:36.6472972' AS DateTime2), NULL, 1, NULL, N'Horsea', NULL, NULL, NULL, 468, 468)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (471, N'vi', CAST(N'2016-10-03T01:07:36.6472972' AS DateTime2), NULL, 1, NULL, N'Horsea', NULL, NULL, NULL, 469, 468)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (472, N'en', CAST(N'2016-10-03T01:07:36.8068159' AS DateTime2), NULL, 1, NULL, N'Seadra', NULL, NULL, NULL, 470, 472)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (473, N'vi', CAST(N'2016-10-03T01:07:36.8068159' AS DateTime2), NULL, 1, NULL, N'Seadra', NULL, NULL, NULL, 471, 472)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (474, N'en', CAST(N'2016-10-03T01:07:36.8068159' AS DateTime2), NULL, 1, NULL, N'Seadra', NULL, NULL, NULL, 472, 472)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (475, N'vi', CAST(N'2016-10-03T01:07:36.8068159' AS DateTime2), NULL, 1, NULL, N'Seadra', NULL, NULL, NULL, 473, 472)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (476, N'en', CAST(N'2016-10-03T01:07:36.9663090' AS DateTime2), NULL, 1, NULL, N'Goldeen', NULL, NULL, NULL, 474, 476)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (477, N'vi', CAST(N'2016-10-03T01:07:36.9663090' AS DateTime2), NULL, 1, NULL, N'Goldeen', NULL, NULL, NULL, 475, 476)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (478, N'en', CAST(N'2016-10-03T01:07:36.9663090' AS DateTime2), NULL, 1, NULL, N'Goldeen', NULL, NULL, NULL, 476, 476)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (479, N'vi', CAST(N'2016-10-03T01:07:36.9663090' AS DateTime2), NULL, 1, NULL, N'Goldeen', NULL, NULL, NULL, 477, 476)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (480, N'en', CAST(N'2016-10-03T01:07:37.1228080' AS DateTime2), NULL, 1, NULL, N'Seaking', NULL, NULL, NULL, 478, 480)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (481, N'vi', CAST(N'2016-10-03T01:07:37.1228080' AS DateTime2), NULL, 1, NULL, N'Seaking', NULL, NULL, NULL, 479, 480)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (482, N'en', CAST(N'2016-10-03T01:07:37.1228080' AS DateTime2), NULL, 1, NULL, N'Seaking', NULL, NULL, NULL, 480, 480)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (483, N'vi', CAST(N'2016-10-03T01:07:37.1228080' AS DateTime2), NULL, 1, NULL, N'Seaking', NULL, NULL, NULL, 481, 480)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (484, N'en', CAST(N'2016-10-03T01:07:37.2827968' AS DateTime2), NULL, 1, NULL, N'Staryu', NULL, NULL, NULL, 482, 484)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (485, N'vi', CAST(N'2016-10-03T01:07:37.2827968' AS DateTime2), NULL, 1, NULL, N'Staryu', NULL, NULL, NULL, 483, 484)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (486, N'en', CAST(N'2016-10-03T01:07:37.2827968' AS DateTime2), NULL, 1, NULL, N'Staryu', NULL, NULL, NULL, 484, 484)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (487, N'vi', CAST(N'2016-10-03T01:07:37.2827968' AS DateTime2), NULL, 1, NULL, N'Staryu', NULL, NULL, NULL, 485, 484)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (488, N'en', CAST(N'2016-10-03T01:07:37.4427991' AS DateTime2), NULL, 1, NULL, N'Starmie', NULL, NULL, NULL, 486, 488)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (489, N'vi', CAST(N'2016-10-03T01:07:37.4427991' AS DateTime2), NULL, 1, NULL, N'Starmie', NULL, NULL, NULL, 487, 488)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (490, N'en', CAST(N'2016-10-03T01:07:37.4427991' AS DateTime2), NULL, 1, NULL, N'Starmie', NULL, NULL, NULL, 488, 488)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (491, N'vi', CAST(N'2016-10-03T01:07:37.4427991' AS DateTime2), NULL, 1, NULL, N'Starmie', NULL, NULL, NULL, 489, 488)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (492, N'en', CAST(N'2016-10-03T01:07:37.6013125' AS DateTime2), NULL, 1, NULL, N'MrMime', NULL, NULL, NULL, 490, 492)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (493, N'vi', CAST(N'2016-10-03T01:07:37.6013125' AS DateTime2), NULL, 1, NULL, N'MrMime', NULL, NULL, NULL, 491, 492)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (494, N'en', CAST(N'2016-10-03T01:07:37.6013125' AS DateTime2), NULL, 1, NULL, N'MrMime', NULL, NULL, NULL, 492, 492)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (495, N'vi', CAST(N'2016-10-03T01:07:37.6013125' AS DateTime2), NULL, 1, NULL, N'MrMime', NULL, NULL, NULL, 493, 492)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (496, N'en', CAST(N'2016-10-03T01:07:37.7618772' AS DateTime2), NULL, 1, NULL, N'Scyther', NULL, NULL, NULL, 494, 496)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (497, N'vi', CAST(N'2016-10-03T01:07:37.7618772' AS DateTime2), NULL, 1, NULL, N'Scyther', NULL, NULL, NULL, 495, 496)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (498, N'en', CAST(N'2016-10-03T01:07:37.7618772' AS DateTime2), NULL, 1, NULL, N'Scyther', NULL, NULL, NULL, 496, 496)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (499, N'vi', CAST(N'2016-10-03T01:07:37.7618772' AS DateTime2), NULL, 1, NULL, N'Scyther', NULL, NULL, NULL, 497, 496)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (500, N'en', CAST(N'2016-10-03T01:07:37.9343786' AS DateTime2), NULL, 1, NULL, N'Jynx', NULL, NULL, NULL, 498, 500)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (501, N'vi', CAST(N'2016-10-03T01:07:37.9343786' AS DateTime2), NULL, 1, NULL, N'Jynx', NULL, NULL, NULL, 499, 500)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (502, N'en', CAST(N'2016-10-03T01:07:37.9343786' AS DateTime2), NULL, 1, NULL, N'Jynx', NULL, NULL, NULL, 500, 500)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (503, N'vi', CAST(N'2016-10-03T01:07:37.9343786' AS DateTime2), NULL, 1, NULL, N'Jynx', NULL, NULL, NULL, 501, 500)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (504, N'en', CAST(N'2016-10-03T01:07:38.1033737' AS DateTime2), NULL, 1, NULL, N'Electabuzz', NULL, NULL, NULL, 502, 504)
GO
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (505, N'vi', CAST(N'2016-10-03T01:07:38.1033737' AS DateTime2), NULL, 1, NULL, N'Electabuzz', NULL, NULL, NULL, 503, 504)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (506, N'en', CAST(N'2016-10-03T01:07:38.1033737' AS DateTime2), NULL, 1, NULL, N'Electabuzz', NULL, NULL, NULL, 504, 504)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (507, N'vi', CAST(N'2016-10-03T01:07:38.1033737' AS DateTime2), NULL, 1, NULL, N'Electabuzz', NULL, NULL, NULL, 505, 504)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (508, N'en', CAST(N'2016-10-03T01:07:38.2718646' AS DateTime2), NULL, 1, NULL, N'Magmar', NULL, NULL, NULL, 506, 508)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (509, N'vi', CAST(N'2016-10-03T01:07:38.2718646' AS DateTime2), NULL, 1, NULL, N'Magmar', NULL, NULL, NULL, 507, 508)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (510, N'en', CAST(N'2016-10-03T01:07:38.2718646' AS DateTime2), NULL, 1, NULL, N'Magmar', NULL, NULL, NULL, 508, 508)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (511, N'vi', CAST(N'2016-10-03T01:07:38.2718646' AS DateTime2), NULL, 1, NULL, N'Magmar', NULL, NULL, NULL, 509, 508)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (512, N'en', CAST(N'2016-10-03T01:07:38.4309946' AS DateTime2), NULL, 1, NULL, N'Pinsir', NULL, NULL, NULL, 510, 512)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (513, N'vi', CAST(N'2016-10-03T01:07:38.4309946' AS DateTime2), NULL, 1, NULL, N'Pinsir', NULL, NULL, NULL, 511, 512)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (514, N'en', CAST(N'2016-10-03T01:07:38.4309946' AS DateTime2), NULL, 1, NULL, N'Pinsir', NULL, NULL, NULL, 512, 512)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (515, N'vi', CAST(N'2016-10-03T01:07:38.4309946' AS DateTime2), NULL, 1, NULL, N'Pinsir', NULL, NULL, NULL, 513, 512)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (516, N'en', CAST(N'2016-10-03T01:07:38.5961045' AS DateTime2), NULL, 1, NULL, N'Tauros', NULL, NULL, NULL, 514, 516)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (517, N'vi', CAST(N'2016-10-03T01:07:38.5961045' AS DateTime2), NULL, 1, NULL, N'Tauros', NULL, NULL, NULL, 515, 516)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (518, N'en', CAST(N'2016-10-03T01:07:38.5961045' AS DateTime2), NULL, 1, NULL, N'Tauros', NULL, NULL, NULL, 516, 516)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (519, N'vi', CAST(N'2016-10-03T01:07:38.5961045' AS DateTime2), NULL, 1, NULL, N'Tauros', NULL, NULL, NULL, 517, 516)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (520, N'en', CAST(N'2016-10-03T01:07:38.7651167' AS DateTime2), NULL, 1, NULL, N'Magikarp', NULL, NULL, NULL, 518, 520)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (521, N'vi', CAST(N'2016-10-03T01:07:38.7651167' AS DateTime2), NULL, 1, NULL, N'Magikarp', NULL, NULL, NULL, 519, 520)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (522, N'en', CAST(N'2016-10-03T01:07:38.7651167' AS DateTime2), NULL, 1, NULL, N'Magikarp', NULL, NULL, NULL, 520, 520)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (523, N'vi', CAST(N'2016-10-03T01:07:38.7651167' AS DateTime2), NULL, 1, NULL, N'Magikarp', NULL, NULL, NULL, 521, 520)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (524, N'en', CAST(N'2016-10-03T01:07:38.9336153' AS DateTime2), NULL, 1, NULL, N'Gyarados', NULL, NULL, NULL, 522, 524)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (525, N'vi', CAST(N'2016-10-03T01:07:38.9336153' AS DateTime2), NULL, 1, NULL, N'Gyarados', NULL, NULL, NULL, 523, 524)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (526, N'en', CAST(N'2016-10-03T01:07:38.9336153' AS DateTime2), NULL, 1, NULL, N'Gyarados', NULL, NULL, NULL, 524, 524)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (527, N'vi', CAST(N'2016-10-03T01:07:38.9336153' AS DateTime2), NULL, 1, NULL, N'Gyarados', NULL, NULL, NULL, 525, 524)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (528, N'en', CAST(N'2016-10-03T01:07:39.1076152' AS DateTime2), NULL, 1, NULL, N'Lapras', NULL, NULL, NULL, 526, 528)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (529, N'vi', CAST(N'2016-10-03T01:07:39.1076152' AS DateTime2), NULL, 1, NULL, N'Lapras', NULL, NULL, NULL, 527, 528)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (530, N'en', CAST(N'2016-10-03T01:07:39.1076152' AS DateTime2), NULL, 1, NULL, N'Lapras', NULL, NULL, NULL, 528, 528)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (531, N'vi', CAST(N'2016-10-03T01:07:39.1076152' AS DateTime2), NULL, 1, NULL, N'Lapras', NULL, NULL, NULL, 529, 528)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (532, N'en', CAST(N'2016-10-03T01:07:39.2803514' AS DateTime2), NULL, 1, NULL, N'Ditto', NULL, NULL, NULL, 530, 532)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (533, N'vi', CAST(N'2016-10-03T01:07:39.2803514' AS DateTime2), NULL, 1, NULL, N'Ditto', NULL, NULL, NULL, 531, 532)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (534, N'en', CAST(N'2016-10-03T01:07:39.2803514' AS DateTime2), NULL, 1, NULL, N'Ditto', NULL, NULL, NULL, 532, 532)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (535, N'vi', CAST(N'2016-10-03T01:07:39.2803514' AS DateTime2), NULL, 1, NULL, N'Ditto', NULL, NULL, NULL, 533, 532)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (536, N'en', CAST(N'2016-10-03T01:07:39.4513616' AS DateTime2), NULL, 1, NULL, N'Eevee', NULL, NULL, NULL, 534, 536)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (537, N'vi', CAST(N'2016-10-03T01:07:39.4513616' AS DateTime2), NULL, 1, NULL, N'Eevee', NULL, NULL, NULL, 535, 536)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (538, N'en', CAST(N'2016-10-03T01:07:39.4513616' AS DateTime2), NULL, 1, NULL, N'Eevee', NULL, NULL, NULL, 536, 536)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (539, N'vi', CAST(N'2016-10-03T01:07:39.4513616' AS DateTime2), NULL, 1, NULL, N'Eevee', NULL, NULL, NULL, 537, 536)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (540, N'en', CAST(N'2016-10-03T01:07:39.6996023' AS DateTime2), NULL, 1, NULL, N'Vaporeon', NULL, NULL, NULL, 538, 540)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (541, N'vi', CAST(N'2016-10-03T01:07:39.6996023' AS DateTime2), NULL, 1, NULL, N'Vaporeon', NULL, NULL, NULL, 539, 540)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (542, N'en', CAST(N'2016-10-03T01:07:39.6996023' AS DateTime2), NULL, 1, NULL, N'Vaporeon', NULL, NULL, NULL, 540, 540)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (543, N'vi', CAST(N'2016-10-03T01:07:39.6996023' AS DateTime2), NULL, 1, NULL, N'Vaporeon', NULL, NULL, NULL, 541, 540)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (544, N'en', CAST(N'2016-10-03T01:07:39.8801158' AS DateTime2), NULL, 1, NULL, N'Jolteon', NULL, NULL, NULL, 542, 544)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (545, N'vi', CAST(N'2016-10-03T01:07:39.8801158' AS DateTime2), NULL, 1, NULL, N'Jolteon', NULL, NULL, NULL, 543, 544)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (546, N'en', CAST(N'2016-10-03T01:07:39.8801158' AS DateTime2), NULL, 1, NULL, N'Jolteon', NULL, NULL, NULL, 544, 544)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (547, N'vi', CAST(N'2016-10-03T01:07:39.8801158' AS DateTime2), NULL, 1, NULL, N'Jolteon', NULL, NULL, NULL, 545, 544)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (548, N'en', CAST(N'2016-10-03T01:07:40.0545156' AS DateTime2), NULL, 1, NULL, N'Flareon', NULL, NULL, NULL, 546, 548)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (549, N'vi', CAST(N'2016-10-03T01:07:40.0545156' AS DateTime2), NULL, 1, NULL, N'Flareon', NULL, NULL, NULL, 547, 548)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (550, N'en', CAST(N'2016-10-03T01:07:40.0545156' AS DateTime2), NULL, 1, NULL, N'Flareon', NULL, NULL, NULL, 548, 548)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (551, N'vi', CAST(N'2016-10-03T01:07:40.0545156' AS DateTime2), NULL, 1, NULL, N'Flareon', NULL, NULL, NULL, 549, 548)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (552, N'en', CAST(N'2016-10-03T01:07:40.2330183' AS DateTime2), NULL, 1, NULL, N'Porygon', NULL, NULL, NULL, 550, 552)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (553, N'vi', CAST(N'2016-10-03T01:07:40.2330183' AS DateTime2), NULL, 1, NULL, N'Porygon', NULL, NULL, NULL, 551, 552)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (554, N'en', CAST(N'2016-10-03T01:07:40.2330183' AS DateTime2), NULL, 1, NULL, N'Porygon', NULL, NULL, NULL, 552, 552)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (555, N'vi', CAST(N'2016-10-03T01:07:40.2330183' AS DateTime2), NULL, 1, NULL, N'Porygon', NULL, NULL, NULL, 553, 552)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (556, N'en', CAST(N'2016-10-03T01:07:40.4150466' AS DateTime2), NULL, 1, NULL, N'Omanyte', NULL, NULL, NULL, 554, 556)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (557, N'vi', CAST(N'2016-10-03T01:07:40.4150466' AS DateTime2), NULL, 1, NULL, N'Omanyte', NULL, NULL, NULL, 555, 556)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (558, N'en', CAST(N'2016-10-03T01:07:40.4150466' AS DateTime2), NULL, 1, NULL, N'Omanyte', NULL, NULL, NULL, 556, 556)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (559, N'vi', CAST(N'2016-10-03T01:07:40.4150466' AS DateTime2), NULL, 1, NULL, N'Omanyte', NULL, NULL, NULL, 557, 556)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (560, N'en', CAST(N'2016-10-03T01:07:40.6050168' AS DateTime2), NULL, 1, NULL, N'Omastar', NULL, NULL, NULL, 558, 560)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (561, N'vi', CAST(N'2016-10-03T01:07:40.6050168' AS DateTime2), NULL, 1, NULL, N'Omastar', NULL, NULL, NULL, 559, 560)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (562, N'en', CAST(N'2016-10-03T01:07:40.6050168' AS DateTime2), NULL, 1, NULL, N'Omastar', NULL, NULL, NULL, 560, 560)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (563, N'vi', CAST(N'2016-10-03T01:07:40.6050168' AS DateTime2), NULL, 1, NULL, N'Omastar', NULL, NULL, NULL, 561, 560)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (564, N'en', CAST(N'2016-10-03T01:07:40.7805169' AS DateTime2), NULL, 1, NULL, N'Kabuto', NULL, NULL, NULL, 562, 564)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (565, N'vi', CAST(N'2016-10-03T01:07:40.7805169' AS DateTime2), NULL, 1, NULL, N'Kabuto', NULL, NULL, NULL, 563, 564)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (566, N'en', CAST(N'2016-10-03T01:07:40.7805169' AS DateTime2), NULL, 1, NULL, N'Kabuto', NULL, NULL, NULL, 564, 564)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (567, N'vi', CAST(N'2016-10-03T01:07:40.7805169' AS DateTime2), NULL, 1, NULL, N'Kabuto', NULL, NULL, NULL, 565, 564)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (568, N'en', CAST(N'2016-10-03T01:07:40.9585154' AS DateTime2), NULL, 1, NULL, N'Kabutops', NULL, NULL, NULL, 566, 568)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (569, N'vi', CAST(N'2016-10-03T01:07:40.9585154' AS DateTime2), NULL, 1, NULL, N'Kabutops', NULL, NULL, NULL, 567, 568)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (570, N'en', CAST(N'2016-10-03T01:07:40.9585154' AS DateTime2), NULL, 1, NULL, N'Kabutops', NULL, NULL, NULL, 568, 568)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (571, N'vi', CAST(N'2016-10-03T01:07:40.9585154' AS DateTime2), NULL, 1, NULL, N'Kabutops', NULL, NULL, NULL, 569, 568)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (572, N'en', CAST(N'2016-10-03T01:07:41.1365152' AS DateTime2), NULL, 1, NULL, N'Aerodactyl', NULL, NULL, NULL, 570, 572)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (573, N'vi', CAST(N'2016-10-03T01:07:41.1365152' AS DateTime2), NULL, 1, NULL, N'Aerodactyl', NULL, NULL, NULL, 571, 572)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (574, N'en', CAST(N'2016-10-03T01:07:41.1365152' AS DateTime2), NULL, 1, NULL, N'Aerodactyl', NULL, NULL, NULL, 572, 572)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (575, N'vi', CAST(N'2016-10-03T01:07:41.1365152' AS DateTime2), NULL, 1, NULL, N'Aerodactyl', NULL, NULL, NULL, 573, 572)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (576, N'en', CAST(N'2016-10-03T01:07:41.3175163' AS DateTime2), NULL, 1, NULL, N'Snorlax', NULL, NULL, NULL, 574, 576)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (577, N'vi', CAST(N'2016-10-03T01:07:41.3175163' AS DateTime2), NULL, 1, NULL, N'Snorlax', NULL, NULL, NULL, 575, 576)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (578, N'en', CAST(N'2016-10-03T01:07:41.3175163' AS DateTime2), NULL, 1, NULL, N'Snorlax', NULL, NULL, NULL, 576, 576)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (579, N'vi', CAST(N'2016-10-03T01:07:41.3175163' AS DateTime2), NULL, 1, NULL, N'Snorlax', NULL, NULL, NULL, 577, 576)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (580, N'en', CAST(N'2016-10-03T01:07:41.5020168' AS DateTime2), NULL, 1, NULL, N'Articuno', NULL, NULL, NULL, 578, 580)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (581, N'vi', CAST(N'2016-10-03T01:07:41.5020168' AS DateTime2), NULL, 1, NULL, N'Articuno', NULL, NULL, NULL, 579, 580)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (582, N'en', CAST(N'2016-10-03T01:07:41.5020168' AS DateTime2), NULL, 1, NULL, N'Articuno', NULL, NULL, NULL, 580, 580)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (583, N'vi', CAST(N'2016-10-03T01:07:41.5020168' AS DateTime2), NULL, 1, NULL, N'Articuno', NULL, NULL, NULL, 581, 580)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (584, N'en', CAST(N'2016-10-03T01:07:41.7653061' AS DateTime2), NULL, 1, NULL, N'Zapdos', NULL, NULL, NULL, 582, 584)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (585, N'vi', CAST(N'2016-10-03T01:07:41.7653061' AS DateTime2), NULL, 1, NULL, N'Zapdos', NULL, NULL, NULL, 583, 584)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (586, N'en', CAST(N'2016-10-03T01:07:41.7653061' AS DateTime2), NULL, 1, NULL, N'Zapdos', NULL, NULL, NULL, 584, 584)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (587, N'vi', CAST(N'2016-10-03T01:07:41.7653061' AS DateTime2), NULL, 1, NULL, N'Zapdos', NULL, NULL, NULL, 585, 584)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (588, N'en', CAST(N'2016-10-03T01:07:42.0028024' AS DateTime2), NULL, 1, NULL, N'Moltres', NULL, NULL, NULL, 586, 588)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (589, N'vi', CAST(N'2016-10-03T01:07:42.0028024' AS DateTime2), NULL, 1, NULL, N'Moltres', NULL, NULL, NULL, 587, 588)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (590, N'en', CAST(N'2016-10-03T01:07:42.0028024' AS DateTime2), NULL, 1, NULL, N'Moltres', NULL, NULL, NULL, 588, 588)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (591, N'vi', CAST(N'2016-10-03T01:07:42.0028024' AS DateTime2), NULL, 1, NULL, N'Moltres', NULL, NULL, NULL, 589, 588)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (592, N'en', CAST(N'2016-10-03T01:07:42.1970564' AS DateTime2), NULL, 1, NULL, N'Dratini', NULL, NULL, NULL, 590, 592)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (593, N'vi', CAST(N'2016-10-03T01:07:42.1970564' AS DateTime2), NULL, 1, NULL, N'Dratini', NULL, NULL, NULL, 591, 592)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (594, N'en', CAST(N'2016-10-03T01:07:42.1970564' AS DateTime2), NULL, 1, NULL, N'Dratini', NULL, NULL, NULL, 592, 592)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (595, N'vi', CAST(N'2016-10-03T01:07:42.1970564' AS DateTime2), NULL, 1, NULL, N'Dratini', NULL, NULL, NULL, 593, 592)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (596, N'en', CAST(N'2016-10-03T01:07:42.3885354' AS DateTime2), NULL, 1, NULL, N'Dragonair', NULL, NULL, NULL, 594, 596)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (597, N'vi', CAST(N'2016-10-03T01:07:42.3885354' AS DateTime2), NULL, 1, NULL, N'Dragonair', NULL, NULL, NULL, 595, 596)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (598, N'en', CAST(N'2016-10-03T01:07:42.3885354' AS DateTime2), NULL, 1, NULL, N'Dragonair', NULL, NULL, NULL, 596, 596)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (599, N'vi', CAST(N'2016-10-03T01:07:42.3885354' AS DateTime2), NULL, 1, NULL, N'Dragonair', NULL, NULL, NULL, 597, 596)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (600, N'en', CAST(N'2016-10-03T01:07:42.5735504' AS DateTime2), NULL, 1, NULL, N'Dragonite', NULL, NULL, NULL, 598, 600)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (601, N'vi', CAST(N'2016-10-03T01:07:42.5735504' AS DateTime2), NULL, 1, NULL, N'Dragonite', NULL, NULL, NULL, 599, 600)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (602, N'en', CAST(N'2016-10-03T01:07:42.5735504' AS DateTime2), NULL, 1, NULL, N'Dragonite', NULL, NULL, NULL, 600, 600)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (603, N'vi', CAST(N'2016-10-03T01:07:42.5735504' AS DateTime2), NULL, 1, NULL, N'Dragonite', NULL, NULL, NULL, 601, 600)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (604, N'en', CAST(N'2016-10-03T01:07:42.7665455' AS DateTime2), NULL, 1, NULL, N'Mewtwo', NULL, NULL, NULL, 602, 604)
GO
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (605, N'vi', CAST(N'2016-10-03T01:07:42.7665455' AS DateTime2), NULL, 1, NULL, N'Mewtwo', NULL, NULL, NULL, 603, 604)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (606, N'en', CAST(N'2016-10-03T01:07:42.7665455' AS DateTime2), NULL, 1, NULL, N'Mewtwo', NULL, NULL, NULL, 604, 604)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (607, N'vi', CAST(N'2016-10-03T01:07:42.7665455' AS DateTime2), NULL, 1, NULL, N'Mewtwo', NULL, NULL, NULL, 605, 604)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (608, N'en', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Mew', NULL, NULL, NULL, 607, 608)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (609, N'vi', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Mew', NULL, NULL, NULL, 606, 608)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (610, N'en', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Mew', NULL, NULL, NULL, 608, 608)
INSERT [dbo].[Pages] ([Id], [ContentLanguage], [CreatedDate], [CreatedUserId], [IsNewPage], [TagId], [Title], [UpdatedDate], [UpdatedUserId], [FeatureImageId], [NewestContent], [ContentObjectId]) VALUES (611, N'vi', CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), NULL, 1, NULL, N'Mew', NULL, NULL, NULL, 609, 608)
SET IDENTITY_INSERT [dbo].[Pages] OFF
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1004, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1024, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1029, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1030, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1032, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1033, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1038, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1043, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1045, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1046, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1047, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1059, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1080, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1081, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1082, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1083, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1084, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1085, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1102, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1110, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1133, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1146, 19)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1009, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1011, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1012, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1013, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1055, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1069, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1070, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1100, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1101, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1115, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1129, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1152, 20)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1010, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1016, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1017, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1019, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1027, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1028, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1041, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1051, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1056, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1057, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1061, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1064, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1065, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1071, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1072, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1073, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1111, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1112, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1116, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1117, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1125, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1130, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1131, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1134, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1135, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1136, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1137, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1142, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1147, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1148, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1149, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1150, 21)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1036, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1037, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1039, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1060, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1088, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1089, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1132, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1143, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1151, 22)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1002, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1005, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1006, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1008, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1049, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1066, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1067, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1068, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1104, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1105, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1106, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1123, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1124, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1144, 23)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1021, 24)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1058, 24)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1061, 24)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1135, 24)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1137, 24)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1052, 25)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1053, 25)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1054, 25)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1113, 25)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1114, 25)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1117, 25)
GO
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1121, 25)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1122, 25)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1003, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1006, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1008, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1015, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1023, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1027, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1034, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1035, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1048, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1050, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1062, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1066, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1067, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1068, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1077, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1078, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1079, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1086, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1087, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1092, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1093, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1094, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1095, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1096, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1097, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1103, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1104, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1105, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1107, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1123, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1124, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1125, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1138, 26)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1040, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1042, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1063, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1090, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1091, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1094, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1097, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1108, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1109, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1126, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1127, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1128, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1139, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1145, 27)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1009, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1014, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1015, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1020, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1021, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1026, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1029, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1036, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1059, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1070, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1076, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1080, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1081, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1082, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1084, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1085, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1103, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1133, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1149, 28)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1005, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1007, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1025, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1044, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1051, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1058, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1118, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1119, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1120, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1130, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1131, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1140, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1141, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1144, 29)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1022, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1023, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1026, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1049, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1074, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1075, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1076, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1077, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1078, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1079, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1106, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1107, 30)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1010, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1016, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1019, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1020, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1040, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1042, 31)
GO
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1065, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1126, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1127, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1128, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1139, 31)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1035, 32)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1048, 32)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1138, 32)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1014, 33)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1018, 33)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1031, 33)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1060, 35)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1132, 35)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1044, 36)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1045, 36)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1098, 36)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1099, 36)
INSERT [dbo].[PokemonLocation] ([CharacterId], [LocationId]) VALUES (1102, 36)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1028, 4)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1084, 4)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1085, 4)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1095, 4)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1133, 4)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1148, 4)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1019, 6)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1126, 6)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1127, 6)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1128, 6)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1139, 6)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1003, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1006, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1008, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1034, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1050, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1062, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1086, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1087, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1104, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1105, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1123, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1124, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1125, 14)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1009, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1011, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1012, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1013, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1069, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1070, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1100, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1101, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1115, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1129, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1152, 15)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1037, 20)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1060, 20)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1089, 20)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1132, 20)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1143, 20)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1035, 21)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1048, 21)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1109, 21)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1006, 22)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1008, 22)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1067, 22)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1068, 22)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1104, 22)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1105, 22)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1124, 22)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1027, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1077, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1078, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1086, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1092, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1093, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1095, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1096, 23)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1059, 24)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1003, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1004, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1011, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1032, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1037, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1043, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1062, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1066, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1071, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1074, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1075, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1080, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1083, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1126, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1136, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1139, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1143, 26)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1014, 29)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1020, 29)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1026, 29)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1029, 29)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1081, 29)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1082, 29)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1085, 29)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1036, 34)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1039, 34)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1060, 34)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1088, 34)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1089, 34)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1132, 34)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1151, 34)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1038, 38)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1040, 38)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1042, 38)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1050, 38)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1063, 38)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1145, 38)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1017, 47)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1027, 47)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1057, 47)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1071, 47)
GO
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1116, 47)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1117, 47)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1142, 47)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1013, 52)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1052, 52)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1113, 52)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1114, 52)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1121, 52)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1122, 52)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1016, 53)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1022, 53)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1026, 53)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1049, 53)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1059, 53)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1097, 53)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1004, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1032, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1033, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1051, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1056, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1080, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1083, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1084, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1088, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1100, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1103, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1133, 54)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1005, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1023, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1025, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1044, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1076, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1107, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1112, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1119, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1120, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1130, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1131, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1140, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1141, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1144, 59)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1064, 61)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1055, 62)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1052, 63)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1053, 63)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1038, 64)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1039, 64)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1054, 64)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1114, 64)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1121, 64)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1122, 64)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1129, 64)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1061, 65)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1134, 65)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1135, 65)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1136, 65)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1137, 65)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1029, 66)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1045, 66)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1047, 66)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1101, 66)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1102, 66)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1015, 71)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1070, 71)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1081, 71)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1082, 71)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1035, 76)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1138, 76)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1041, 86)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1091, 86)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1017, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1019, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1051, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1056, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1065, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1072, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1073, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1111, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1112, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1130, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1131, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1134, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1147, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1150, 88)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1010, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1012, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1047, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1069, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1090, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1106, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1108, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1110, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1113, 89)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1030, 90)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1048, 90)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1138, 90)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1146, 90)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1010, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1016, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1041, 95)
GO
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1057, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1065, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1090, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1091, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1108, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1109, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1116, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1117, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1127, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1128, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1142, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1148, 95)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1025, 96)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1119, 96)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1120, 96)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1014, 105)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1018, 105)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1031, 105)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1147, 105)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1149, 105)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1015, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1020, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1033, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1055, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1072, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1073, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1087, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1092, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1093, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1094, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1103, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1110, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1115, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1149, 106)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1023, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1049, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1074, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1075, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1076, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1077, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1078, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1079, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1106, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1107, 115)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1002, 117)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1066, 117)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1067, 117)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1068, 117)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1123, 117)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1005, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1030, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1043, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1044, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1046, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1098, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1099, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1111, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1118, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1141, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1146, 123)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1028, 124)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1034, 124)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1079, 124)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1094, 124)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1096, 124)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1097, 124)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1125, 124)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1007, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1024, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1045, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1046, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1058, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1098, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1099, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1102, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1140, 130)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1021, 131)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1058, 131)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1061, 131)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1135, 131)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1137, 131)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1022, 134)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1040, 134)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1042, 134)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1053, 134)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1054, 134)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1063, 134)
INSERT [dbo].[PokemonMove] ([CharacterId], [MoveId]) VALUES (1145, 134)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1030, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1032, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1045, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1083, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1092, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1095, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1098, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1100, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1110, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1115, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1116, 1)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1017, 2)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1027, 2)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1056, 2)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1057, 2)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1116, 2)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1136, 2)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1142, 2)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1029, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1059, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1079, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1080, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1081, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1082, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1084, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1085, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1133, 3)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1057, 5)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1042, 7)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1055, 7)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1091, 7)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1145, 7)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1024, 8)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1064, 8)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1074, 8)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1075, 8)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1077, 8)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1078, 8)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1060, 9)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1132, 9)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1042, 10)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1043, 10)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1095, 10)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1096, 10)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1148, 10)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1016, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1027, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1041, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1071, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1130, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1131, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1136, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1142, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1148, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1150, 11)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1004, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1044, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1046, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1051, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1107, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1111, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1119, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1140, 12)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1026, 13)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1047, 13)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1110, 13)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1114, 13)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1050, 17)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1057, 17)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1108, 17)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1109, 17)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1116, 17)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1050, 18)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1062, 18)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1046, 25)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1099, 25)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1102, 25)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1107, 25)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1119, 25)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1120, 25)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1054, 27)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1113, 27)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1114, 27)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1121, 27)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1029, 28)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1084, 28)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1133, 28)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1010, 31)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1016, 31)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1019, 31)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1020, 31)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1065, 31)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1128, 31)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1144, 31)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1065, 32)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1032, 33)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1056, 33)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1133, 33)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1021, 35)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1028, 35)
GO
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1134, 35)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1135, 35)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1136, 35)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1137, 35)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1045, 41)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1098, 41)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1058, 42)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1031, 43)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1080, 43)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1081, 43)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1084, 43)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1085, 43)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1149, 43)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1015, 44)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1023, 44)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1092, 44)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1093, 44)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1103, 44)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1010, 45)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1071, 45)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1072, 45)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1134, 45)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1135, 45)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1011, 46)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1069, 46)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1100, 46)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1004, 49)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1076, 49)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1118, 49)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1143, 49)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1022, 50)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1041, 50)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1142, 50)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1010, 51)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1065, 51)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1090, 51)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1091, 51)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1108, 51)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1126, 51)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1015, 55)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1029, 55)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1059, 55)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1080, 55)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1081, 55)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1082, 55)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1103, 55)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1011, 56)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1115, 56)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1032, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1033, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1063, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1083, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1090, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1093, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1096, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1108, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1126, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1127, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1145, 57)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1015, 60)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1048, 60)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1023, 67)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1026, 67)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1076, 67)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1028, 68)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1085, 68)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1129, 68)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1019, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1051, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1072, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1073, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1112, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1117, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1125, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1137, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1147, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1149, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1150, 69)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1009, 70)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1101, 70)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1129, 70)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1152, 70)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1004, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1036, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1037, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1060, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1088, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1132, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1143, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1151, 72)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1006, 73)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1059, 73)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1033, 74)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1083, 74)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1039, 75)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1053, 75)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1089, 75)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1028, 77)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1040, 77)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1097, 77)
GO
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1045, 78)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1047, 78)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1102, 78)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1009, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1012, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1013, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1055, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1069, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1070, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1100, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1101, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1115, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1152, 79)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1034, 80)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1035, 80)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1087, 80)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1094, 80)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1097, 80)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1125, 80)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1016, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1040, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1052, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1054, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1094, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1109, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1127, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1128, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1139, 81)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1005, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1023, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1025, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1044, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1046, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1076, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1099, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1112, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1120, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1130, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1131, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1140, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1141, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1144, 82)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1008, 83)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1068, 83)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1105, 83)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1036, 84)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1037, 84)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1039, 84)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1088, 84)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1132, 84)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1143, 84)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1151, 84)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 85)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1082, 85)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1002, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1003, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1006, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1048, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1050, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1062, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1066, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1067, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1068, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1079, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1086, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1092, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1093, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1095, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1096, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1103, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1104, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1105, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1123, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1124, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1138, 87)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1034, 91)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1086, 91)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1087, 91)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1020, 92)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1043, 92)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1139, 92)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1018, 93)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1031, 93)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1071, 93)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1111, 93)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1134, 93)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1148, 93)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1150, 93)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1002, 94)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1066, 94)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1067, 94)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1123, 94)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1124, 94)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1146, 94)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1014, 97)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1070, 97)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1052, 98)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1111, 98)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1113, 98)
GO
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1114, 98)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1121, 98)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1122, 98)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1038, 99)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1053, 99)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1089, 99)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1113, 99)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1121, 99)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1122, 99)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1018, 100)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1027, 100)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1031, 100)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1086, 100)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1123, 100)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1021, 101)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1061, 101)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1125, 101)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1135, 101)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1137, 101)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1147, 101)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 102)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1036, 102)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1039, 102)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1088, 102)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1089, 102)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1151, 102)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1038, 103)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1042, 103)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1054, 103)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1146, 103)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1012, 104)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1069, 104)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1012, 107)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1013, 107)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1053, 107)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1063, 108)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1145, 108)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1019, 109)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1090, 109)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1126, 109)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1127, 109)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1139, 109)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1005, 110)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1066, 110)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1104, 110)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1106, 110)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1124, 110)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1144, 110)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1053, 111)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1058, 111)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1117, 111)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1003, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1034, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1035, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1048, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1062, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1087, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1110, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1138, 112)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1003, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1025, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1035, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1044, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1107, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1118, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1119, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1120, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1138, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1141, 113)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1002, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1005, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1006, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1008, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1049, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1067, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1068, 114)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1049, 116)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1106, 116)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1021, 118)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1061, 118)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1072, 118)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1073, 118)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1112, 118)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1131, 118)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1047, 119)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1051, 119)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1056, 119)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 120)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1014, 120)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1017, 120)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1018, 120)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1061, 120)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1147, 120)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1149, 120)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1014, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1020, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1025, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1030, 121)
GO
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1033, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1037, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1102, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1146, 121)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1017, 122)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1060, 122)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1073, 122)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1022, 125)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1026, 125)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1041, 125)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1049, 125)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1079, 125)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1106, 125)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1022, 126)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1052, 126)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1117, 126)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1122, 126)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1030, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1038, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1040, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1043, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1063, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1091, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1094, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1097, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1109, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1128, 127)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1009, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1011, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1013, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1055, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1070, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1101, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1129, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1152, 128)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1007, 129)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1008, 129)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1098, 129)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1099, 129)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1104, 129)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1105, 129)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1058, 132)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1118, 132)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1130, 132)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1140, 132)
INSERT [dbo].[PokemonSpecialMove] ([CharacterId], [MoveId]) VALUES (1141, 132)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1004, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1024, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1029, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1030, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1032, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1033, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1038, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1043, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1045, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1046, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1047, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1059, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1080, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1081, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1082, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1083, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1084, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1085, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1102, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1110, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1133, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1146, 20)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1009, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1011, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1012, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1013, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1055, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1069, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1070, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1100, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1101, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1115, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1129, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1152, 21)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1010, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1016, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1017, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1019, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1027, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1028, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1041, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1051, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1056, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1057, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1061, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1064, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1065, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1071, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1072, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1073, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1111, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1112, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1116, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1117, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1125, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1130, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1131, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1134, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1135, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1136, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1137, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1142, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1147, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1148, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1149, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1150, 22)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1036, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1037, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1039, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1060, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1088, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1089, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1132, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1143, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1151, 23)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1002, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1005, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1006, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1008, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1049, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1066, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1067, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1068, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1104, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1105, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1106, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1123, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1124, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1144, 24)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1021, 25)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1058, 25)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1061, 25)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1135, 25)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1137, 25)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1052, 26)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1053, 26)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1054, 26)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1113, 26)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1114, 26)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1117, 26)
GO
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1121, 26)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1122, 26)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1003, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1006, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1008, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1015, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1023, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1027, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1034, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1035, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1048, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1050, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1062, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1066, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1067, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1068, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1077, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1078, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1079, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1086, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1087, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1092, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1093, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1094, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1095, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1096, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1097, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1103, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1104, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1105, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1107, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1123, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1124, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1125, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1138, 27)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1040, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1042, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1063, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1090, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1091, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1094, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1097, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1108, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1109, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1126, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1127, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1128, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1139, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1145, 28)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1009, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1014, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1015, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1020, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1021, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1026, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1029, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1036, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1059, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1070, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1076, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1080, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1081, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1082, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1084, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1085, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1103, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1133, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1149, 29)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1005, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1007, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1025, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1044, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1051, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1058, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1118, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1119, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1120, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1130, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1131, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1140, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1141, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1144, 30)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1022, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1023, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1026, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1049, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1074, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1075, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1076, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1077, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1078, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1079, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1106, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1107, 31)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1010, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1016, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1019, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1020, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1040, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1042, 32)
GO
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1065, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1126, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1127, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1128, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1139, 32)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1035, 33)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1048, 33)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1138, 33)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1014, 34)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1018, 34)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1031, 34)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1060, 36)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1132, 36)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1044, 37)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1045, 37)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1098, 37)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1099, 37)
INSERT [dbo].[Type] ([CharacterId], [TypeId]) VALUES (1102, 37)
SET IDENTITY_INSERT [dbo].[WikiImages] ON 

INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (33, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'001 - Bulbasaur', 475, N'png', N'image/png', N'001Bulbasaur', 203385, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134370/Pokemons/Avatars/001Bulbasaur.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (34, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'002 - Ivysaur', 475, N'png', N'image/png', N'002Ivysaur', 202759, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134387/Pokemons/Avatars/002Ivysaur.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (35, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'003 - Venusaur', 475, N'png', N'image/png', N'003Venusaur', 186011, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134391/Pokemons/Avatars/003Venusaur.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (36, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'004 - Charmander', 475, N'png', N'image/png', N'004Charmander', 137817, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134390/Pokemons/Avatars/004Charmander.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (37, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'005 - Charmeleon', 475, N'png', N'image/png', N'005Charmeleon', 130334, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134390/Pokemons/Avatars/005Charmeleon.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (38, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'006 - Charizard', 475, N'png', N'image/png', N'006Charizard', 144568, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134391/Pokemons/Avatars/006Charizard.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (39, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'007 - Squirtle', 475, N'png', N'image/png', N'007Squirtle', 155045, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134391/Pokemons/Avatars/007Squirtle.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (40, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'008 - Wartortle', 475, N'png', N'image/png', N'008Wartortle', 179754, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134392/Pokemons/Avatars/008Wartortle.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (41, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'009 - Blastoise', 475, N'png', N'image/png', N'009Blastoise', 197853, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134395/Pokemons/Avatars/009Blastoise.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (42, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'010 - Caterpie', 475, N'png', N'image/png', N'010Caterpie', 174430, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134395/Pokemons/Avatars/010Caterpie.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (43, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'011 - Metapod', 475, N'png', N'image/png', N'011Metapod', 118885, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134393/Pokemons/Avatars/011Metapod.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (44, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'012 - Butterfree', 475, N'png', N'image/png', N'012Butterfree', 183600, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134398/Pokemons/Avatars/012Butterfree.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (45, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'013 - Weedle', 475, N'png', N'image/png', N'013Weedle', 108372, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134394/Pokemons/Avatars/013Weedle.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (46, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'014 - Kakuna', 475, N'png', N'image/png', N'014Kakuna', 126542, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134396/Pokemons/Avatars/014Kakuna.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (47, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'015 - Beedrill', 475, N'png', N'image/png', N'015Beedrill', 146566, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134398/Pokemons/Avatars/015Beedrill.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (49, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'017 - Pidgeotto', 475, N'png', N'image/png', N'017Pidgeotto', 158875, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134400/Pokemons/Avatars/017Pidgeotto.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (50, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'016 - Pidgey', 475, N'png', N'image/png', N'016Pidgey', 145917, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134399/Pokemons/Avatars/016Pidgey.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (51, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'019 - Rattata', 475, N'png', N'image/png', N'019Rattata', 125067, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134403/Pokemons/Avatars/019Rattata.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (52, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'018 - Pidgeot', 475, N'png', N'image/png', N'018Pidgeot', 147161, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134401/Pokemons/Avatars/018Pidgeot.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (53, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'020 - Raticate', 475, N'png', N'image/png', N'020Raticate', 154497, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134401/Pokemons/Avatars/020Raticate.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (54, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'021 - Spearow', 475, N'png', N'image/png', N'021Spearow', 144705, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134402/Pokemons/Avatars/021Spearow.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (55, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'023 - Ekans', 475, N'png', N'image/png', N'023Ekans', 191869, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134404/Pokemons/Avatars/023Ekans.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (56, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'022 - Fearow', 475, N'png', N'image/png', N'022Fearow', 149452, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134403/Pokemons/Avatars/022Fearow.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (57, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'025 - Pikachu', 475, N'png', N'image/png', N'025Pikachu', 118057, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134415/Pokemons/Avatars/025Pikachu.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (58, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'024 - Arbok', 475, N'png', N'image/png', N'024Arbok', 181492, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134404/Pokemons/Avatars/024Arbok.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (59, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'026 - Raichu', 475, N'png', N'image/png', N'026Raichu', 94288, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134415/Pokemons/Avatars/026Raichu.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (60, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'027 - Sandshrew', 475, N'png', N'image/png', N'027Sandshrew', 173758, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134404/Pokemons/Avatars/027Sandshrew.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (61, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'028 - Sandslash', 475, N'png', N'image/png', N'028Sandslash', 148038, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134405/Pokemons/Avatars/028Sandslash.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (62, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'029 - NidoranFemale', 475, N'png', N'image/png', N'029NidoranFemale', 178682, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134408/Pokemons/Avatars/029NidoranFemale.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (63, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'030 - Nidorina', 475, N'png', N'image/png', N'030Nidorina', 143213, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134407/Pokemons/Avatars/030Nidorina.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (64, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'031 - Nidoqueen', 475, N'png', N'image/png', N'031Nidoqueen', 186330, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134407/Pokemons/Avatars/031Nidoqueen.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (65, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'032 - NidoranMale', 475, N'png', N'image/png', N'032NidoranMale', 167589, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134408/Pokemons/Avatars/032NidoranMale.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (66, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'033 - Nidorino', 475, N'png', N'image/png', N'033Nidorino', 156769, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134407/Pokemons/Avatars/033Nidorino.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (67, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'035 - Clefairy', 475, N'png', N'image/png', N'035Clefairy', 175738, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134411/Pokemons/Avatars/035Clefairy.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (68, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'034 - Nidoking', 475, N'png', N'image/png', N'034Nidoking', 150283, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134411/Pokemons/Avatars/034Nidoking.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (69, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'036 - Clefable', 475, N'png', N'image/png', N'036Clefable', 157629, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134412/Pokemons/Avatars/036Clefable.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (70, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'037 - Vulpix', 475, N'png', N'image/png', N'037Vulpix', 157357, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134413/Pokemons/Avatars/037Vulpix.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (71, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'038 - Ninetales', 475, N'png', N'image/png', N'038Ninetales', 184128, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134414/Pokemons/Avatars/038Ninetales.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (72, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'040 - Wigglytuff', 475, N'png', N'image/png', N'040Wigglytuff', 133899, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134417/Pokemons/Avatars/040Wigglytuff.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (73, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'039 - Jigglypuff', 475, N'png', N'image/png', N'039Jigglypuff', 147602, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134415/Pokemons/Avatars/039Jigglypuff.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (74, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'042 - Golbat', 475, N'png', N'image/png', N'042Golbat', 117478, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134417/Pokemons/Avatars/042Golbat.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (75, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'041 - Zubat', 475, N'png', N'image/png', N'041Zubat', 107570, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134416/Pokemons/Avatars/041Zubat.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (76, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'044 - Gloom', 475, N'png', N'image/png', N'044Gloom', 155247, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134418/Pokemons/Avatars/044Gloom.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (77, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'043 - Oddish', 475, N'png', N'image/png', N'043Oddish', 134223, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134417/Pokemons/Avatars/043Oddish.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (78, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'045 - Vileplume', 475, N'png', N'image/png', N'045Vileplume', 155232, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134420/Pokemons/Avatars/045Vileplume.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (79, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'046 - Paras', 475, N'png', N'image/png', N'046Paras', 149527, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134421/Pokemons/Avatars/046Paras.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (80, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'047 - Parasect', 475, N'png', N'image/png', N'047Parasect', 152882, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134419/Pokemons/Avatars/047Parasect.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (81, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'048 - Venonat', 475, N'png', N'image/png', N'048Venonat', 142257, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134421/Pokemons/Avatars/048Venonat.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (82, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'050 - Diglett', 475, N'png', N'image/png', N'050Diglett', 163664, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134421/Pokemons/Avatars/050Diglett.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (83, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'049 - Venomoth', 475, N'png', N'image/png', N'049Venomoth', 117073, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134421/Pokemons/Avatars/049Venomoth.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (84, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'051 - Dugtrio', 475, N'png', N'image/png', N'051Dugtrio', 154558, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134421/Pokemons/Avatars/051Dugtrio.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (85, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'052 - Meowth', 475, N'png', N'image/png', N'052Meowth', 115809, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134422/Pokemons/Avatars/052Meowth.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (86, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'053 - Persian', 475, N'png', N'image/png', N'053Persian', 118816, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134424/Pokemons/Avatars/053Persian.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (88, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'054 - Psyduck', 475, N'png', N'image/png', N'054Psyduck', 117239, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134423/Pokemons/Avatars/054Psyduck.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (89, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'055 - Golduck', 475, N'png', N'image/png', N'055Golduck', 128809, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134426/Pokemons/Avatars/055Golduck.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (90, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'056 - Mankey', 475, N'png', N'image/png', N'056Mankey', 101437, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134423/Pokemons/Avatars/056Mankey.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (91, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'057 - Primeape', 475, N'png', N'image/png', N'057Primeape', 161289, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134425/Pokemons/Avatars/057Primeape.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (92, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'058 - Growlithe', 475, N'png', N'image/png', N'058Growlithe', 151687, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134424/Pokemons/Avatars/058Growlithe.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (93, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'059 - Arcanine', 475, N'png', N'image/png', N'059Arcanine', 197883, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134427/Pokemons/Avatars/059Arcanine.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (94, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'060 - Poliwag', 475, N'png', N'image/png', N'060Poliwag', 133801, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134428/Pokemons/Avatars/060Poliwag.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (95, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'061 - Poliwhirl', 475, N'png', N'image/png', N'061Poliwhirl', 150225, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134427/Pokemons/Avatars/061Poliwhirl.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (96, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'062 - Poliwrath', 475, N'png', N'image/png', N'062Poliwrath', 115518, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134426/Pokemons/Avatars/062Poliwrath.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (97, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'063 - Abra', 475, N'png', N'image/png', N'063Abra', 116699, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134430/Pokemons/Avatars/063Abra.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (98, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'064 - Kadabra', 475, N'png', N'image/png', N'064Kadabra', 166555, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134428/Pokemons/Avatars/064Kadabra.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (99, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'066 - Machop', 475, N'png', N'image/png', N'066Machop', 132188, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134430/Pokemons/Avatars/066Machop.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (100, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'065 - Alakazam', 475, N'png', N'image/png', N'065Alakazam', 162890, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134428/Pokemons/Avatars/065Alakazam.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (101, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'067 - Machoke', 475, N'png', N'image/png', N'067Machoke', 169060, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134430/Pokemons/Avatars/067Machoke.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (102, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'068 - Machamp', 475, N'png', N'image/png', N'068Machamp', 151393, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134430/Pokemons/Avatars/068Machamp.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (103, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'070 - Weepinbell', 475, N'png', N'image/png', N'070Weepinbell', 118882, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134433/Pokemons/Avatars/070Weepinbell.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (104, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'069 - Bellsprout', 475, N'png', N'image/png', N'069Bellsprout', 99010, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134430/Pokemons/Avatars/069Bellsprout.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (105, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'072 - Tentacool', 475, N'png', N'image/png', N'072Tentacool', 115945, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134433/Pokemons/Avatars/072Tentacool.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (106, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'071 - Victreebel', 475, N'png', N'image/png', N'071Victreebel', 140003, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134433/Pokemons/Avatars/071Victreebel.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (107, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'073 - Tentacruel', 475, N'png', N'image/png', N'073Tentacruel', 156862, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134435/Pokemons/Avatars/073Tentacruel.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (108, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'074 - Geodude', 475, N'png', N'image/png', N'074Geodude', 76553, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134431/Pokemons/Avatars/074Geodude.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (109, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'075 - Graveler', 475, N'png', N'image/png', N'075Graveler', 101284, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134433/Pokemons/Avatars/075Graveler.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (110, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'076 - Golem', 475, N'png', N'image/png', N'076Golem', 179897, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134438/Pokemons/Avatars/076Golem.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (111, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'078 - Rapidash', 475, N'png', N'image/png', N'078Rapidash', 172853, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134437/Pokemons/Avatars/078Rapidash.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (112, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'077 - Ponyta', 475, N'png', N'image/png', N'077Ponyta', 125214, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134433/Pokemons/Avatars/077Ponyta.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (113, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'079 - Slowpoke', 475, N'png', N'image/png', N'079Slowpoke', 126460, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134438/Pokemons/Avatars/079Slowpoke.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (114, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'080 - Slowbro', 475, N'png', N'image/png', N'080Slowbro', 185275, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134440/Pokemons/Avatars/080Slowbro.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (115, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'082 - Magneton', 475, N'png', N'image/png', N'082Magneton', 166284, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134438/Pokemons/Avatars/082Magneton.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (116, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'081 - Magnemite', 475, N'png', N'image/png', N'081Magnemite', 96595, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134435/Pokemons/Avatars/081Magnemite.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (117, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'084 - Doduo', 475, N'png', N'image/png', N'084Doduo', 79909, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134439/Pokemons/Avatars/084Doduo.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (118, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'083 - Farfetchd', 475, N'png', N'image/png', N'083Farfetchd', 141176, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134439/Pokemons/Avatars/083Farfetchd.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (119, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'150 - Mewtwo', 475, N'png', N'image/png', N'150Mewtwo', 119320, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134480/Pokemons/Avatars/150Mewtwo.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (121, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'151 - Mew', 475, N'png', N'image/png', N'151Mew', 133175, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134481/Pokemons/Avatars/151Mew.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (122, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'148 - Dragonair', 475, N'png', N'image/png', N'148Dragonair', 103226, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134480/Pokemons/Avatars/148Dragonair.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (123, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'149 - Dragonite', 475, N'png', N'image/png', N'149Dragonite', 132064, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134480/Pokemons/Avatars/149Dragonite.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (124, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'147 - Dratini', 475, N'png', N'image/png', N'147Dratini', 102258, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134477/Pokemons/Avatars/147Dratini.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (125, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'146 - Moltres', 475, N'png', N'image/png', N'146Moltres', 94816, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134478/Pokemons/Avatars/146Moltres.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (126, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'145 - Zapdos', 475, N'png', N'image/png', N'145Zapdos', 110704, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134478/Pokemons/Avatars/145Zapdos.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (127, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'144 - Articuno', 475, N'png', N'image/png', N'144Articuno', 160360, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134478/Pokemons/Avatars/144Articuno.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (128, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'142 - Aerodactyl', 475, N'png', N'image/png', N'142Aerodactyl', 81716, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134474/Pokemons/Avatars/142Aerodactyl.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (129, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'143 - Snorlax', 475, N'png', N'image/png', N'143Snorlax', 139225, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134478/Pokemons/Avatars/143Snorlax.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (130, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'140 - Kabuto', 475, N'png', N'image/png', N'140Kabuto', 155463, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134479/Pokemons/Avatars/140Kabuto.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (131, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'141 - Kabutops', 475, N'png', N'image/png', N'141Kabutops', 136055, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134477/Pokemons/Avatars/141Kabutops.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (132, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'138 - Omanyte', 475, N'png', N'image/png', N'138Omanyte', 173927, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134473/Pokemons/Avatars/138Omanyte.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (133, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'139 - Omastar', 475, N'png', N'image/png', N'139Omastar', 160396, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134474/Pokemons/Avatars/139Omastar.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (134, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'137 - Porygon', 475, N'png', N'image/png', N'137Porygon', 153642, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134473/Pokemons/Avatars/137Porygon.png')
GO
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (135, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'136 - Flareon', 475, N'png', N'image/png', N'136Flareon', 149971, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134474/Pokemons/Avatars/136Flareon.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (136, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'134 - Vaporeon', 475, N'png', N'image/png', N'134Vaporeon', 157955, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134472/Pokemons/Avatars/134Vaporeon.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (137, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'135 - Jolteon', 475, N'png', N'image/png', N'135Jolteon', 141908, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134470/Pokemons/Avatars/135Jolteon.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (138, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'133 - Eevee', 475, N'png', N'image/png', N'133Eevee', 142266, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134470/Pokemons/Avatars/133Eevee.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (139, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'132 - Ditto', 475, N'png', N'image/png', N'132Ditto', 129274, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134469/Pokemons/Avatars/132Ditto.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (140, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'130 - Gyarados', 475, N'png', N'image/png', N'130Gyarados', 146784, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134469/Pokemons/Avatars/130Gyarados.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (141, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'131 - Lapras', 475, N'png', N'image/png', N'131Lapras', 135952, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134468/Pokemons/Avatars/131Lapras.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (142, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'129 - Magikarp', 475, N'png', N'image/png', N'129Magikarp', 136990, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134467/Pokemons/Avatars/129Magikarp.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (143, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'128 - Tauros', 475, N'png', N'image/png', N'128Tauros', 129530, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134469/Pokemons/Avatars/128Tauros.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (144, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'127 - Pinsir', 475, N'png', N'image/png', N'127Pinsir', 142435, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134466/Pokemons/Avatars/127Pinsir.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (145, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'126 - Magmar', 475, N'png', N'image/png', N'126Magmar', 159154, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134466/Pokemons/Avatars/126Magmar.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (146, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'124 - Jynx', 475, N'png', N'image/png', N'124Jynx', 156134, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134463/Pokemons/Avatars/124Jynx.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (147, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'125 - Electabuzz', 475, N'png', N'image/png', N'125Electabuzz', 134434, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134465/Pokemons/Avatars/125Electabuzz.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (148, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'122 - MrMime', 475, N'png', N'image/png', N'122MrMime', 160464, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134468/Pokemons/Avatars/122MrMime.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (149, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'123 - Scyther', 475, N'png', N'image/png', N'123Scyther', 131534, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134465/Pokemons/Avatars/123Scyther.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (150, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'120 - Staryu', 475, N'png', N'image/png', N'120Staryu', 157316, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134465/Pokemons/Avatars/120Staryu.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (151, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'121 - Starmie', 475, N'png', N'image/png', N'121Starmie', 198724, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134463/Pokemons/Avatars/121Starmie.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (152, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'119 - Seaking', 475, N'png', N'image/png', N'119Seaking', 174542, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134459/Pokemons/Avatars/119Seaking.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (154, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'118 - Goldeen', 475, N'png', N'image/png', N'118Goldeen', 104649, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134458/Pokemons/Avatars/118Goldeen.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (155, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'117 - Seadra', 475, N'png', N'image/png', N'117Seadra', 127820, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134459/Pokemons/Avatars/117Seadra.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (156, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'116 - Horsea', 475, N'png', N'image/png', N'116Horsea', 140766, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134458/Pokemons/Avatars/116Horsea.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (157, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'115 - Kangaskhan', 475, N'png', N'image/png', N'115Kangaskhan', 183110, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134460/Pokemons/Avatars/115Kangaskhan.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (158, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'114 - Tangela', 475, N'png', N'image/png', N'114Tangela', 221832, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134463/Pokemons/Avatars/114Tangela.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (159, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'113 - Chansey', 475, N'png', N'image/png', N'113Chansey', 153542, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134457/Pokemons/Avatars/113Chansey.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (160, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'112 - Rhydon', 475, N'png', N'image/png', N'112Rhydon', 137603, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134458/Pokemons/Avatars/112Rhydon.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (161, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'110 - Weezing', 475, N'png', N'image/png', N'110Weezing', 148228, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134458/Pokemons/Avatars/110Weezing.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (162, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'111 - Rhyhorn', 475, N'png', N'image/png', N'111Rhyhorn', 184215, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134456/Pokemons/Avatars/111Rhyhorn.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (163, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'109 - Koffing', 475, N'png', N'image/png', N'109Koffing', 153356, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134454/Pokemons/Avatars/109Koffing.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (164, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'108 - Lickitung', 475, N'png', N'image/png', N'108Lickitung', 187105, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134454/Pokemons/Avatars/108Lickitung.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (165, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'106 - Hitmonlee', 475, N'png', N'image/png', N'106Hitmonlee', 96141, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134453/Pokemons/Avatars/106Hitmonlee.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (166, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'107 - Hitmonchan', 475, N'png', N'image/png', N'107Hitmonchan', 109569, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134454/Pokemons/Avatars/107Hitmonchan.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (167, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'104 - Cubone', 475, N'png', N'image/png', N'104Cubone', 156699, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134452/Pokemons/Avatars/104Cubone.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (168, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'105 - Marowak', 475, N'png', N'image/png', N'105Marowak', 133817, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134455/Pokemons/Avatars/105Marowak.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (169, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'102 - Exeggcute', 475, N'png', N'image/png', N'102Exeggcute', 155189, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/102Exeggcute.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (170, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'103 - Exeggutor', 475, N'png', N'image/png', N'103Exeggutor', 170023, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/103Exeggutor.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (171, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'100 - Voltorb', 475, N'png', N'image/png', N'100Voltorb', 181951, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134451/Pokemons/Avatars/100Voltorb.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (172, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'101 - Electrode', 475, N'png', N'image/png', N'101Electrode', 190651, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134450/Pokemons/Avatars/101Electrode.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (173, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'098 - Krabby', 475, N'png', N'image/png', N'098Krabby', 118530, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134447/Pokemons/Avatars/098Krabby.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (174, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'099 - Kingler', 475, N'png', N'image/png', N'099Kingler', 113561, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134448/Pokemons/Avatars/099Kingler.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (175, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'096 - Drowzee', 475, N'png', N'image/png', N'096Drowzee', 135367, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134445/Pokemons/Avatars/096Drowzee.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (176, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'097 - Hypno', 475, N'png', N'image/png', N'097Hypno', 152976, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134450/Pokemons/Avatars/097Hypno.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (177, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'086 - Seel', 475, N'png', N'image/png', N'086Seel', 130146, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134441/Pokemons/Avatars/086Seel.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (178, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'085 - Dodrio', 475, N'png', N'image/png', N'085Dodrio', 119581, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134440/Pokemons/Avatars/085Dodrio.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (180, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'087 - Dewgong', 475, N'png', N'image/png', N'087Dewgong', 149652, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134443/Pokemons/Avatars/087Dewgong.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (181, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'089 - Muk', 475, N'png', N'image/png', N'089Muk', 87396, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134441/Pokemons/Avatars/089Muk.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (182, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'088 - Grimer', 475, N'png', N'image/png', N'088Grimer', 122585, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134442/Pokemons/Avatars/088Grimer.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (183, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'091 - Cloyster', 475, N'png', N'image/png', N'091Cloyster', 174248, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134444/Pokemons/Avatars/091Cloyster.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (184, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'093 - Haunter', 475, N'png', N'image/png', N'093Haunter', 105214, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134443/Pokemons/Avatars/093Haunter.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (185, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'092 - Gastly', 475, N'png', N'image/png', N'092Gastly', 176993, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134443/Pokemons/Avatars/092Gastly.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (186, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'095 - Onix', 475, N'png', N'image/png', N'095Onix', 159278, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134447/Pokemons/Avatars/095Onix.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (187, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'090 - Shellder', 475, N'png', N'image/png', N'090Shellder', 174248, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134445/Pokemons/Avatars/090Shellder.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (188, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'094 - Gengar', 475, N'png', N'image/png', N'094Gengar', 105214, 475, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475134445/Pokemons/Avatars/094Gengar.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (189, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'1 - Bug', 401, N'png', N'image/png', N'Bug', 123535, 1025, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135026/Pokemons/Types/en/Bug.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (190, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'2 - Dark', 409, N'png', N'image/png', N'Dark', 127647, 1112, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135027/Pokemons/Types/en/Dark.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (191, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'3 - Dragon', 409, N'png', N'image/png', N'Dragon', 125176, 1363, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135028/Pokemons/Types/en/Dragon.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (192, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'5 - Fairy', 409, N'png', N'image/png', N'Fairy', 118900, 1142, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135028/Pokemons/Types/en/Fairy.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (193, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'4 - Electric', 409, N'png', N'image/png', N'Electric', 113367, 1459, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135030/Pokemons/Types/en/Electric.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (194, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'7 - Fire', 408, N'png', N'image/png', N'Fire', 108127, 1008, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135030/Pokemons/Types/en/Fire.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (195, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'6 - Fighting', 409, N'png', N'image/png', N'Fighting', 104988, 1463, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135028/Pokemons/Types/en/Fighting.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (196, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'9 - Ghost', 409, N'png', N'image/png', N'Ghost', 126033, 1274, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135033/Pokemons/Types/en/Ghost.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (197, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'8 - Flying', 409, N'png', N'image/png', N'Flying', 123215, 1293, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135030/Pokemons/Types/en/Flying.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (198, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'11 - Ground', 409, N'png', N'image/png', N'Ground', 122108, 1388, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135033/Pokemons/Types/en/Ground.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (199, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'10 - Grass', 409, N'png', N'image/png', N'Grass', 128887, 1195, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135035/Pokemons/Types/en/Grass.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (200, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'13 - Normal', 408, N'png', N'image/png', N'Normal', 131011, 1416, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135036/Pokemons/Types/en/Normal.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (201, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'12 - Ice', 411, N'png', N'image/png', N'Ice', 117026, 916, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135035/Pokemons/Types/en/Ice.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (202, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'14 - Poison', 409, N'png', N'image/png', N'Poison', 126450, 1322, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135035/Pokemons/Types/en/Poison.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (203, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'15 - Psychic', 409, N'png', N'image/png', N'Psychic', 120625, 1388, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135036/Pokemons/Types/en/Psychic.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (204, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'16 - Rock', 409, N'png', N'image/png', N'Rock', 129722, 1133, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135037/Pokemons/Types/en/Rock.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (205, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'17 - Steel', 410, N'png', N'image/png', N'Steel', 104163, 1141, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135037/Pokemons/Types/en/Steel.png')
INSERT [dbo].[WikiImages] ([Id], [BitDepth], [CreatedDate], [CreatedUserId], [ImageDescription], [ImageHeight], [ImageMediaType], [ImageMime], [ImageName], [ImageSize], [ImageWidth], [UpdatedDate], [UpdatedUserId], [ImageUrl]) VALUES (206, 24, CAST(N'2016-09-25T00:00:00.0000000' AS DateTime2), NULL, N'18 - Water', 408, N'png', N'image/png', N'Water', 127197, 1251, NULL, NULL, N'http://res.cloudinary.com/ewiki-io/image/upload/v1475135029/Pokemons/Types/en/Water.png')
SET IDENTITY_INSERT [dbo].[WikiImages] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_UserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BlockedIps_BlockByUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlockedIps_BlockByUserId] ON [dbo].[BlockedIps]
(
	[BlockByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlockedIps_BlockedIpId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlockedIps_BlockedIpId] ON [dbo].[BlockedIps]
(
	[BlockedIpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BlockedIps_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlockedIps_CreatedUserId] ON [dbo].[BlockedIps]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BlockedIps_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlockedIps_UpdatedUserId] ON [dbo].[BlockedIps]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_BlockedIps_UserBlockedId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlockedIps_UserBlockedId] ON [dbo].[BlockedIps]
(
	[UserBlockedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_CatImageId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_CatImageId] ON [dbo].[Categories]
(
	[CatImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Categories_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_CreatedUserId] ON [dbo].[Categories]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Categories_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_UpdatedUserId] ON [dbo].[Categories]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterInfoGroups_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterInfoGroups_CreatedUserId] ON [dbo].[CharacterInfoGroups]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterInfoGroups_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterInfoGroups_UpdatedUserId] ON [dbo].[CharacterInfoGroups]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CharacterInfos_CharacterInfoGroupId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterInfos_CharacterInfoGroupId] ON [dbo].[CharacterInfos]
(
	[CharacterInfoGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterInfos_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterInfos_CreatedUserId] ON [dbo].[CharacterInfos]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterInfos_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterInfos_UpdatedUserId] ON [dbo].[CharacterInfos]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Characters_AvatarImageId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Characters_AvatarImageId] ON [dbo].[Characters]
(
	[AvatarImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Characters_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Characters_CreatedUserId] ON [dbo].[Characters]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Characters_EvolveFromId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Characters_EvolveFromId] ON [dbo].[Characters]
(
	[EvolveFromId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Characters_InfoContentId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Characters_InfoContentId] ON [dbo].[Characters]
(
	[InfoContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Characters_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Characters_UpdatedUserId] ON [dbo].[Characters]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterSectionGroups_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterSectionGroups_CreatedUserId] ON [dbo].[CharacterSectionGroups]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterSectionGroups_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterSectionGroups_UpdatedUserId] ON [dbo].[CharacterSectionGroups]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CharacterSections_CharacterId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterSections_CharacterId] ON [dbo].[CharacterSections]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CharacterSections_CharacterSectionGroupId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterSections_CharacterSectionGroupId] ON [dbo].[CharacterSections]
(
	[CharacterSectionGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterSections_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterSections_CreatedUserId] ON [dbo].[CharacterSections]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CharacterSections_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterSections_UpdatedUserId] ON [dbo].[CharacterSections]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InfoValues_CharacterInfoId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_InfoValues_CharacterInfoId] ON [dbo].[InfoValues]
(
	[CharacterInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_InfoValues_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_InfoValues_CreatedUserId] ON [dbo].[InfoValues]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_InfoValues_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_InfoValues_UpdatedUserId] ON [dbo].[InfoValues]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Locations_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Locations_CreatedUserId] ON [dbo].[Locations]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Locations_LocationType]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Locations_LocationType] ON [dbo].[Locations]
(
	[LocationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Locations_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Locations_UpdatedUserId] ON [dbo].[Locations]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Moves_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Moves_CreatedUserId] ON [dbo].[Moves]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Moves_MoveCategoryId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Moves_MoveCategoryId] ON [dbo].[Moves]
(
	[MoveCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Moves_MoveType]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Moves_MoveType] ON [dbo].[Moves]
(
	[MoveType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Moves_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Moves_UpdatedUserId] ON [dbo].[Moves]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageContents_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageContents_CreatedUserId] ON [dbo].[PageContents]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageContents_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageContents_UpdatedUserId] ON [dbo].[PageContents]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageLangs_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageLangs_CreatedUserId] ON [dbo].[PageLangs]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageLangs_PageId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageLangs_PageId] ON [dbo].[PageLangs]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageLangs_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageLangs_UpdatedUserId] ON [dbo].[PageLangs]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageMetas_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageMetas_CreatedUserId] ON [dbo].[PageMetas]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageMetas_PageId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageMetas_PageId] ON [dbo].[PageMetas]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageMetas_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageMetas_UpdatedUserId] ON [dbo].[PageMetas]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageRestrictions_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageRestrictions_CreatedUserId] ON [dbo].[PageRestrictions]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageRestrictions_PageId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageRestrictions_PageId] ON [dbo].[PageRestrictions]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PageRestrictions_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PageRestrictions_UpdatedUserId] ON [dbo].[PageRestrictions]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Pages_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pages_CreatedUserId] ON [dbo].[Pages]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pages_FeatureImageId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pages_FeatureImageId] ON [dbo].[Pages]
(
	[FeatureImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pages_NewestContent]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pages_NewestContent] ON [dbo].[Pages]
(
	[NewestContent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pages_TagId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pages_TagId] ON [dbo].[Pages]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Pages_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Pages_UpdatedUserId] ON [dbo].[Pages]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PokemonLocation_CharacterId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PokemonLocation_CharacterId] ON [dbo].[PokemonLocation]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PokemonLocation_LocationId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PokemonLocation_LocationId] ON [dbo].[PokemonLocation]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PokemonMove_CharacterId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PokemonMove_CharacterId] ON [dbo].[PokemonMove]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PokemonMove_MoveId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PokemonMove_MoveId] ON [dbo].[PokemonMove]
(
	[MoveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PokemonSpecialMove_CharacterId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PokemonSpecialMove_CharacterId] ON [dbo].[PokemonSpecialMove]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PokemonSpecialMove_MoveId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_PokemonSpecialMove_MoveId] ON [dbo].[PokemonSpecialMove]
(
	[MoveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_References_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_References_CreatedUserId] ON [dbo].[References]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_References_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_References_UpdatedUserId] ON [dbo].[References]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tags_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tags_CreatedUserId] ON [dbo].[Tags]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tags_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Tags_UpdatedUserId] ON [dbo].[Tags]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Type_CharacterId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Type_CharacterId] ON [dbo].[Type]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Type_TypeId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_Type_TypeId] ON [dbo].[Type]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserMetas_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserMetas_CreatedUserId] ON [dbo].[UserMetas]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserMetas_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserMetas_UpdatedUserId] ON [dbo].[UserMetas]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserMetas_UserInUseId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserMetas_UserInUseId] ON [dbo].[UserMetas]
(
	[UserInUseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserNewtalks_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserNewtalks_CreatedUserId] ON [dbo].[UserNewtalks]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserNewtalks_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserNewtalks_UpdatedUserId] ON [dbo].[UserNewtalks]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserNewtalks_UserSeenId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserNewtalks_UserSeenId] ON [dbo].[UserNewtalks]
(
	[UserSeenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_WikiImages_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_WikiImages_CreatedUserId] ON [dbo].[WikiImages]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_WikiImages_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_WikiImages_UpdatedUserId] ON [dbo].[WikiImages]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_WikiVideos_CreatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_WikiVideos_CreatedUserId] ON [dbo].[WikiVideos]
(
	[CreatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_WikiVideos_UpdatedUserId]    Script Date: 10/3/2016 1:56:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_WikiVideos_UpdatedUserId] ON [dbo].[WikiVideos]
(
	[UpdatedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pages] ADD  DEFAULT ((0)) FOR [ContentObjectId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BlockedIps]  WITH CHECK ADD  CONSTRAINT [FK_BlockedIps_AspNetUsers_BlockByUserId] FOREIGN KEY([BlockByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BlockedIps] CHECK CONSTRAINT [FK_BlockedIps_AspNetUsers_BlockByUserId]
GO
ALTER TABLE [dbo].[BlockedIps]  WITH CHECK ADD  CONSTRAINT [FK_BlockedIps_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BlockedIps] CHECK CONSTRAINT [FK_BlockedIps_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[BlockedIps]  WITH CHECK ADD  CONSTRAINT [FK_BlockedIps_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BlockedIps] CHECK CONSTRAINT [FK_BlockedIps_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[BlockedIps]  WITH CHECK ADD  CONSTRAINT [FK_BlockedIps_AspNetUsers_UserBlockedId] FOREIGN KEY([UserBlockedId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BlockedIps] CHECK CONSTRAINT [FK_BlockedIps_AspNetUsers_UserBlockedId]
GO
ALTER TABLE [dbo].[BlockedIps]  WITH CHECK ADD  CONSTRAINT [FK_BlockedIps_BlockedIps_BlockedIpId] FOREIGN KEY([BlockedIpId])
REFERENCES [dbo].[BlockedIps] ([Id])
GO
ALTER TABLE [dbo].[BlockedIps] CHECK CONSTRAINT [FK_BlockedIps_BlockedIps_BlockedIpId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_WikiImages_CatImageId] FOREIGN KEY([CatImageId])
REFERENCES [dbo].[WikiImages] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_WikiImages_CatImageId]
GO
ALTER TABLE [dbo].[CharacterInfoGroups]  WITH CHECK ADD  CONSTRAINT [FK_CharacterInfoGroups_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterInfoGroups] CHECK CONSTRAINT [FK_CharacterInfoGroups_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[CharacterInfoGroups]  WITH CHECK ADD  CONSTRAINT [FK_CharacterInfoGroups_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterInfoGroups] CHECK CONSTRAINT [FK_CharacterInfoGroups_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[CharacterInfos]  WITH CHECK ADD  CONSTRAINT [FK_CharacterInfos_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterInfos] CHECK CONSTRAINT [FK_CharacterInfos_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[CharacterInfos]  WITH CHECK ADD  CONSTRAINT [FK_CharacterInfos_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterInfos] CHECK CONSTRAINT [FK_CharacterInfos_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[CharacterInfos]  WITH CHECK ADD  CONSTRAINT [FK_CharacterInfos_CharacterInfoGroups_CharacterInfoGroupId] FOREIGN KEY([CharacterInfoGroupId])
REFERENCES [dbo].[CharacterInfoGroups] ([Id])
GO
ALTER TABLE [dbo].[CharacterInfos] CHECK CONSTRAINT [FK_CharacterInfos_CharacterInfoGroups_CharacterInfoGroupId]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_Pages_InfoContentId] FOREIGN KEY([InfoContentId])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_Pages_InfoContentId]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_WikiImages_AvatarImageId] FOREIGN KEY([AvatarImageId])
REFERENCES [dbo].[WikiImages] ([Id])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_WikiImages_AvatarImageId]
GO
ALTER TABLE [dbo].[CharacterSectionGroups]  WITH CHECK ADD  CONSTRAINT [FK_CharacterSectionGroups_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterSectionGroups] CHECK CONSTRAINT [FK_CharacterSectionGroups_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[CharacterSectionGroups]  WITH CHECK ADD  CONSTRAINT [FK_CharacterSectionGroups_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterSectionGroups] CHECK CONSTRAINT [FK_CharacterSectionGroups_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[CharacterSections]  WITH CHECK ADD  CONSTRAINT [FK_CharacterSections_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterSections] CHECK CONSTRAINT [FK_CharacterSections_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[CharacterSections]  WITH CHECK ADD  CONSTRAINT [FK_CharacterSections_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CharacterSections] CHECK CONSTRAINT [FK_CharacterSections_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[CharacterSections]  WITH CHECK ADD  CONSTRAINT [FK_CharacterSections_Characters_CharacterId] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Characters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CharacterSections] CHECK CONSTRAINT [FK_CharacterSections_Characters_CharacterId]
GO
ALTER TABLE [dbo].[CharacterSections]  WITH CHECK ADD  CONSTRAINT [FK_CharacterSections_CharacterSectionGroups_CharacterSectionGroupId] FOREIGN KEY([CharacterSectionGroupId])
REFERENCES [dbo].[CharacterSectionGroups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CharacterSections] CHECK CONSTRAINT [FK_CharacterSections_CharacterSectionGroups_CharacterSectionGroupId]
GO
ALTER TABLE [dbo].[InfoValues]  WITH CHECK ADD  CONSTRAINT [FK_InfoValues_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[InfoValues] CHECK CONSTRAINT [FK_InfoValues_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[InfoValues]  WITH CHECK ADD  CONSTRAINT [FK_InfoValues_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[InfoValues] CHECK CONSTRAINT [FK_InfoValues_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[InfoValues]  WITH CHECK ADD  CONSTRAINT [FK_InfoValues_CharacterInfos_CharacterInfoId] FOREIGN KEY([CharacterInfoId])
REFERENCES [dbo].[CharacterInfos] ([Id])
GO
ALTER TABLE [dbo].[InfoValues] CHECK CONSTRAINT [FK_InfoValues_CharacterInfos_CharacterInfoId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Categories_LocationType] FOREIGN KEY([LocationType])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Categories_LocationType]
GO
ALTER TABLE [dbo].[Moves]  WITH CHECK ADD  CONSTRAINT [FK_Moves_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Moves] CHECK CONSTRAINT [FK_Moves_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[Moves]  WITH CHECK ADD  CONSTRAINT [FK_Moves_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Moves] CHECK CONSTRAINT [FK_Moves_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[Moves]  WITH CHECK ADD  CONSTRAINT [FK_Moves_Categories_MoveCategoryId] FOREIGN KEY([MoveCategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Moves] CHECK CONSTRAINT [FK_Moves_Categories_MoveCategoryId]
GO
ALTER TABLE [dbo].[Moves]  WITH CHECK ADD  CONSTRAINT [FK_Moves_Categories_MoveType] FOREIGN KEY([MoveType])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Moves] CHECK CONSTRAINT [FK_Moves_Categories_MoveType]
GO
ALTER TABLE [dbo].[PageContents]  WITH CHECK ADD  CONSTRAINT [FK_PageContents_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageContents] CHECK CONSTRAINT [FK_PageContents_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[PageContents]  WITH CHECK ADD  CONSTRAINT [FK_PageContents_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageContents] CHECK CONSTRAINT [FK_PageContents_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[PageLangs]  WITH CHECK ADD  CONSTRAINT [FK_PageLangs_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageLangs] CHECK CONSTRAINT [FK_PageLangs_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[PageLangs]  WITH CHECK ADD  CONSTRAINT [FK_PageLangs_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageLangs] CHECK CONSTRAINT [FK_PageLangs_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[PageLangs]  WITH CHECK ADD  CONSTRAINT [FK_PageLangs_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PageLangs] CHECK CONSTRAINT [FK_PageLangs_Pages_PageId]
GO
ALTER TABLE [dbo].[PageMetas]  WITH CHECK ADD  CONSTRAINT [FK_PageMetas_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageMetas] CHECK CONSTRAINT [FK_PageMetas_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[PageMetas]  WITH CHECK ADD  CONSTRAINT [FK_PageMetas_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageMetas] CHECK CONSTRAINT [FK_PageMetas_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[PageMetas]  WITH CHECK ADD  CONSTRAINT [FK_PageMetas_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PageMetas] CHECK CONSTRAINT [FK_PageMetas_Pages_PageId]
GO
ALTER TABLE [dbo].[PageRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_PageRestrictions_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageRestrictions] CHECK CONSTRAINT [FK_PageRestrictions_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[PageRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_PageRestrictions_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageRestrictions] CHECK CONSTRAINT [FK_PageRestrictions_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[PageRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_PageRestrictions_Pages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[PageRestrictions] CHECK CONSTRAINT [FK_PageRestrictions_Pages_PageId]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_PageContents_NewestContent] FOREIGN KEY([NewestContent])
REFERENCES [dbo].[PageContents] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_PageContents_NewestContent]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Tags_TagId]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_WikiImages_FeatureImageId] FOREIGN KEY([FeatureImageId])
REFERENCES [dbo].[WikiImages] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_WikiImages_FeatureImageId]
GO
ALTER TABLE [dbo].[PokemonLocation]  WITH CHECK ADD  CONSTRAINT [FK_PokemonLocation_Characters_CharacterId] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Characters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PokemonLocation] CHECK CONSTRAINT [FK_PokemonLocation_Characters_CharacterId]
GO
ALTER TABLE [dbo].[PokemonLocation]  WITH CHECK ADD  CONSTRAINT [FK_PokemonLocation_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PokemonLocation] CHECK CONSTRAINT [FK_PokemonLocation_Locations_LocationId]
GO
ALTER TABLE [dbo].[PokemonMove]  WITH CHECK ADD  CONSTRAINT [FK_PokemonMove_Characters_CharacterId] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Characters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PokemonMove] CHECK CONSTRAINT [FK_PokemonMove_Characters_CharacterId]
GO
ALTER TABLE [dbo].[PokemonMove]  WITH CHECK ADD  CONSTRAINT [FK_PokemonMove_Moves_MoveId] FOREIGN KEY([MoveId])
REFERENCES [dbo].[Moves] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PokemonMove] CHECK CONSTRAINT [FK_PokemonMove_Moves_MoveId]
GO
ALTER TABLE [dbo].[PokemonSpecialMove]  WITH CHECK ADD  CONSTRAINT [FK_PokemonSpecialMove_Characters_CharacterId] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Characters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PokemonSpecialMove] CHECK CONSTRAINT [FK_PokemonSpecialMove_Characters_CharacterId]
GO
ALTER TABLE [dbo].[PokemonSpecialMove]  WITH CHECK ADD  CONSTRAINT [FK_PokemonSpecialMove_Moves_MoveId] FOREIGN KEY([MoveId])
REFERENCES [dbo].[Moves] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PokemonSpecialMove] CHECK CONSTRAINT [FK_PokemonSpecialMove_Moves_MoveId]
GO
ALTER TABLE [dbo].[References]  WITH CHECK ADD  CONSTRAINT [FK_References_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[References] CHECK CONSTRAINT [FK_References_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[References]  WITH CHECK ADD  CONSTRAINT [FK_References_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[References] CHECK CONSTRAINT [FK_References_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[Type]  WITH CHECK ADD  CONSTRAINT [FK_Type_Categories_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Type] CHECK CONSTRAINT [FK_Type_Categories_TypeId]
GO
ALTER TABLE [dbo].[Type]  WITH CHECK ADD  CONSTRAINT [FK_Type_Characters_CharacterId] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Characters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Type] CHECK CONSTRAINT [FK_Type_Characters_CharacterId]
GO
ALTER TABLE [dbo].[UserMetas]  WITH CHECK ADD  CONSTRAINT [FK_UserMetas_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserMetas] CHECK CONSTRAINT [FK_UserMetas_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[UserMetas]  WITH CHECK ADD  CONSTRAINT [FK_UserMetas_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserMetas] CHECK CONSTRAINT [FK_UserMetas_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[UserMetas]  WITH CHECK ADD  CONSTRAINT [FK_UserMetas_AspNetUsers_UserInUseId] FOREIGN KEY([UserInUseId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserMetas] CHECK CONSTRAINT [FK_UserMetas_AspNetUsers_UserInUseId]
GO
ALTER TABLE [dbo].[UserNewtalks]  WITH CHECK ADD  CONSTRAINT [FK_UserNewtalks_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserNewtalks] CHECK CONSTRAINT [FK_UserNewtalks_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[UserNewtalks]  WITH CHECK ADD  CONSTRAINT [FK_UserNewtalks_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserNewtalks] CHECK CONSTRAINT [FK_UserNewtalks_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[UserNewtalks]  WITH CHECK ADD  CONSTRAINT [FK_UserNewtalks_AspNetUsers_UserSeenId] FOREIGN KEY([UserSeenId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserNewtalks] CHECK CONSTRAINT [FK_UserNewtalks_AspNetUsers_UserSeenId]
GO
ALTER TABLE [dbo].[WikiImages]  WITH CHECK ADD  CONSTRAINT [FK_WikiImages_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WikiImages] CHECK CONSTRAINT [FK_WikiImages_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[WikiImages]  WITH CHECK ADD  CONSTRAINT [FK_WikiImages_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WikiImages] CHECK CONSTRAINT [FK_WikiImages_AspNetUsers_UpdatedUserId]
GO
ALTER TABLE [dbo].[WikiVideos]  WITH CHECK ADD  CONSTRAINT [FK_WikiVideos_AspNetUsers_CreatedUserId] FOREIGN KEY([CreatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WikiVideos] CHECK CONSTRAINT [FK_WikiVideos_AspNetUsers_CreatedUserId]
GO
ALTER TABLE [dbo].[WikiVideos]  WITH CHECK ADD  CONSTRAINT [FK_WikiVideos_AspNetUsers_UpdatedUserId] FOREIGN KEY([UpdatedUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WikiVideos] CHECK CONSTRAINT [FK_WikiVideos_AspNetUsers_UpdatedUserId]
GO
USE [master]
GO
ALTER DATABASE [EWiki] SET  READ_WRITE 
GO
