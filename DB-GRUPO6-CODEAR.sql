USE [master]
GO
/****** Object:  Database [FINAL]    Script Date: 2/9/2021 16:59:58 ******/
CREATE DATABASE [FINAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FINAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FINAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FINAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FINAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FINAL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FINAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FINAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FINAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FINAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FINAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FINAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FINAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FINAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FINAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FINAL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FINAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FINAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FINAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FINAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FINAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FINAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FINAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FINAL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FINAL] SET  MULTI_USER 
GO
ALTER DATABASE [FINAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FINAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FINAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FINAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FINAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FINAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FINAL] SET QUERY_STORE = OFF
GO
USE [FINAL]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorias_categoria]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[creado] [datetime2](7) NOT NULL,
	[modificado] [datetime2](7) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[color] [nvarchar](6) NOT NULL,
	[icono] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partidas_partida]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partidas_partida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[creado] [datetime2](7) NOT NULL,
	[modificado] [datetime2](7) NOT NULL,
	[puntaje] [int] NOT NULL,
	[finalizada] [bit] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[categoria_id] [int] NOT NULL,
	[contador] [int] NOT NULL,
	[max_preguntas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preguntas_pregunta]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preguntas_pregunta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[creado] [datetime2](7) NOT NULL,
	[modificado] [datetime2](7) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
	[categoria_id] [int] NOT NULL,
	[mostrada] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[respuestas_respuesta]    Script Date: 2/9/2021 16:59:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[respuestas_respuesta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[creado] [datetime2](7) NOT NULL,
	[modificado] [datetime2](7) NOT NULL,
	[descripcion] [nvarchar](255) NOT NULL,
	[correcta] [bit] NOT NULL,
	[seleccionada] [bit] NOT NULL,
	[pregunta_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view log entry', 1, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add permission', 2, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change permission', 2, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete permission', 2, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view permission', 2, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add group', 3, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change group', 3, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete group', 3, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view group', 3, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view user', 4, N'view_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (25, N'Can add categoria', 7, N'add_categoria')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (26, N'Can change categoria', 7, N'change_categoria')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (27, N'Can delete categoria', 7, N'delete_categoria')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (28, N'Can view categoria', 7, N'view_categoria')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (29, N'Can add pregunta', 8, N'add_pregunta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (30, N'Can change pregunta', 8, N'change_pregunta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (31, N'Can delete pregunta', 8, N'delete_pregunta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (32, N'Can view pregunta', 8, N'view_pregunta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (33, N'Can add respuesta', 9, N'add_respuesta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (34, N'Can change respuesta', 9, N'change_respuesta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (35, N'Can delete respuesta', 9, N'delete_respuesta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (36, N'Can view respuesta', 9, N'view_respuesta')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (37, N'Can add partida', 10, N'add_partida')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (38, N'Can change partida', 10, N'change_partida')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (39, N'Can delete partida', 10, N'delete_partida')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (40, N'Can view partida', 10, N'view_partida')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
SET IDENTITY_INSERT [dbo].[auth_user] ON 

INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (1, N'pbkdf2_sha256$180000$gxu2e3jr4gor$1IwwbVxMe0eqsukZDkN9w1He3VBwyESyJpuE0NC5Gd4=', CAST(N'2021-09-02T19:50:59.9756660' AS DateTime2), 1, N'pame.mott', N'', N'', N'pames@gmail.com', 1, 1, CAST(N'2021-08-26T04:47:28.3030600' AS DateTime2))
INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (2, N'pbkdf2_sha256$180000$9nML4ZF48xqj$zraXBYIi0Xf0sHtBwe47TryHlXM+qL7mRymg0W2oP2E=', CAST(N'2021-09-02T17:20:48.3754000' AS DateTime2), 1, N'rodrigo', N'', N'', N'rodrigo@gmail.com', 1, 1, CAST(N'2021-08-30T18:35:48.1181440' AS DateTime2))
SET IDENTITY_INSERT [dbo].[auth_user] OFF
GO
SET IDENTITY_INSERT [dbo].[categorias_categoria] ON 

INSERT [dbo].[categorias_categoria] ([id], [creado], [modificado], [nombre], [descripcion], [color], [icono]) VALUES (1, CAST(N'2021-08-26T04:59:14.0353360' AS DateTime2), CAST(N'2021-08-26T04:59:14.0353360' AS DateTime2), N'CULTURA Y ARTE', N'Cultura y arte chaqueño', N'sinDef', N'sinIcono')
INSERT [dbo].[categorias_categoria] ([id], [creado], [modificado], [nombre], [descripcion], [color], [icono]) VALUES (2, CAST(N'2021-08-26T04:59:59.5945140' AS DateTime2), CAST(N'2021-08-26T04:59:59.5945140' AS DateTime2), N'HISTORIA', N'Historia chaqueña', N'sincol', N'sinicono')
INSERT [dbo].[categorias_categoria] ([id], [creado], [modificado], [nombre], [descripcion], [color], [icono]) VALUES (3, CAST(N'2021-08-26T05:00:40.0686300' AS DateTime2), CAST(N'2021-08-26T05:00:40.0686300' AS DateTime2), N'DEPORTE', N'Deporte chaqueño', N'sincol', N'sinicono')
INSERT [dbo].[categorias_categoria] ([id], [creado], [modificado], [nombre], [descripcion], [color], [icono]) VALUES (4, CAST(N'2021-08-26T05:01:53.9203230' AS DateTime2), CAST(N'2021-08-26T05:01:53.9203230' AS DateTime2), N'GEOGRAFIA', N'´Geografía chaqueña', N'sincol', N'sinicono')
INSERT [dbo].[categorias_categoria] ([id], [creado], [modificado], [nombre], [descripcion], [color], [icono]) VALUES (5, CAST(N'2021-08-26T05:02:52.0311670' AS DateTime2), CAST(N'2021-08-26T05:02:52.0321660' AS DateTime2), N'ECONOMIA', N'Economía chaqueña', N'sincol', N'sinicono')
INSERT [dbo].[categorias_categoria] ([id], [creado], [modificado], [nombre], [descripcion], [color], [icono]) VALUES (6, CAST(N'2021-08-26T05:03:27.5936770' AS DateTime2), CAST(N'2021-08-26T05:03:27.5936770' AS DateTime2), N'CIENCIA Y EDUCACION', N'Ciencia y Educación del Chaco', N'sincol', N'sinicono')
INSERT [dbo].[categorias_categoria] ([id], [creado], [modificado], [nombre], [descripcion], [color], [icono]) VALUES (7, CAST(N'2021-08-26T05:03:52.1844360' AS DateTime2), CAST(N'2021-08-26T05:03:52.1844360' AS DateTime2), N'ENTRETENIMIENTO', N'Entretenimiento chaqueño', N'sincol', N'sinicono')
SET IDENTITY_INSERT [dbo].[categorias_categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[django_admin_log] ON 

INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (1, CAST(N'2021-08-26T04:59:14.0412410' AS DateTime2), N'1', N'CULTURA Y ARTE', 1, N'[{"added": {}}]', 7, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (2, CAST(N'2021-08-26T04:59:59.5989990' AS DateTime2), N'2', N'HISTORIA', 1, N'[{"added": {}}]', 7, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (3, CAST(N'2021-08-26T05:00:40.0716250' AS DateTime2), N'3', N'DEPORTE', 1, N'[{"added": {}}]', 7, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (4, CAST(N'2021-08-26T05:01:53.9283040' AS DateTime2), N'4', N'GEOGRAFIA', 1, N'[{"added": {}}]', 7, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (5, CAST(N'2021-08-26T05:02:52.0381720' AS DateTime2), N'5', N'ECONOMIA', 1, N'[{"added": {}}]', 7, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (6, CAST(N'2021-08-26T05:03:27.5986740' AS DateTime2), N'6', N'CIENCIA Y EDUCACION', 1, N'[{"added": {}}]', 7, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (7, CAST(N'2021-08-26T05:03:52.1876380' AS DateTime2), N'7', N'ENTRETENIMIENTO', 1, N'[{"added": {}}]', 7, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (8, CAST(N'2021-08-26T05:04:45.9888400' AS DateTime2), N'1', N'Resistencia es conocida como:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (9, CAST(N'2021-08-26T05:05:29.5989080' AS DateTime2), N'1', N'La ciudad de las esculturas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (10, CAST(N'2021-08-26T05:05:42.6669080' AS DateTime2), N'2', N'Ciudad Museo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (11, CAST(N'2021-08-26T05:05:58.2127760' AS DateTime2), N'3', N'Ciudad Capital', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (12, CAST(N'2021-08-26T05:07:14.1825570' AS DateTime2), N'2', N'¿Cuántas esculturas hay en Resistencia?', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (13, CAST(N'2021-08-26T05:08:18.8641960' AS DateTime2), N'3', N'¿En qué sectores se divide geográficamente la prov', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (14, CAST(N'2021-08-26T05:09:33.0407460' AS DateTime2), N'4', N'200', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (15, CAST(N'2021-08-26T05:09:42.6132700' AS DateTime2), N'5', N'700', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (16, CAST(N'2021-08-26T05:09:56.2824530' AS DateTime2), N'6', N'600', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (17, CAST(N'2021-08-26T05:10:57.9045930' AS DateTime2), N'7', N'Litoral Chaqueño, centro Chaqueño e Impenetrable', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (18, CAST(N'2021-08-26T05:11:13.7113190' AS DateTime2), N'8', N'Litoral Chaqueño e Impenetrable Chaqueño', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (19, CAST(N'2021-08-26T05:11:39.4467390' AS DateTime2), N'9', N'Chaco Boreal y Chaco Austral', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (20, CAST(N'2021-08-26T11:29:17.1735110' AS DateTime2), N'4', N'Campo del Cielo: Patrimonio Cultural y Turístico d', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (21, CAST(N'2021-08-26T11:32:20.4319140' AS DateTime2), N'10', N'Maipú', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (22, CAST(N'2021-08-26T11:32:37.6096460' AS DateTime2), N'11', N'Bermejo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (23, CAST(N'2021-08-26T11:32:57.2861970' AS DateTime2), N'12', N'12 de Octubre', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (24, CAST(N'2021-08-26T11:34:26.8417450' AS DateTime2), N'5', N'Al norte el límite natural establecido entre la Pr', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (25, CAST(N'2021-08-26T11:35:49.5324630' AS DateTime2), N'6', N'El ex ferrocarril General Belgrano conectaba a:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (26, CAST(N'2021-08-26T11:36:04.9028490' AS DateTime2), N'7', N'En el ámbito automovilístico deportivo Chaco tiene', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (27, CAST(N'2021-08-26T11:36:18.7850520' AS DateTime2), N'8', N'En el ámbito de los juegos olímpicos, el Chaco tie', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (28, CAST(N'2021-08-26T11:36:33.3467280' AS DateTime2), N'9', N'Marcela Gómez, chaqueña, participó en los Juegos O', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (29, CAST(N'2021-08-26T11:36:54.9721710' AS DateTime2), N'10', N'El club de fútbol más antiguo del Chaco es', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (30, CAST(N'2021-08-26T11:37:23.4763510' AS DateTime2), N'11', N'Por Decreto N° 1491 el Gobierno de la Provincia de', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (31, CAST(N'2021-08-26T11:37:50.2653360' AS DateTime2), N'12', N'La palabra Chacú del cual deriva el nombre de nues', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (32, CAST(N'2021-08-26T11:38:17.2617080' AS DateTime2), N'13', N'La superficie total de la provincia del Chaco es d', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (33, CAST(N'2021-08-26T11:38:46.2453690' AS DateTime2), N'14', N'La población actual del Chaco oscila entre:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (34, CAST(N'2021-08-26T11:39:05.0413610' AS DateTime2), N'15', N'¿Quién fue el primer gobernador del Territorio Nac', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (35, CAST(N'2021-08-26T11:40:06.4227370' AS DateTime2), N'16', N'Un escritor reconocido en el ámbito chaqueño recib', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (36, CAST(N'2021-08-26T11:40:27.4132540' AS DateTime2), N'17', N'En la bandera del Chaco hay un arado rodeado de 2', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (37, CAST(N'2021-08-26T11:40:46.1383680' AS DateTime2), N'18', N'En un emblemático edificio de la ciudad de Resiste', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (38, CAST(N'2021-08-26T11:42:13.1208440' AS DateTime2), N'19', N'La producción destacada chaqueña que perdura en la', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (39, CAST(N'2021-08-26T11:43:04.3833770' AS DateTime2), N'20', N'¿Cuál es la flor provincial del Chaco?', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (40, CAST(N'2021-08-26T11:43:51.4568900' AS DateTime2), N'21', N'Un conjunto coral chaqueño fue reconocido como “Pa', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (41, CAST(N'2021-08-26T11:44:13.7001090' AS DateTime2), N'22', N'En 1939 es erigida la Diócesis de Resistencia ¿Qui', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (42, CAST(N'2021-08-26T11:44:29.5782440' AS DateTime2), N'23', N'El Puente General Belgrano que une las provincias', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (43, CAST(N'2021-08-26T11:45:04.8599440' AS DateTime2), N'24', N'¿Desde cuándo existe la Provincia del Chaco?', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (44, CAST(N'2021-08-26T11:45:32.7564270' AS DateTime2), N'25', N'Nuestras primeras poblaciones originarias, pertene', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (45, CAST(N'2021-08-26T12:29:19.9009000' AS DateTime2), N'13', N'Litoral Chaqueño, centro Chaqueño e Impenetrable C', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (46, CAST(N'2021-08-26T12:29:42.4131660' AS DateTime2), N'14', N'Litoral Chaqueño e Impenetrable Chaqueño', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (47, CAST(N'2021-08-26T12:30:08.9292500' AS DateTime2), N'15', N'Chaco Boreal y Chaco Austral', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (48, CAST(N'2021-08-26T12:30:45.4617510' AS DateTime2), N'16', N'Maipú', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (49, CAST(N'2021-08-26T12:30:57.5241420' AS DateTime2), N'17', N'Bermejo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (50, CAST(N'2021-08-26T12:31:33.4923370' AS DateTime2), N'18', N'12 de Octubre', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (51, CAST(N'2021-08-26T12:32:39.4529790' AS DateTime2), N'18', N'12 de Octubre', 3, N'', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (52, CAST(N'2021-08-26T12:32:39.4594450' AS DateTime2), N'17', N'Bermejo', 3, N'', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (53, CAST(N'2021-08-26T12:32:39.4637490' AS DateTime2), N'16', N'Maipú', 3, N'', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (54, CAST(N'2021-08-26T12:33:07.0747160' AS DateTime2), N'19', N'Pilcomayo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (55, CAST(N'2021-08-26T12:33:18.0952000' AS DateTime2), N'20', N'Paraná', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (56, CAST(N'2021-08-26T12:33:55.2098900' AS DateTime2), N'21', N'Bermejo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (57, CAST(N'2021-08-26T12:35:20.2877690' AS DateTime2), N'26', N'Al sur, el límite establecido entre la Provincia d', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (58, CAST(N'2021-08-26T12:36:01.6252510' AS DateTime2), N'22', N'Paralelo 28', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (59, CAST(N'2021-08-26T12:36:29.2727590' AS DateTime2), N'23', N'Paralelo 30', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (60, CAST(N'2021-08-26T12:36:43.1232060' AS DateTime2), N'24', N'Paralelo 29', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (61, CAST(N'2021-08-26T12:40:55.0690500' AS DateTime2), N'25', N'Puerto de Barranqueras con Formosa', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (62, CAST(N'2021-08-26T12:41:23.8733440' AS DateTime2), N'26', N'Puerto de Barranqueras con Salta', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (63, CAST(N'2021-08-26T12:42:01.6055470' AS DateTime2), N'27', N'Puerto de Barranqueras con Santiago del Estero', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (64, CAST(N'2021-08-26T13:06:18.7405710' AS DateTime2), N'28', N'Juan Manel Silva', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (65, CAST(N'2021-08-26T13:06:37.1470090' AS DateTime2), N'29', N'Giorgio Carrara', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (66, CAST(N'2021-08-26T13:06:56.7788790' AS DateTime2), N'30', N'Marcos Siebert', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (67, CAST(N'2021-08-26T13:07:18.7092420' AS DateTime2), N'31', N'Básquet', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (68, CAST(N'2021-08-26T13:07:36.5683270' AS DateTime2), N'32', N'Remo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (69, CAST(N'2021-08-26T13:08:05.8164110' AS DateTime2), N'33', N'Fútbol', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (70, CAST(N'2021-08-26T13:08:26.6020790' AS DateTime2), N'34', N'Jockey', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (71, CAST(N'2021-08-26T13:08:48.6135880' AS DateTime2), N'32', N'Remo', 3, N'', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (72, CAST(N'2021-08-26T13:09:25.4677110' AS DateTime2), N'35', N'Natación', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (73, CAST(N'2021-08-26T13:09:36.1812420' AS DateTime2), N'36', N'Remo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (74, CAST(N'2021-08-26T13:09:46.7272740' AS DateTime2), N'37', N'Atletismo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (75, CAST(N'2021-08-26T13:10:08.7378160' AS DateTime2), N'38', N'For Ever', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (76, CAST(N'2021-08-26T13:10:27.8529570' AS DateTime2), N'39', N'Sarmiento', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (77, CAST(N'2021-08-26T13:10:44.5030320' AS DateTime2), N'40', N'Don Orione', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (78, CAST(N'2021-08-26T13:11:11.5128960' AS DateTime2), N'37', N'Atletismo', 2, N'[{"changed": {"fields": ["Correcta"]}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (79, CAST(N'2021-08-26T13:11:44.4384530' AS DateTime2), N'41', N'Acordeón', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (80, CAST(N'2021-08-26T13:12:08.1268090' AS DateTime2), N'42', N'N''viké', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (81, CAST(N'2021-08-26T13:14:49.5431450' AS DateTime2), N'43', N'Charango', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (82, CAST(N'2021-08-26T13:15:23.7371850' AS DateTime2), N'44', N'La caza comunal de animales', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (83, CAST(N'2021-08-26T13:15:53.9433560' AS DateTime2), N'45', N'Nombre de un árbol que abunda en la región', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (84, CAST(N'2021-08-26T13:16:10.2798480' AS DateTime2), N'46', N'Nombre de un animal', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (85, CAST(N'2021-08-26T13:17:01.7079170' AS DateTime2), N'47', N'99.633 Km²', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (86, CAST(N'2021-08-26T13:17:17.2343300' AS DateTime2), N'48', N'32.565 Km²', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (87, CAST(N'2021-08-26T13:17:35.5674380' AS DateTime2), N'49', N'29.900 Km²', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (88, CAST(N'2021-08-26T13:17:53.8925830' AS DateTime2), N'50', N'300.000', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (89, CAST(N'2021-08-26T13:18:07.8354950' AS DateTime2), N'51', N'2.000.000', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (90, CAST(N'2021-08-26T13:18:25.7329770' AS DateTime2), N'52', N'1.000.000', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (91, CAST(N'2021-08-26T13:18:51.8191570' AS DateTime2), N'53', N'Gral. Lorenzo Winter', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (92, CAST(N'2021-08-26T13:19:07.9031870' AS DateTime2), N'54', N'Gral. Julio de Vedia', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (93, CAST(N'2021-08-26T13:19:37.7884780' AS DateTime2), N'55', N'Gral. Antonio Dónovan', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (94, CAST(N'2021-08-26T13:19:53.2846380' AS DateTime2), N'56', N'Tony Zalazar', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (95, CAST(N'2021-08-26T13:20:21.4667080' AS DateTime2), N'57', N'Aledo Luis Meloni', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (96, CAST(N'2021-08-26T13:21:08.4168260' AS DateTime2), N'58', N'Tete Romero', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (97, CAST(N'2021-08-26T13:22:07.9224960' AS DateTime2), N'59', N'Los Departamentos Provinciales', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (98, CAST(N'2021-08-26T13:22:26.0794490' AS DateTime2), N'60', N'Las ciudades principales', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (99, CAST(N'2021-08-26T13:23:02.5946650' AS DateTime2), N'61', N'Grandes personajes que forzaron Chaco', 1, N'[{"added": {}}]', 9, 1)
GO
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (100, CAST(N'2021-08-26T13:23:39.2476920' AS DateTime2), N'62', N'La Municipalidad de la Ciudad', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (101, CAST(N'2021-08-26T13:25:07.4320250' AS DateTime2), N'63', N'El Fogón de los Arrieros', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (102, CAST(N'2021-08-26T13:25:32.0572400' AS DateTime2), N'64', N'Casa de Gobierno', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (103, CAST(N'2021-08-26T13:25:48.3015330' AS DateTime2), N'65', N'Caña de azúcar', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (104, CAST(N'2021-08-26T13:26:09.1776910' AS DateTime2), N'66', N'Algodón', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (105, CAST(N'2021-08-26T13:26:42.0789080' AS DateTime2), N'67', N'Producción de tanino', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (106, CAST(N'2021-08-26T13:27:19.2095700' AS DateTime2), N'68', N'Flor del Cardo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (107, CAST(N'2021-08-26T13:27:36.1743490' AS DateTime2), N'69', N'Flor del Ceibo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (108, CAST(N'2021-08-26T13:29:36.8028030' AS DateTime2), N'70', N'Flor Rosada del Palo Borracho', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (109, CAST(N'2021-08-26T13:30:27.9541800' AS DateTime2), N'71', N'El coro polifónico de Resistencia', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (110, CAST(N'2021-08-26T13:30:47.1289230' AS DateTime2), N'72', N'El coro de niños', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (111, CAST(N'2021-08-26T13:31:11.5699400' AS DateTime2), N'73', N'El coro Chelaalapí', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (112, CAST(N'2021-08-26T13:31:30.3677180' AS DateTime2), N'74', N'Gabriel Grotti', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (113, CAST(N'2021-08-26T13:31:49.5781620' AS DateTime2), N'75', N'Nicolás de Carlo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (114, CAST(N'2021-08-26T13:32:09.8379190' AS DateTime2), N'76', N'José Alumni', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (115, CAST(N'2021-08-26T13:32:23.6327420' AS DateTime2), N'77', N'1973', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (116, CAST(N'2021-08-26T13:32:44.6617570' AS DateTime2), N'78', N'1974', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (117, CAST(N'2021-08-26T13:32:55.6998700' AS DateTime2), N'79', N'1976', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (118, CAST(N'2021-08-26T13:33:55.4224600' AS DateTime2), N'80', N'8 de agosto de 1951', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (119, CAST(N'2021-08-26T13:34:19.6328220' AS DateTime2), N'81', N'8 de agosto de 1958', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (120, CAST(N'2021-08-26T13:34:35.9636550' AS DateTime2), N'82', N'8 de agosto de 1955', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (121, CAST(N'2021-08-26T13:35:01.2618510' AS DateTime2), N'83', N'Qom', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (122, CAST(N'2021-08-26T13:35:23.2101220' AS DateTime2), N'84', N'Moqoi', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (123, CAST(N'2021-08-26T13:35:38.9540320' AS DateTime2), N'85', N'Wichi', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (124, CAST(N'2021-08-26T13:36:00.6661500' AS DateTime2), N'86', N'Vilelas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (125, CAST(N'2021-08-26T13:36:20.8111720' AS DateTime2), N'87', N'Guaraníes', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (126, CAST(N'2021-08-26T13:37:19.4508160' AS DateTime2), N'27', N'¿Quién fue el primer gobernador de la Provincia de', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (127, CAST(N'2021-08-26T13:37:30.9544320' AS DateTime2), N'27', N'¿Quién fue el primer gobernador de la Provincia de', 2, N'[]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (128, CAST(N'2021-08-26T13:39:05.5386530' AS DateTime2), N'88', N'Felipe Gallardo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (129, CAST(N'2021-08-26T13:39:27.5490940' AS DateTime2), N'89', N'Danilo Baroni', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (130, CAST(N'2021-08-26T13:39:55.9298010' AS DateTime2), N'90', N'Deolindo Bittel', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (131, CAST(N'2021-08-26T13:40:32.0987980' AS DateTime2), N'28', N'La primera ciudad colonial del Chaco fue:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (132, CAST(N'2021-08-26T13:40:57.0442420' AS DateTime2), N'29', N'San Fernando del Río Negro fue una:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (133, CAST(N'2021-08-26T13:41:13.8776430' AS DateTime2), N'30', N'¿Qué reducciones franciscanas se fundaron en el ac', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (134, CAST(N'2021-08-26T13:41:47.7868940' AS DateTime2), N'31', N'La Gobernación del Chaco se creó en:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (135, CAST(N'2021-08-26T13:42:08.6382850' AS DateTime2), N'32', N'La ley 1532 divido a la Gobernación del Chaco en:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (136, CAST(N'2021-08-26T13:42:31.9770190' AS DateTime2), N'33', N'Las autoridades que administraban la Gobernación', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (137, CAST(N'2021-08-26T13:42:54.9617580' AS DateTime2), N'34', N'La Conquista Militar del Chaco se produjo', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (138, CAST(N'2021-08-26T13:43:11.8017630' AS DateTime2), N'35', N'La llegada de los inmigrantes se dio a raíz', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (139, CAST(N'2021-08-26T13:43:27.9557600' AS DateTime2), N'36', N'A inicios del siglo XX, la actividad económica más', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (140, CAST(N'2021-08-26T13:44:11.6710770' AS DateTime2), N'37', N'El tanino se desarrolló en', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (141, CAST(N'2021-08-26T13:44:42.8966710' AS DateTime2), N'38', N'Las localidades algodoneras fueron', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (142, CAST(N'2021-08-26T13:44:55.5387260' AS DateTime2), N'39', N'Nuestra primera constitución se promulgó en', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (143, CAST(N'2021-08-26T13:45:18.8727070' AS DateTime2), N'40', N'¿Cuántos departamentos tiene la provincia del Chac', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (144, CAST(N'2021-08-26T13:45:33.4337240' AS DateTime2), N'41', N'¿Cuántas rutas nacionales recorren la provincia?', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (145, CAST(N'2021-08-26T13:45:48.7130490' AS DateTime2), N'42', N'La Ruta Nacional 16 recorre entre:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (146, CAST(N'2021-08-26T13:46:58.7177920' AS DateTime2), N'91', N'Esteco', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (147, CAST(N'2021-08-26T13:49:49.0306070' AS DateTime2), N'92', N'Concepción del Bermejo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (148, CAST(N'2021-08-26T13:50:45.2755030' AS DateTime2), N'93', N'San Fernando del Río Negro', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (149, CAST(N'2021-08-26T13:50:52.6443200' AS DateTime2), N'92', N'Concepción del Bermejo', 2, N'[{"changed": {"fields": ["Correcta"]}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (150, CAST(N'2021-08-26T13:51:16.4607610' AS DateTime2), N'94', N'Ciudad española', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (151, CAST(N'2021-08-26T13:51:46.7067870' AS DateTime2), N'95', N'Reducción de los Jesuitas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (152, CAST(N'2021-08-26T13:52:09.0449430' AS DateTime2), N'96', N'Misión franciscana', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (153, CAST(N'2021-08-26T13:54:36.1979650' AS DateTime2), N'97', N'San Carlos del Timbo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (154, CAST(N'2021-08-26T13:54:59.8351670' AS DateTime2), N'98', N'San Bernardo de Vértiz', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (155, CAST(N'2021-08-26T13:55:36.4326930' AS DateTime2), N'99', N'Nuestra Señora de los Dolores de la Cangaye', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (156, CAST(N'2021-08-26T13:57:09.3515170' AS DateTime2), N'100', N'1810', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (157, CAST(N'2021-08-26T13:57:33.7657790' AS DateTime2), N'101', N'1862', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (158, CAST(N'2021-08-26T13:58:08.4121250' AS DateTime2), N'102', N'1900', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (159, CAST(N'2021-08-26T13:58:47.9182960' AS DateTime2), N'103', N'Dos Gobernaciones (Chaco Austral y Chaco Central)', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (160, CAST(N'2021-08-26T13:59:05.0441120' AS DateTime2), N'104', N'Tres Gobernaciones', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (161, CAST(N'2021-08-26T13:59:26.9265800' AS DateTime2), N'105', N'Cuatro Gobernaciones', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (162, CAST(N'2021-08-26T14:00:16.8132980' AS DateTime2), N'106', N'Eran elegidas por el voto popular', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (163, CAST(N'2021-08-26T14:00:46.9599060' AS DateTime2), N'107', N'Eran nombradas por el Poder Ejecutivo Nacional', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (164, CAST(N'2021-08-26T14:01:12.6193540' AS DateTime2), N'108', N'Durante la Triple Alianza', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (165, CAST(N'2021-08-26T14:01:41.7586960' AS DateTime2), N'109', N'Al terminar la guerra de la Triple Alianza', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (166, CAST(N'2021-08-26T14:02:20.9823030' AS DateTime2), N'110', N'Ley  Avellaneda sancionada en 1876', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (167, CAST(N'2021-08-26T14:02:41.3242550' AS DateTime2), N'111', N'La ley de Bartolomé Mitre', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (168, CAST(N'2021-08-26T14:03:12.2314590' AS DateTime2), N'112', N'Ley 576 de 1872', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (169, CAST(N'2021-08-26T14:03:50.7231170' AS DateTime2), N'113', N'Algodón', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (170, CAST(N'2021-08-26T14:04:40.8545920' AS DateTime2), N'114', N'Pesca', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (171, CAST(N'2021-08-26T14:04:52.3875970' AS DateTime2), N'115', N'Caza', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (172, CAST(N'2021-08-26T14:05:18.7429650' AS DateTime2), N'116', N'Resistencia', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (173, CAST(N'2021-08-26T14:05:36.2108160' AS DateTime2), N'117', N'Puerto Tirol', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (174, CAST(N'2021-08-26T14:05:52.2006420' AS DateTime2), N'118', N'Vicentini', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (175, CAST(N'2021-08-26T14:06:06.4177440' AS DateTime2), N'119', N'La Verde', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (176, CAST(N'2021-08-26T14:06:20.5543510' AS DateTime2), N'120', N'La Escondida', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (177, CAST(N'2021-08-26T14:06:43.5848150' AS DateTime2), N'121', N'Resistencia', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (178, CAST(N'2021-08-26T14:07:00.8508520' AS DateTime2), N'122', N'Margarita Belén', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (179, CAST(N'2021-08-26T14:07:36.1002750' AS DateTime2), N'123', N'Quitilipi', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (180, CAST(N'2021-08-26T14:07:48.8997150' AS DateTime2), N'124', N'Machagai', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (181, CAST(N'2021-08-26T14:08:26.5580850' AS DateTime2), N'125', N'1951', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (182, CAST(N'2021-08-26T14:08:36.6116230' AS DateTime2), N'126', N'1994', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (183, CAST(N'2021-08-26T14:08:47.0435230' AS DateTime2), N'127', N'1862', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (184, CAST(N'2021-08-26T14:09:12.9742610' AS DateTime2), N'128', N'25', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (185, CAST(N'2021-08-26T14:09:25.2630630' AS DateTime2), N'129', N'20', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (186, CAST(N'2021-08-26T14:09:36.5265730' AS DateTime2), N'130', N'10', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (187, CAST(N'2021-08-26T14:09:46.2612830' AS DateTime2), N'131', N'5', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (188, CAST(N'2021-08-26T14:09:54.3057820' AS DateTime2), N'132', N'4', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (189, CAST(N'2021-08-26T14:10:10.7467280' AS DateTime2), N'133', N'3', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (190, CAST(N'2021-08-26T14:10:34.8909560' AS DateTime2), N'134', N'Entre Santa Silvina y Resistencia', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (191, CAST(N'2021-08-26T14:11:16.3921290' AS DateTime2), N'135', N'Entre Resistencia y Pampa del Infierno', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (192, CAST(N'2021-08-26T14:12:45.2644960' AS DateTime2), N'136', N'Entre Resistencia y Juan José Castelli', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (193, CAST(N'2021-08-26T14:13:25.6668020' AS DateTime2), N'37', N'El tanino se desarrolló en', 2, N'[{"changed": {"fields": ["Categoria"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (194, CAST(N'2021-08-26T14:13:39.2855360' AS DateTime2), N'38', N'Las localidades algodoneras fueron', 2, N'[{"changed": {"fields": ["Categoria"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (195, CAST(N'2021-08-26T14:13:52.8364720' AS DateTime2), N'36', N'A inicios del siglo XX, la actividad económica más', 2, N'[{"changed": {"fields": ["Categoria"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (196, CAST(N'2021-08-26T14:14:40.3435130' AS DateTime2), N'43', N'La capital de la Gobernación del Chaco se ubicaba', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (197, CAST(N'2021-08-26T14:16:50.0450710' AS DateTime2), N'137', N'Villa Occidental', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (198, CAST(N'2021-08-26T14:17:15.3882520' AS DateTime2), N'138', N'Resistencia', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (199, CAST(N'2021-08-26T14:19:34.3080210' AS DateTime2), N'137', N'Villa Occidental', 2, N'[{"changed": {"fields": ["Correcta"]}}]', 9, 1)
GO
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (200, CAST(N'2021-08-26T14:24:11.8405960' AS DateTime2), N'44', N'¿Qué Parques Nacionales existen en el Chaco?', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (201, CAST(N'2021-08-26T14:24:27.1908830' AS DateTime2), N'45', N'Campo del Cielo es reconocido por', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (202, CAST(N'2021-08-26T14:24:39.0967360' AS DateTime2), N'46', N'Isla del Cerrito se realiza la:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (203, CAST(N'2021-08-26T14:24:54.9869840' AS DateTime2), N'47', N'La Fiesta Provincial del Inmigrante se realiza en', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (204, CAST(N'2021-08-26T14:25:11.6938870' AS DateTime2), N'48', N'El Festival Nacional Taninero se desarrolla en', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (205, CAST(N'2021-08-26T14:25:32.0905820' AS DateTime2), N'49', N'La Fiesta Provincial del Chivo se desarrolla en', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (206, CAST(N'2021-08-26T14:25:44.2132090' AS DateTime2), N'50', N'La Fiesta Nacional del Algodón se desarrolla en', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (207, CAST(N'2021-08-26T14:28:07.7789480' AS DateTime2), N'51', N'Las Reservas Naturales del Chaco son', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (208, CAST(N'2021-08-26T14:28:22.3549220' AS DateTime2), N'52', N'La Feria de Artesanía Aborigen Chaqueña se realiza', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (209, CAST(N'2021-08-26T14:28:37.7688070' AS DateTime2), N'53', N'¿Qué curso de agua se encuentra emplazado entre l', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (210, CAST(N'2021-08-26T14:28:50.6975630' AS DateTime2), N'54', N'El relieve del Chaco característico es', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (211, CAST(N'2021-08-26T14:29:12.3497930' AS DateTime2), N'55', N'Entre los ríos autóctonos del Chaco, se encuentran', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (212, CAST(N'2021-08-26T14:29:40.2410090' AS DateTime2), N'56', N'Juan José Castelli es considerada como', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (213, CAST(N'2021-08-26T14:29:59.3977470' AS DateTime2), N'57', N'La ciudad de las Breñas logró jugar en el Campeona', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (214, CAST(N'2021-08-26T14:30:53.2736420' AS DateTime2), N'58', N'En el municipio de Colonia Benítez se encuentra:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (215, CAST(N'2021-08-26T14:31:59.6896190' AS DateTime2), N'59', N'La patrona de Barranqueras es', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (216, CAST(N'2021-08-26T14:32:13.1686010' AS DateTime2), N'60', N'El Patrono de la ciudad de Resistencia es:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (217, CAST(N'2021-08-26T14:32:26.8645150' AS DateTime2), N'61', N'En Presidencia Roque Saénz Peña se encuentra:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (218, CAST(N'2021-08-26T14:32:58.9668970' AS DateTime2), N'62', N'En Las Palmas se puede recorrer:', 1, N'[{"added": {}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (219, CAST(N'2021-08-26T14:33:57.5479400' AS DateTime2), N'139', N'Parque Nacional Chaco', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (220, CAST(N'2021-08-26T14:34:58.2251190' AS DateTime2), N'140', N'Parque Nacional El Impenetrable', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (221, CAST(N'2021-08-26T14:35:31.3788500' AS DateTime2), N'141', N'Parque Nacional Iberá', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (222, CAST(N'2021-08-26T14:35:54.8185200' AS DateTime2), N'142', N'Museo a cielo abierto de meteoritos', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (223, CAST(N'2021-08-26T14:36:14.8539800' AS DateTime2), N'143', N'Capital de los Inmigrantes', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (224, CAST(N'2021-08-26T14:36:47.0885900' AS DateTime2), N'144', N'Ciudad de las Esculturas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (225, CAST(N'2021-08-26T14:37:16.3787800' AS DateTime2), N'145', N'Fiesta del Dorado', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (226, CAST(N'2021-08-26T14:37:47.4201640' AS DateTime2), N'146', N'Fiesta del Surubí', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (227, CAST(N'2021-08-26T14:38:05.7255750' AS DateTime2), N'147', N'Fiesta del Moncholo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (228, CAST(N'2021-08-26T14:38:20.0014300' AS DateTime2), N'148', N'Castelli', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (229, CAST(N'2021-08-26T14:38:37.6190270' AS DateTime2), N'149', N'Las Breñas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (230, CAST(N'2021-08-26T14:39:00.2798880' AS DateTime2), N'150', N'Puerto Tirol', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (231, CAST(N'2021-08-26T14:39:16.1922700' AS DateTime2), N'151', N'Puerto Vilelas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (232, CAST(N'2021-08-26T14:39:31.8780520' AS DateTime2), N'152', N'Charata', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (233, CAST(N'2021-08-26T14:39:50.9965540' AS DateTime2), N'153', N'Puerto Tirol', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (234, CAST(N'2021-08-26T14:40:13.0617260' AS DateTime2), N'154', N'Pampa del Indio', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (235, CAST(N'2021-08-26T14:40:36.6412470' AS DateTime2), N'155', N'Pampa del Infierno', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (236, CAST(N'2021-08-26T14:41:02.4404980' AS DateTime2), N'156', N'Castelli', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (237, CAST(N'2021-08-26T14:41:19.9675830' AS DateTime2), N'157', N'Charata', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (238, CAST(N'2021-08-26T14:41:35.7177990' AS DateTime2), N'158', N'Gancedo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (239, CAST(N'2021-08-26T14:42:06.2720830' AS DateTime2), N'159', N'Presidencia Roque Sáenz Peña', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (240, CAST(N'2021-08-26T14:42:40.3623770' AS DateTime2), N'160', N'Reserva Natural Provincial Fuerte Esperanza', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (241, CAST(N'2021-08-26T14:43:02.0402270' AS DateTime2), N'161', N'Parque Provincial Loro Hablador', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (242, CAST(N'2021-08-26T14:43:25.6314980' AS DateTime2), N'162', N'Campo del Cielo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (243, CAST(N'2021-08-26T14:43:42.2278210' AS DateTime2), N'163', N'Villa Río Bermejito', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (244, CAST(N'2021-08-26T14:43:56.9987960' AS DateTime2), N'164', N'Las Breñas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (245, CAST(N'2021-08-26T14:44:07.5004660' AS DateTime2), N'165', N'Fontana', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (246, CAST(N'2021-08-26T14:44:27.7443040' AS DateTime2), N'166', N'Quitilipi', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (247, CAST(N'2021-08-26T14:44:45.4650550' AS DateTime2), N'167', N'Río Pilcomayo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (248, CAST(N'2021-08-26T14:45:07.1332230' AS DateTime2), N'168', N'Río Bermejo', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (249, CAST(N'2021-08-26T14:45:21.8234450' AS DateTime2), N'169', N'Río Negro', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (250, CAST(N'2021-08-26T14:45:36.8810120' AS DateTime2), N'170', N'Montaña', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (251, CAST(N'2021-08-26T14:45:49.1117560' AS DateTime2), N'171', N'Sierra', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (252, CAST(N'2021-08-26T14:46:07.6898760' AS DateTime2), N'172', N'Llanura', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (253, CAST(N'2021-08-26T14:46:27.1035380' AS DateTime2), N'173', N'Paraná', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (254, CAST(N'2021-08-26T14:46:39.3936280' AS DateTime2), N'174', N'Oro', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (255, CAST(N'2021-08-26T14:46:50.6012530' AS DateTime2), N'175', N'Tragadero', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (256, CAST(N'2021-08-26T14:47:05.2607190' AS DateTime2), N'176', N'Paraguay', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (257, CAST(N'2021-08-26T14:47:26.6988890' AS DateTime2), N'177', N'Negro', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (258, CAST(N'2021-08-26T14:47:48.4175740' AS DateTime2), N'178', N'Guycurú', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (259, CAST(N'2021-08-26T14:48:21.5804890' AS DateTime2), N'179', N'Portal del Impenetrable', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (260, CAST(N'2021-08-26T14:48:36.6885990' AS DateTime2), N'180', N'Perla del Paraná', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (261, CAST(N'2021-08-26T14:48:54.9640280' AS DateTime2), N'181', N'Ciudad de las Esculturas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (262, CAST(N'2021-08-26T14:49:11.6721930' AS DateTime2), N'182', N'Baloncesto', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (263, CAST(N'2021-08-26T14:49:24.1854050' AS DateTime2), N'183', N'Fútbol', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (264, CAST(N'2021-08-26T14:49:41.0156790' AS DateTime2), N'184', N'Natación', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (265, CAST(N'2021-08-26T14:49:56.0683080' AS DateTime2), N'185', N'Tiro', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (266, CAST(N'2021-08-26T14:50:39.5900990' AS DateTime2), N'186', N'Museo Casa y Casa Jardín Schulz', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (267, CAST(N'2021-08-26T14:51:14.0335210' AS DateTime2), N'187', N'Estación Experimental Agropecuaria INTA', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (268, CAST(N'2021-08-26T14:51:36.5841660' AS DateTime2), N'188', N'Museo a cielo abierto', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (269, CAST(N'2021-08-26T14:52:06.3136280' AS DateTime2), N'189', N'Inmaculada Concepción de la Virgen María', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (270, CAST(N'2021-08-26T14:52:26.3850090' AS DateTime2), N'190', N'Virgen de Lourdes', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (271, CAST(N'2021-08-26T14:52:50.5961680' AS DateTime2), N'191', N'Virgen de Itatí', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (272, CAST(N'2021-08-26T14:53:20.6483490' AS DateTime2), N'192', N'San Fernando Rey', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (273, CAST(N'2021-08-26T14:53:40.3169200' AS DateTime2), N'193', N'El Cura Brochero', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (274, CAST(N'2021-08-26T14:53:57.9153390' AS DateTime2), N'194', N'Virgen de Itatí', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (275, CAST(N'2021-08-26T14:54:11.5216750' AS DateTime2), N'195', N'Complejo Termal', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (276, CAST(N'2021-08-26T14:54:58.5379620' AS DateTime2), N'196', N'Complejo Ecológico y Zoológico', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (277, CAST(N'2021-08-26T14:55:08.7515610' AS DateTime2), N'195', N'Complejo Termal', 2, N'[{"changed": {"fields": ["Correcta"]}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (278, CAST(N'2021-08-26T14:55:24.2265110' AS DateTime2), N'197', N'Museo Casa y Casa Jardín Schulz', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (279, CAST(N'2021-08-26T14:55:56.8132590' AS DateTime2), N'198', N'Las ruinas del Ingenio Azucarero', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (280, CAST(N'2021-08-26T14:56:12.4835050' AS DateTime2), N'199', N'Las Termas', 1, N'[{"added": {}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (281, CAST(N'2021-08-26T19:36:00.4562770' AS DateTime2), N'57', N'La ciudad de las Breñas logró jugar en el Campeonato Argentino de Clubes en', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (282, CAST(N'2021-08-26T19:37:38.1944140' AS DateTime2), N'30', N'¿Qué reducciones franciscanas se fundaron en el actual territorio del Chaco a finales del siglo XVIII?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (283, CAST(N'2021-08-26T19:46:46.6069520' AS DateTime2), N'59', N'La patrona de Barranqueras es:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (284, CAST(N'2021-08-26T19:50:42.1012800' AS DateTime2), N'57', N'La ciudad de las Breñas logró jugar en el Campeonato Argentino de Clubes en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (285, CAST(N'2021-08-26T19:51:02.9043010' AS DateTime2), N'56', N'Juan José Castelli es considerada como:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (286, CAST(N'2021-08-26T19:51:22.7601340' AS DateTime2), N'55', N'Entre los ríos autóctonos del Chaco, se encuentran:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (287, CAST(N'2021-08-26T19:51:33.3473460' AS DateTime2), N'54', N'El relieve del Chaco característico es:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (288, CAST(N'2021-08-26T19:52:04.5376450' AS DateTime2), N'53', N'¿Qué curso de agua se encuentra emplazado entre la provincia del Chaco y Formosa?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (289, CAST(N'2021-08-26T19:53:09.1621090' AS DateTime2), N'52', N'La Feria de Artesanía Aborigen Chaqueña se realiza en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (290, CAST(N'2021-08-26T19:53:25.7015420' AS DateTime2), N'51', N'Las Reservas Naturales del Chaco son:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (291, CAST(N'2021-08-26T19:53:49.9697600' AS DateTime2), N'50', N'La Fiesta Nacional del Algodón se desarrolla en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (292, CAST(N'2021-08-26T19:54:00.9475300' AS DateTime2), N'49', N'La Fiesta Provincial del Chivo se desarrolla en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (293, CAST(N'2021-08-26T19:54:23.5563080' AS DateTime2), N'48', N'El Festival Nacional Taninero se desarrolla en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (294, CAST(N'2021-08-26T19:54:41.2344830' AS DateTime2), N'47', N'La Fiesta Provincial del Inmigrante se realiza en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (295, CAST(N'2021-08-26T19:55:01.0779250' AS DateTime2), N'46', N'En Isla del Cerrito se realiza la:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (296, CAST(N'2021-08-26T19:55:20.1575780' AS DateTime2), N'45', N'Campo del Cielo es reconocido por:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (297, CAST(N'2021-08-26T19:59:55.7244400' AS DateTime2), N'43', N'La capital de la Gobernación del Chaco se ubicaba en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (298, CAST(N'2021-08-26T20:00:37.4059170' AS DateTime2), N'40', N'¿Cuántos departamentos tiene la provincia del Chaco?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (299, CAST(N'2021-08-26T20:00:51.3472240' AS DateTime2), N'39', N'Nuestra primera constitución se promulgó en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
GO
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (300, CAST(N'2021-08-26T20:01:05.2795030' AS DateTime2), N'38', N'Las localidades algodoneras fueron:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (301, CAST(N'2021-08-26T20:01:18.9785210' AS DateTime2), N'37', N'El tanino se desarrolló en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (302, CAST(N'2021-08-26T20:02:02.0073850' AS DateTime2), N'36', N'A inicios del siglo XX, la actividad económica más importante del territorio era?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (303, CAST(N'2021-08-26T20:02:34.4621260' AS DateTime2), N'35', N'Con la llegada de los inmigrantes se dio a raíz a:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (304, CAST(N'2021-08-26T20:02:59.0556440' AS DateTime2), N'34', N'La Conquista Militar del Chaco se produjo:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (305, CAST(N'2021-08-26T20:03:19.8541220' AS DateTime2), N'33', N'Las autoridades que administraban la Gobernación del Chaco:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (306, CAST(N'2021-08-26T20:04:28.9126730' AS DateTime2), N'25', N'Nuestras primeras poblaciones originarias, pertenecían a las etnias:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (307, CAST(N'2021-08-26T20:05:11.3267000' AS DateTime2), N'27', N'¿Quién fue el primer gobernador de la Provincia del Chaco?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (308, CAST(N'2021-08-26T20:06:33.6886100' AS DateTime2), N'26', N'Al sur, el límite establecido entre la Provincia del Chaco y Santa Fe es:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (309, CAST(N'2021-08-26T20:07:58.8058770' AS DateTime2), N'23', N'El Puente General Belgrano que une las provincias de Chaco y Corrientes se terminó de construir en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (310, CAST(N'2021-08-26T20:08:38.8179680' AS DateTime2), N'22', N'En 1939 es erigida la Diócesis de Resistencia ¿Quién fue el primer obispo?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (311, CAST(N'2021-08-26T20:09:45.3754990' AS DateTime2), N'21', N'Un conjunto coral chaqueño fue reconocido como “Patrimonio Cultural Viviente" ¿Cuál es?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (312, CAST(N'2021-08-26T20:10:55.6696390' AS DateTime2), N'19', N'La producción destacada chaqueña que perdura en la memoria y por la cual se la reconoce a la provincia fue:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (313, CAST(N'2021-08-26T20:12:18.3040410' AS DateTime2), N'18', N'En un emblemático edificio de la ciudad de Resistencia se encuentra un mural del reconocido pintor Emilio Pettoruti ¿Dónde se encuentra emplazado?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (314, CAST(N'2021-08-26T20:13:15.9921100' AS DateTime2), N'17', N'En la bandera del Chaco hay un arado rodeado de 25 estrellas ¿Qué representan?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (315, CAST(N'2021-08-26T20:14:36.7365860' AS DateTime2), N'16', N'Un escritor reconocido en el ámbito chaqueño recibió el Premio Pionero de la Letras Chaqueñas, otorgado por la provincia del Chaco y la SADE local en 1985. ¿Quién fue?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (316, CAST(N'2021-08-26T20:15:17.8897510' AS DateTime2), N'15', N'¿Quién fue el primer gobernador del Territorio Nacional del Chaco?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (317, CAST(N'2021-08-26T20:15:48.4076510' AS DateTime2), N'13', N'La superficie total de la provincia del Chaco es de:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (318, CAST(N'2021-08-26T20:16:31.2872680' AS DateTime2), N'12', N'La palabra Chacú del cual deriva el nombre de nuestra provincia, tenía un significado ¿Cuál era?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (319, CAST(N'2021-08-26T20:17:33.4674080' AS DateTime2), N'11', N'Por Decreto N° 1491 el Gobierno de la Provincia del Chaco se declaró a un instrumento musical como “Patrimonio Cultural de la provincia del Chaco”, ¿Cuál es?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (320, CAST(N'2021-08-26T20:17:54.9245120' AS DateTime2), N'10', N'El club de fútbol más antiguo del Chaco es:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (321, CAST(N'2021-08-26T20:18:21.4348780' AS DateTime2), N'9', N'Marcela Gómez, chaqueña, participó en los Juegos Olímpicos de Tokio en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (322, CAST(N'2021-08-26T20:19:00.9258360' AS DateTime2), N'8', N'En el ámbito de los juegos olímpicos, el Chaco tiene un medallista en:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (323, CAST(N'2021-08-26T20:19:36.8349360' AS DateTime2), N'7', N'En el ámbito automovilístico deportivo Chaco tiene un exponente a nivel nacional e internacional, ¿Quién es?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (324, CAST(N'2021-08-26T20:20:12.9730050' AS DateTime2), N'5', N'Al norte el límite natural establecido entre la Provincia de Chaco y Formosa es:', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (325, CAST(N'2021-08-26T20:20:52.9774910' AS DateTime2), N'4', N'Campo del Cielo: Patrimonio Cultural y Turístico del Chaco, ¿Dónde se ubica?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (326, CAST(N'2021-08-26T20:21:29.9598690' AS DateTime2), N'3', N'¿En qué sectores se divide geográficamente la provincia del Chaco?', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 8, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (327, CAST(N'2021-08-26T20:27:22.4463700' AS DateTime2), N'13', N'Litoral Chaqueño, centro Chaqueño e Impenetrable Chaqueño', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (328, CAST(N'2021-08-26T20:28:17.4852200' AS DateTime2), N'9', N'Chaco Boreal y Chaco Austral', 3, N'', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (329, CAST(N'2021-08-26T20:28:17.4912500' AS DateTime2), N'8', N'Litoral Chaqueño e Impenetrable Chaqueño', 3, N'', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (330, CAST(N'2021-08-26T20:28:17.4972130' AS DateTime2), N'7', N'Litoral Chaqueño, centro Chaqueño e Impenetrable', 3, N'', 9, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (331, CAST(N'2021-08-26T20:42:54.7296720' AS DateTime2), N'6', N'CIENCIA Y EDUCACION', 2, N'[{"changed": {"fields": ["Descripcion"]}}]', 7, 1)
SET IDENTITY_INSERT [dbo].[django_admin_log] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'categorias', N'categoria')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (10, N'partidas', N'partida')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'preguntas', N'pregunta')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (9, N'respuestas', N'respuesta')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
GO
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2021-08-26T04:46:15.7980380' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(N'2021-08-26T04:46:15.8959850' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(N'2021-08-26T04:46:15.9829350' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2021-08-26T04:46:16.0129170' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2021-08-26T04:46:16.0359070' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2021-08-26T04:46:17.0241620' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2021-08-26T04:46:17.0451410' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', CAST(N'2021-08-26T04:46:17.0681240' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', CAST(N'2021-08-26T04:46:17.0931110' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', CAST(N'2021-08-26T04:46:17.1210950' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', CAST(N'2021-08-26T04:46:17.1290910' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2021-08-26T04:46:17.1480790' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', CAST(N'2021-08-26T04:46:17.9514740' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2021-08-26T04:46:17.9824360' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', CAST(N'2021-08-26T04:46:18.7888400' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', CAST(N'2021-08-26T04:46:18.8108520' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'categorias', N'0001_initial', CAST(N'2021-08-26T04:46:18.8268190' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'partidas', N'0001_initial', CAST(N'2021-08-26T04:46:18.8595930' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'preguntas', N'0001_initial', CAST(N'2021-08-26T04:46:18.8827190' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (20, N'respuestas', N'0001_initial', CAST(N'2021-08-26T04:46:18.9258390' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (21, N'sessions', N'0001_initial', CAST(N'2021-08-26T04:46:18.9418290' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (22, N'preguntas', N'0002_auto_20210826_1632', CAST(N'2021-08-26T19:33:33.4408180' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (23, N'respuestas', N'0002_auto_20210826_1632', CAST(N'2021-08-26T19:33:33.4728090' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (24, N'partidas', N'0002_auto_20210901_1453', CAST(N'2021-09-01T17:53:53.2216490' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (25, N'respuestas', N'0002_auto_20210901_1453', CAST(N'2021-09-01T17:56:36.3673200' AS DateTime2))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
GO
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'lgww6fxyvrdag4yy2uzzctm8bd126dsf', N'MTdlZDMxZTZlNmY1YTJhODQ1YzAzNzFhNDFkM2ZiMmU0M2QxNTU5Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZmI1ZjlmZTg4M2Q3YWQ4N2JhNzVkNjA5NDI1NWFjYWU1MWM4ZDA4In0=', CAST(N'2021-09-13T17:09:55.7404810' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[preguntas_pregunta] ON 

INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (1, CAST(N'2021-08-26T05:04:45.9700820' AS DateTime2), CAST(N'2021-08-26T05:04:45.9700820' AS DateTime2), N'Resistencia es conocida como:', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (2, CAST(N'2021-08-26T05:07:14.1785390' AS DateTime2), CAST(N'2021-08-26T05:07:14.1785390' AS DateTime2), N'¿Cuántas esculturas hay en Resistencia?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (3, CAST(N'2021-08-26T05:08:18.8581820' AS DateTime2), CAST(N'2021-08-26T05:08:18.8581820' AS DateTime2), N'¿En qué sectores se divide geográficamente la provincia del Chaco?', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (4, CAST(N'2021-08-26T11:29:17.1616370' AS DateTime2), CAST(N'2021-08-26T11:29:17.1616370' AS DateTime2), N'Campo del Cielo: Patrimonio Cultural y Turístico del Chaco, ¿Dónde se ubica?', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (5, CAST(N'2021-08-26T11:34:26.8376240' AS DateTime2), CAST(N'2021-08-26T11:34:26.8376240' AS DateTime2), N'Al norte el límite natural establecido entre la Provincia de Chaco y Formosa es:', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (6, CAST(N'2021-08-26T11:35:49.5224700' AS DateTime2), CAST(N'2021-08-26T11:35:49.5224700' AS DateTime2), N'El ex ferrocarril General Belgrano conectaba a:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (7, CAST(N'2021-08-26T11:36:04.8968530' AS DateTime2), CAST(N'2021-08-26T11:36:04.8968530' AS DateTime2), N'En el ámbito automovilístico deportivo Chaco tiene un exponente a nivel nacional e internacional, ¿Quién es?', 3, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (8, CAST(N'2021-08-26T11:36:18.7810540' AS DateTime2), CAST(N'2021-08-26T11:36:18.7810540' AS DateTime2), N'En el ámbito de los juegos olímpicos, el Chaco tiene un medallista en:', 3, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (9, CAST(N'2021-08-26T11:36:33.3415890' AS DateTime2), CAST(N'2021-08-26T11:36:33.3415890' AS DateTime2), N'Marcela Gómez, chaqueña, participó en los Juegos Olímpicos de Tokio en:', 3, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (10, CAST(N'2021-08-26T11:36:54.9684650' AS DateTime2), CAST(N'2021-08-26T11:36:54.9684650' AS DateTime2), N'El club de fútbol más antiguo del Chaco es:', 3, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (11, CAST(N'2021-08-26T11:37:23.4733510' AS DateTime2), CAST(N'2021-08-26T11:37:23.4733510' AS DateTime2), N'Por Decreto N° 1491 el Gobierno de la Provincia del Chaco se declaró a un instrumento musical como “Patrimonio Cultural de la provincia del Chaco”, ¿Cuál es?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (12, CAST(N'2021-08-26T11:37:50.2573410' AS DateTime2), CAST(N'2021-08-26T11:37:50.2573410' AS DateTime2), N'La palabra Chacú del cual deriva el nombre de nuestra provincia, tenía un significado ¿Cuál era?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (13, CAST(N'2021-08-26T11:38:17.2537120' AS DateTime2), CAST(N'2021-08-26T11:38:17.2537120' AS DateTime2), N'La superficie total de la provincia del Chaco es de:', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (14, CAST(N'2021-08-26T11:38:46.2353600' AS DateTime2), CAST(N'2021-08-26T11:38:46.2353600' AS DateTime2), N'La población actual del Chaco oscila entre:', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (15, CAST(N'2021-08-26T11:39:05.0363630' AS DateTime2), CAST(N'2021-08-26T11:39:05.0363630' AS DateTime2), N'¿Quién fue el primer gobernador del Territorio Nacional del Chaco?', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (16, CAST(N'2021-08-26T11:40:06.4157340' AS DateTime2), CAST(N'2021-08-26T11:40:06.4157340' AS DateTime2), N'Un escritor reconocido en el ámbito chaqueño recibió el Premio Pionero de la Letras Chaqueñas, otorgado por la provincia del Chaco y la SADE local en 1985. ¿Quién fue?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (17, CAST(N'2021-08-26T11:40:27.3991680' AS DateTime2), CAST(N'2021-08-26T11:40:27.3991680' AS DateTime2), N'En la bandera del Chaco hay un arado rodeado de 25 estrellas ¿Qué representan?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (18, CAST(N'2021-08-26T11:40:46.1294060' AS DateTime2), CAST(N'2021-08-26T11:40:46.1294060' AS DateTime2), N'En un emblemático edificio de la ciudad de Resistencia se encuentra un mural del reconocido pintor Emilio Pettoruti ¿Dónde se encuentra emplazado?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (19, CAST(N'2021-08-26T11:42:13.1170480' AS DateTime2), CAST(N'2021-08-26T11:42:13.1170480' AS DateTime2), N'La producción destacada chaqueña que perdura en la memoria y por la cual se la reconoce a la provincia fue:', 5, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (20, CAST(N'2021-08-26T11:43:04.3790500' AS DateTime2), CAST(N'2021-08-26T11:43:04.3790500' AS DateTime2), N'¿Cuál es la flor provincial del Chaco?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (21, CAST(N'2021-08-26T11:43:51.4528870' AS DateTime2), CAST(N'2021-08-26T11:43:51.4528870' AS DateTime2), N'Un conjunto coral chaqueño fue reconocido como “Patrimonio Cultural Viviente" ¿Cuál es?', 1, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (22, CAST(N'2021-08-26T11:44:13.6961170' AS DateTime2), CAST(N'2021-08-26T11:44:13.6971100' AS DateTime2), N'En 1939 es erigida la Diócesis de Resistencia ¿Quién fue el primer obispo?', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (23, CAST(N'2021-08-26T11:44:29.5735540' AS DateTime2), CAST(N'2021-08-26T11:44:29.5735540' AS DateTime2), N'El Puente General Belgrano que une las provincias de Chaco y Corrientes se terminó de construir en:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (24, CAST(N'2021-08-26T11:45:04.8547480' AS DateTime2), CAST(N'2021-08-26T11:45:04.8557470' AS DateTime2), N'¿Desde cuándo existe la Provincia del Chaco?', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (25, CAST(N'2021-08-26T11:45:32.7515510' AS DateTime2), CAST(N'2021-08-26T11:45:32.7515510' AS DateTime2), N'Nuestras primeras poblaciones originarias, pertenecían a las etnias:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (26, CAST(N'2021-08-26T12:35:20.2823080' AS DateTime2), CAST(N'2021-08-26T12:35:20.2823080' AS DateTime2), N'Al sur, el límite establecido entre la Provincia del Chaco y Santa Fe es:', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (27, CAST(N'2021-08-26T13:37:19.4463810' AS DateTime2), CAST(N'2021-08-26T13:37:19.4463810' AS DateTime2), N'¿Quién fue el primer gobernador de la Provincia del Chaco?', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (28, CAST(N'2021-08-26T13:40:32.0947980' AS DateTime2), CAST(N'2021-08-26T13:40:32.0947980' AS DateTime2), N'La primera ciudad colonial del Chaco fue:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (29, CAST(N'2021-08-26T13:40:57.0372460' AS DateTime2), CAST(N'2021-08-26T13:40:57.0372460' AS DateTime2), N'San Fernando del Río Negro fue una:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (30, CAST(N'2021-08-26T13:41:13.8716470' AS DateTime2), CAST(N'2021-08-26T13:41:13.8716470' AS DateTime2), N'¿Qué reducciones franciscanas se fundaron en el actual territorio del Chaco a finales del siglo XVIII?', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (31, CAST(N'2021-08-26T13:41:47.7808760' AS DateTime2), CAST(N'2021-08-26T13:41:47.7808760' AS DateTime2), N'La Gobernación del Chaco se creó en:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (32, CAST(N'2021-08-26T13:42:08.6322840' AS DateTime2), CAST(N'2021-08-26T13:42:08.6322840' AS DateTime2), N'La ley 1532 divido a la Gobernación del Chaco en:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (33, CAST(N'2021-08-26T13:42:31.9729930' AS DateTime2), CAST(N'2021-08-26T13:42:31.9729930' AS DateTime2), N'Las autoridades que administraban la Gobernación del Chaco:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (34, CAST(N'2021-08-26T13:42:54.9457770' AS DateTime2), CAST(N'2021-08-26T13:42:54.9457770' AS DateTime2), N'La Conquista Militar del Chaco se produjo:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (35, CAST(N'2021-08-26T13:43:11.7967660' AS DateTime2), CAST(N'2021-08-26T13:43:11.7967660' AS DateTime2), N'Con la llegada de los inmigrantes se dio a raíz a:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (36, CAST(N'2021-08-26T13:43:27.9517510' AS DateTime2), CAST(N'2021-08-26T13:43:27.9517510' AS DateTime2), N'A inicios del siglo XX, la actividad económica más importante del territorio era?', 5, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (37, CAST(N'2021-08-26T13:44:11.6669910' AS DateTime2), CAST(N'2021-08-26T13:44:11.6669910' AS DateTime2), N'El tanino se desarrolló en:', 5, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (38, CAST(N'2021-08-26T13:44:42.8916730' AS DateTime2), CAST(N'2021-08-26T13:44:42.8916730' AS DateTime2), N'Las localidades algodoneras fueron:', 5, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (39, CAST(N'2021-08-26T13:44:55.5317640' AS DateTime2), CAST(N'2021-08-26T13:44:55.5317640' AS DateTime2), N'Nuestra primera constitución se promulgó en:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (40, CAST(N'2021-08-26T13:45:18.8677140' AS DateTime2), CAST(N'2021-08-26T13:45:18.8677140' AS DateTime2), N'¿Cuántos departamentos tiene la provincia del Chaco?', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (41, CAST(N'2021-08-26T13:45:33.4277490' AS DateTime2), CAST(N'2021-08-26T13:45:33.4277490' AS DateTime2), N'¿Cuántas rutas nacionales recorren la provincia?', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (42, CAST(N'2021-08-26T13:45:48.7087100' AS DateTime2), CAST(N'2021-08-26T13:45:48.7087100' AS DateTime2), N'La Ruta Nacional 16 recorre entre:', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (43, CAST(N'2021-08-26T14:14:40.3364930' AS DateTime2), CAST(N'2021-08-26T14:14:40.3364930' AS DateTime2), N'La capital de la Gobernación del Chaco se ubicaba en:', 2, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (44, CAST(N'2021-08-26T14:24:11.8356190' AS DateTime2), CAST(N'2021-08-26T14:24:11.8356190' AS DateTime2), N'¿Qué Parques Nacionales existen en el Chaco?', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (45, CAST(N'2021-08-26T14:24:27.1858860' AS DateTime2), CAST(N'2021-08-26T14:24:27.1858860' AS DateTime2), N'Campo del Cielo es reconocido por:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (46, CAST(N'2021-08-26T14:24:39.0927310' AS DateTime2), CAST(N'2021-08-26T14:24:39.0937370' AS DateTime2), N'En Isla del Cerrito se realiza la:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (47, CAST(N'2021-08-26T14:24:54.9835600' AS DateTime2), CAST(N'2021-08-26T14:24:54.9835600' AS DateTime2), N'La Fiesta Provincial del Inmigrante se realiza en:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (48, CAST(N'2021-08-26T14:25:11.6888610' AS DateTime2), CAST(N'2021-08-26T14:25:11.6888610' AS DateTime2), N'El Festival Nacional Taninero se desarrolla en:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (49, CAST(N'2021-08-26T14:25:32.0855890' AS DateTime2), CAST(N'2021-08-26T14:25:32.0855890' AS DateTime2), N'La Fiesta Provincial del Chivo se desarrolla en:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (50, CAST(N'2021-08-26T14:25:44.2103700' AS DateTime2), CAST(N'2021-08-26T14:25:44.2103700' AS DateTime2), N'La Fiesta Nacional del Algodón se desarrolla en:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (51, CAST(N'2021-08-26T14:28:07.7729460' AS DateTime2), CAST(N'2021-08-26T14:28:07.7729460' AS DateTime2), N'Las Reservas Naturales del Chaco son:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (52, CAST(N'2021-08-26T14:28:22.3501610' AS DateTime2), CAST(N'2021-08-26T14:28:22.3511780' AS DateTime2), N'La Feria de Artesanía Aborigen Chaqueña se realiza en:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (53, CAST(N'2021-08-26T14:28:37.7658270' AS DateTime2), CAST(N'2021-08-26T14:28:37.7658270' AS DateTime2), N'¿Qué curso de agua se encuentra emplazado entre la provincia del Chaco y Formosa?', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (54, CAST(N'2021-08-26T14:28:50.6935650' AS DateTime2), CAST(N'2021-08-26T14:28:50.6935650' AS DateTime2), N'El relieve del Chaco característico es:', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (55, CAST(N'2021-08-26T14:29:12.3448010' AS DateTime2), CAST(N'2021-08-26T14:29:12.3448010' AS DateTime2), N'Entre los ríos autóctonos del Chaco, se encuentran:', 4, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (56, CAST(N'2021-08-26T14:29:40.2360120' AS DateTime2), CAST(N'2021-08-26T14:29:40.2360120' AS DateTime2), N'Juan José Castelli es considerada como:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (57, CAST(N'2021-08-26T14:29:59.3897490' AS DateTime2), CAST(N'2021-08-26T14:29:59.3897490' AS DateTime2), N'La ciudad de las Breñas logró jugar en el Campeonato Argentino de Clubes en:', 3, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (58, CAST(N'2021-08-26T14:30:53.2687560' AS DateTime2), CAST(N'2021-08-26T14:30:53.2687560' AS DateTime2), N'En el municipio de Colonia Benítez se encuentra:', 6, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (59, CAST(N'2021-08-26T14:31:59.6586360' AS DateTime2), CAST(N'2021-08-26T14:31:59.6586360' AS DateTime2), N'La patrona de Barranqueras es:', 6, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (60, CAST(N'2021-08-26T14:32:13.1656190' AS DateTime2), CAST(N'2021-08-26T14:32:13.1656190' AS DateTime2), N'El Patrono de la ciudad de Resistencia es:', 6, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (61, CAST(N'2021-08-26T14:32:26.8595210' AS DateTime2), CAST(N'2021-08-26T14:32:26.8605130' AS DateTime2), N'En Presidencia Roque Saénz Peña se encuentra:', 6, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (62, CAST(N'2021-08-26T14:32:58.9638960' AS DateTime2), CAST(N'2021-08-26T14:32:58.9638960' AS DateTime2), N'En Las Palmas se puede recorrer:', 7, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (63, CAST(N'2021-09-02T19:41:00.9932870' AS DateTime2), CAST(N'2021-09-02T19:41:00.9932870' AS DateTime2), N'La provincia es generalmente asociada en forma directa a la producción de algodón, pero este no es el único cultivo agrícola importante para su economía. Entre los más importantes también se encuentran:', 5, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (64, CAST(N'2021-09-02T19:43:11.4019090' AS DateTime2), CAST(N'2021-09-02T19:43:11.4029070' AS DateTime2), N'¿Quién es el actual Ministro de Economía e Infraestructura?', 5, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (65, CAST(N'2021-09-02T19:45:40.3280980' AS DateTime2), CAST(N'2021-09-02T19:45:40.3290960' AS DateTime2), N'Un proyecto de investigadores del CONICET y de la Universidad del Chaco Austral (UNCAUS), busca obtener a través de procesos tecnológicos que saldrán aplicados por primera vez en Argentina:', 6, 0)
INSERT [dbo].[preguntas_pregunta] ([id], [creado], [modificado], [descripcion], [categoria_id], [mostrada]) VALUES (66, CAST(N'2021-09-02T19:47:22.2006980' AS DateTime2), CAST(N'2021-09-02T19:47:22.2006980' AS DateTime2), N'¿Qué es CONICET Digital?', 6, 0)
SET IDENTITY_INSERT [dbo].[preguntas_pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[respuestas_respuesta] ON 

INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (1, CAST(N'2021-08-26T05:05:29.5929080' AS DateTime2), CAST(N'2021-08-26T05:05:29.5929080' AS DateTime2), N'La ciudad de las esculturas', 1, 0, 1)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (2, CAST(N'2021-08-26T05:05:42.6589380' AS DateTime2), CAST(N'2021-08-26T05:05:42.6589380' AS DateTime2), N'Ciudad Museo', 0, 0, 1)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (3, CAST(N'2021-08-26T05:05:58.2057470' AS DateTime2), CAST(N'2021-08-26T05:05:58.2057470' AS DateTime2), N'Ciudad Capital', 0, 0, 1)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (4, CAST(N'2021-08-26T05:09:33.0377660' AS DateTime2), CAST(N'2021-08-26T05:09:33.0377660' AS DateTime2), N'200', 0, 0, 2)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (5, CAST(N'2021-08-26T05:09:42.6062720' AS DateTime2), CAST(N'2021-08-26T05:09:42.6062720' AS DateTime2), N'700', 0, 0, 2)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (6, CAST(N'2021-08-26T05:09:56.2754580' AS DateTime2), CAST(N'2021-08-26T05:09:56.2754580' AS DateTime2), N'600', 1, 0, 2)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (10, CAST(N'2021-08-26T11:32:20.4208020' AS DateTime2), CAST(N'2021-08-26T11:32:20.4208020' AS DateTime2), N'Maipú', 0, 0, 4)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (11, CAST(N'2021-08-26T11:32:37.6036490' AS DateTime2), CAST(N'2021-08-26T11:32:37.6036490' AS DateTime2), N'Bermejo', 0, 0, 4)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (12, CAST(N'2021-08-26T11:32:57.2792010' AS DateTime2), CAST(N'2021-08-26T11:32:57.2792010' AS DateTime2), N'12 de Octubre', 1, 0, 4)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (13, CAST(N'2021-08-26T12:29:19.8949460' AS DateTime2), CAST(N'2021-08-26T12:29:19.8949460' AS DateTime2), N'Litoral Chaqueño, centro Chaqueño e Impenetrable Chaqueño', 1, 0, 3)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (14, CAST(N'2021-08-26T12:29:42.3991600' AS DateTime2), CAST(N'2021-08-26T12:29:42.3991600' AS DateTime2), N'Litoral Chaqueño e Impenetrable Chaqueño', 0, 0, 3)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (15, CAST(N'2021-08-26T12:30:08.9082710' AS DateTime2), CAST(N'2021-08-26T12:30:08.9082710' AS DateTime2), N'Chaco Boreal y Chaco Austral', 0, 0, 3)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (19, CAST(N'2021-08-26T12:33:07.0694330' AS DateTime2), CAST(N'2021-08-26T12:33:07.0694330' AS DateTime2), N'Pilcomayo', 0, 0, 5)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (20, CAST(N'2021-08-26T12:33:18.0862300' AS DateTime2), CAST(N'2021-08-26T12:33:18.0862300' AS DateTime2), N'Paraná', 0, 0, 5)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (21, CAST(N'2021-08-26T12:33:55.2068910' AS DateTime2), CAST(N'2021-08-26T12:33:55.2068910' AS DateTime2), N'Bermejo', 1, 0, 5)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (22, CAST(N'2021-08-26T12:36:01.6207640' AS DateTime2), CAST(N'2021-08-26T12:36:01.6207640' AS DateTime2), N'Paralelo 28', 1, 0, 26)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (23, CAST(N'2021-08-26T12:36:29.2681700' AS DateTime2), CAST(N'2021-08-26T12:36:29.2681700' AS DateTime2), N'Paralelo 30', 0, 0, 26)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (24, CAST(N'2021-08-26T12:36:43.1211910' AS DateTime2), CAST(N'2021-08-26T12:36:43.1211910' AS DateTime2), N'Paralelo 29', 0, 0, 26)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (25, CAST(N'2021-08-26T12:40:55.0640550' AS DateTime2), CAST(N'2021-08-26T12:40:55.0640550' AS DateTime2), N'Puerto de Barranqueras con Formosa', 0, 0, 6)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (26, CAST(N'2021-08-26T12:41:23.8593510' AS DateTime2), CAST(N'2021-08-26T12:41:23.8593510' AS DateTime2), N'Puerto de Barranqueras con Salta', 1, 0, 6)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (27, CAST(N'2021-08-26T12:42:01.6000100' AS DateTime2), CAST(N'2021-08-26T12:42:01.6000100' AS DateTime2), N'Puerto de Barranqueras con Santiago del Estero', 0, 0, 6)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (28, CAST(N'2021-08-26T13:06:18.7345730' AS DateTime2), CAST(N'2021-08-26T13:06:18.7345730' AS DateTime2), N'Juan Manel Silva', 1, 0, 7)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (29, CAST(N'2021-08-26T13:06:37.1301400' AS DateTime2), CAST(N'2021-08-26T13:06:37.1301400' AS DateTime2), N'Giorgio Carrara', 0, 0, 7)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (30, CAST(N'2021-08-26T13:06:56.7649060' AS DateTime2), CAST(N'2021-08-26T13:06:56.7649060' AS DateTime2), N'Marcos Siebert', 0, 0, 7)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (31, CAST(N'2021-08-26T13:07:18.7022770' AS DateTime2), CAST(N'2021-08-26T13:07:18.7022770' AS DateTime2), N'Básquet', 1, 0, 8)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (33, CAST(N'2021-08-26T13:08:05.8125970' AS DateTime2), CAST(N'2021-08-26T13:08:05.8125970' AS DateTime2), N'Fútbol', 0, 0, 8)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (34, CAST(N'2021-08-26T13:08:26.5970830' AS DateTime2), CAST(N'2021-08-26T13:08:26.5970830' AS DateTime2), N'Jockey', 0, 0, 8)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (35, CAST(N'2021-08-26T13:09:25.4644150' AS DateTime2), CAST(N'2021-08-26T13:09:25.4644150' AS DateTime2), N'Natación', 0, 0, 9)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (36, CAST(N'2021-08-26T13:09:36.1780270' AS DateTime2), CAST(N'2021-08-26T13:09:36.1780270' AS DateTime2), N'Remo', 0, 0, 9)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (37, CAST(N'2021-08-26T13:09:46.7233460' AS DateTime2), CAST(N'2021-08-26T13:09:46.7233460' AS DateTime2), N'Atletismo', 1, 0, 9)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (38, CAST(N'2021-08-26T13:10:08.7307880' AS DateTime2), CAST(N'2021-08-26T13:10:08.7307880' AS DateTime2), N'For Ever', 0, 0, 10)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (39, CAST(N'2021-08-26T13:10:27.8485150' AS DateTime2), CAST(N'2021-08-26T13:10:27.8485150' AS DateTime2), N'Sarmiento', 1, 0, 10)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (40, CAST(N'2021-08-26T13:10:44.4970200' AS DateTime2), CAST(N'2021-08-26T13:10:44.4970200' AS DateTime2), N'Don Orione', 0, 0, 10)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (41, CAST(N'2021-08-26T13:11:44.4352020' AS DateTime2), CAST(N'2021-08-26T13:11:44.4352020' AS DateTime2), N'Acordeón', 0, 0, 11)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (42, CAST(N'2021-08-26T13:12:08.1198140' AS DateTime2), CAST(N'2021-08-26T13:12:08.1198140' AS DateTime2), N'N''viké', 1, 0, 11)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (43, CAST(N'2021-08-26T13:14:49.5379950' AS DateTime2), CAST(N'2021-08-26T13:14:49.5379950' AS DateTime2), N'Charango', 0, 0, 11)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (44, CAST(N'2021-08-26T13:15:23.7332070' AS DateTime2), CAST(N'2021-08-26T13:15:23.7332070' AS DateTime2), N'La caza comunal de animales', 1, 0, 12)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (45, CAST(N'2021-08-26T13:15:53.9383420' AS DateTime2), CAST(N'2021-08-26T13:15:53.9383420' AS DateTime2), N'Nombre de un árbol que abunda en la región', 0, 0, 12)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (46, CAST(N'2021-08-26T13:16:10.2748500' AS DateTime2), CAST(N'2021-08-26T13:16:10.2748500' AS DateTime2), N'Nombre de un animal', 0, 0, 12)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (47, CAST(N'2021-08-26T13:17:01.6989240' AS DateTime2), CAST(N'2021-08-26T13:17:01.6989240' AS DateTime2), N'99.633 Km²', 1, 0, 13)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (48, CAST(N'2021-08-26T13:17:17.2313110' AS DateTime2), CAST(N'2021-08-26T13:17:17.2313110' AS DateTime2), N'32.565 Km²', 0, 0, 13)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (49, CAST(N'2021-08-26T13:17:35.5614670' AS DateTime2), CAST(N'2021-08-26T13:17:35.5614670' AS DateTime2), N'29.900 Km²', 0, 0, 13)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (50, CAST(N'2021-08-26T13:17:53.8855800' AS DateTime2), CAST(N'2021-08-26T13:17:53.8865810' AS DateTime2), N'300.000', 0, 0, 14)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (51, CAST(N'2021-08-26T13:18:07.8265340' AS DateTime2), CAST(N'2021-08-26T13:18:07.8265340' AS DateTime2), N'2.000.000', 0, 0, 14)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (52, CAST(N'2021-08-26T13:18:25.7319730' AS DateTime2), CAST(N'2021-08-26T13:18:25.7319730' AS DateTime2), N'1.000.000', 1, 0, 14)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (53, CAST(N'2021-08-26T13:18:51.8141520' AS DateTime2), CAST(N'2021-08-26T13:18:51.8141520' AS DateTime2), N'Gral. Lorenzo Winter', 0, 0, 15)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (54, CAST(N'2021-08-26T13:19:07.9001890' AS DateTime2), CAST(N'2021-08-26T13:19:07.9001890' AS DateTime2), N'Gral. Julio de Vedia', 1, 0, 15)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (55, CAST(N'2021-08-26T13:19:37.7839080' AS DateTime2), CAST(N'2021-08-26T13:19:37.7839080' AS DateTime2), N'Gral. Antonio Dónovan', 0, 0, 15)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (56, CAST(N'2021-08-26T13:19:53.2776410' AS DateTime2), CAST(N'2021-08-26T13:19:53.2776410' AS DateTime2), N'Tony Zalazar', 0, 0, 16)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (57, CAST(N'2021-08-26T13:20:21.4626900' AS DateTime2), CAST(N'2021-08-26T13:20:21.4626900' AS DateTime2), N'Aledo Luis Meloni', 1, 0, 16)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (58, CAST(N'2021-08-26T13:21:08.4128290' AS DateTime2), CAST(N'2021-08-26T13:21:08.4128290' AS DateTime2), N'Tete Romero', 0, 0, 16)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (59, CAST(N'2021-08-26T13:22:07.9185010' AS DateTime2), CAST(N'2021-08-26T13:22:07.9185010' AS DateTime2), N'Los Departamentos Provinciales', 1, 0, 17)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (60, CAST(N'2021-08-26T13:22:26.0764650' AS DateTime2), CAST(N'2021-08-26T13:22:26.0764650' AS DateTime2), N'Las ciudades principales', 0, 0, 17)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (61, CAST(N'2021-08-26T13:23:02.5876680' AS DateTime2), CAST(N'2021-08-26T13:23:02.5876680' AS DateTime2), N'Grandes personajes que forzaron Chaco', 0, 0, 17)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (62, CAST(N'2021-08-26T13:23:39.2414420' AS DateTime2), CAST(N'2021-08-26T13:23:39.2414420' AS DateTime2), N'La Municipalidad de la Ciudad', 0, 0, 18)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (63, CAST(N'2021-08-26T13:25:07.4254430' AS DateTime2), CAST(N'2021-08-26T13:25:07.4264440' AS DateTime2), N'El Fogón de los Arrieros', 0, 0, 18)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (64, CAST(N'2021-08-26T13:25:32.0519850' AS DateTime2), CAST(N'2021-08-26T13:25:32.0519850' AS DateTime2), N'Casa de Gobierno', 1, 0, 18)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (65, CAST(N'2021-08-26T13:25:48.2935370' AS DateTime2), CAST(N'2021-08-26T13:25:48.2935370' AS DateTime2), N'Caña de azúcar', 0, 0, 19)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (66, CAST(N'2021-08-26T13:26:09.1706760' AS DateTime2), CAST(N'2021-08-26T13:26:09.1706760' AS DateTime2), N'Algodón', 1, 0, 19)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (67, CAST(N'2021-08-26T13:26:42.0759080' AS DateTime2), CAST(N'2021-08-26T13:26:42.0759080' AS DateTime2), N'Producción de tanino', 0, 0, 19)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (68, CAST(N'2021-08-26T13:27:19.2015740' AS DateTime2), CAST(N'2021-08-26T13:27:19.2015740' AS DateTime2), N'Flor del Cardo', 0, 0, 20)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (69, CAST(N'2021-08-26T13:27:36.1653540' AS DateTime2), CAST(N'2021-08-26T13:27:36.1663510' AS DateTime2), N'Flor del Ceibo', 0, 0, 20)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (70, CAST(N'2021-08-26T13:29:36.7988040' AS DateTime2), CAST(N'2021-08-26T13:29:36.7988040' AS DateTime2), N'Flor Rosada del Palo Borracho', 1, 0, 20)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (71, CAST(N'2021-08-26T13:30:27.9482140' AS DateTime2), CAST(N'2021-08-26T13:30:27.9482140' AS DateTime2), N'El coro polifónico de Resistencia', 0, 0, 21)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (72, CAST(N'2021-08-26T13:30:47.1169400' AS DateTime2), CAST(N'2021-08-26T13:30:47.1169400' AS DateTime2), N'El coro de niños', 0, 0, 21)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (73, CAST(N'2021-08-26T13:31:11.5619430' AS DateTime2), CAST(N'2021-08-26T13:31:11.5619430' AS DateTime2), N'El coro Chelaalapí', 1, 0, 21)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (74, CAST(N'2021-08-26T13:31:30.3627190' AS DateTime2), CAST(N'2021-08-26T13:31:30.3627190' AS DateTime2), N'Gabriel Grotti', 0, 0, 22)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (75, CAST(N'2021-08-26T13:31:49.5711660' AS DateTime2), CAST(N'2021-08-26T13:31:49.5711660' AS DateTime2), N'Nicolás de Carlo', 1, 0, 22)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (76, CAST(N'2021-08-26T13:32:09.8339080' AS DateTime2), CAST(N'2021-08-26T13:32:09.8339080' AS DateTime2), N'José Alumni', 0, 0, 22)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (77, CAST(N'2021-08-26T13:32:23.6267410' AS DateTime2), CAST(N'2021-08-26T13:32:23.6267410' AS DateTime2), N'1973', 0, 0, 23)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (78, CAST(N'2021-08-26T13:32:44.6537730' AS DateTime2), CAST(N'2021-08-26T13:32:44.6547400' AS DateTime2), N'1974', 1, 0, 23)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (79, CAST(N'2021-08-26T13:32:55.6966930' AS DateTime2), CAST(N'2021-08-26T13:32:55.6966930' AS DateTime2), N'1976', 0, 0, 23)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (80, CAST(N'2021-08-26T13:33:55.4184580' AS DateTime2), CAST(N'2021-08-26T13:33:55.4184580' AS DateTime2), N'8 de agosto de 1951', 1, 0, 24)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (81, CAST(N'2021-08-26T13:34:19.6298200' AS DateTime2), CAST(N'2021-08-26T13:34:19.6298200' AS DateTime2), N'8 de agosto de 1958', 0, 0, 24)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (82, CAST(N'2021-08-26T13:34:35.9596840' AS DateTime2), CAST(N'2021-08-26T13:34:35.9596840' AS DateTime2), N'8 de agosto de 1955', 0, 0, 24)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (83, CAST(N'2021-08-26T13:35:01.2568770' AS DateTime2), CAST(N'2021-08-26T13:35:01.2568770' AS DateTime2), N'Qom', 1, 0, 25)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (84, CAST(N'2021-08-26T13:35:23.2031370' AS DateTime2), CAST(N'2021-08-26T13:35:23.2031370' AS DateTime2), N'Moqoi', 1, 0, 25)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (85, CAST(N'2021-08-26T13:35:38.9520330' AS DateTime2), CAST(N'2021-08-26T13:35:38.9520330' AS DateTime2), N'Wichi', 1, 0, 25)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (86, CAST(N'2021-08-26T13:36:00.6621320' AS DateTime2), CAST(N'2021-08-26T13:36:00.6621320' AS DateTime2), N'Vilelas', 1, 0, 25)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (87, CAST(N'2021-08-26T13:36:20.8031770' AS DateTime2), CAST(N'2021-08-26T13:36:20.8031770' AS DateTime2), N'Guaraníes', 0, 0, 25)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (88, CAST(N'2021-08-26T13:39:05.5346520' AS DateTime2), CAST(N'2021-08-26T13:39:05.5346520' AS DateTime2), N'Felipe Gallardo', 1, 0, 27)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (89, CAST(N'2021-08-26T13:39:27.5460950' AS DateTime2), CAST(N'2021-08-26T13:39:27.5460950' AS DateTime2), N'Danilo Baroni', 0, 0, 27)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (90, CAST(N'2021-08-26T13:39:55.9248040' AS DateTime2), CAST(N'2021-08-26T13:39:55.9248040' AS DateTime2), N'Deolindo Bittel', 0, 0, 27)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (91, CAST(N'2021-08-26T13:46:58.7099950' AS DateTime2), CAST(N'2021-08-26T13:46:58.7099950' AS DateTime2), N'Esteco', 0, 0, 28)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (92, CAST(N'2021-08-26T13:49:49.0266100' AS DateTime2), CAST(N'2021-08-26T13:49:49.0266100' AS DateTime2), N'Concepción del Bermejo', 1, 0, 28)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (93, CAST(N'2021-08-26T13:50:45.2694990' AS DateTime2), CAST(N'2021-08-26T13:50:45.2694990' AS DateTime2), N'San Fernando del Río Negro', 0, 0, 28)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (94, CAST(N'2021-08-26T13:51:16.4543520' AS DateTime2), CAST(N'2021-08-26T13:51:16.4543520' AS DateTime2), N'Ciudad española', 0, 0, 29)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (95, CAST(N'2021-08-26T13:51:46.6978170' AS DateTime2), CAST(N'2021-08-26T13:51:46.6978170' AS DateTime2), N'Reducción de los Jesuitas', 1, 0, 29)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (96, CAST(N'2021-08-26T13:52:09.0379120' AS DateTime2), CAST(N'2021-08-26T13:52:09.0379120' AS DateTime2), N'Misión franciscana', 0, 0, 29)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (97, CAST(N'2021-08-26T13:54:36.1889700' AS DateTime2), CAST(N'2021-08-26T13:54:36.1889700' AS DateTime2), N'San Carlos del Timbo', 0, 0, 30)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (98, CAST(N'2021-08-26T13:54:59.8321690' AS DateTime2), CAST(N'2021-08-26T13:54:59.8321690' AS DateTime2), N'San Bernardo de Vértiz', 0, 0, 30)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (99, CAST(N'2021-08-26T13:55:36.4256960' AS DateTime2), CAST(N'2021-08-26T13:55:36.4256960' AS DateTime2), N'Nuestra Señora de los Dolores de la Cangaye', 1, 0, 30)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (100, CAST(N'2021-08-26T13:57:09.3480000' AS DateTime2), CAST(N'2021-08-26T13:57:09.3480000' AS DateTime2), N'1810', 0, 0, 31)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (101, CAST(N'2021-08-26T13:57:33.7640780' AS DateTime2), CAST(N'2021-08-26T13:57:33.7640780' AS DateTime2), N'1862', 1, 0, 31)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (102, CAST(N'2021-08-26T13:58:08.4089150' AS DateTime2), CAST(N'2021-08-26T13:58:08.4089150' AS DateTime2), N'1900', 0, 0, 31)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (103, CAST(N'2021-08-26T13:58:47.9142980' AS DateTime2), CAST(N'2021-08-26T13:58:47.9142980' AS DateTime2), N'Dos Gobernaciones (Chaco Austral y Chaco Central)', 1, 0, 32)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (104, CAST(N'2021-08-26T13:59:05.0391160' AS DateTime2), CAST(N'2021-08-26T13:59:05.0391160' AS DateTime2), N'Tres Gobernaciones', 0, 0, 32)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (105, CAST(N'2021-08-26T13:59:26.9235810' AS DateTime2), CAST(N'2021-08-26T13:59:26.9235810' AS DateTime2), N'Cuatro Gobernaciones', 0, 0, 32)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (106, CAST(N'2021-08-26T14:00:16.8092990' AS DateTime2), CAST(N'2021-08-26T14:00:16.8092990' AS DateTime2), N'Eran elegidas por el voto popular', 0, 0, 33)
GO
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (107, CAST(N'2021-08-26T14:00:46.9540430' AS DateTime2), CAST(N'2021-08-26T14:00:46.9540430' AS DateTime2), N'Eran nombradas por el Poder Ejecutivo Nacional', 1, 0, 33)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (108, CAST(N'2021-08-26T14:01:12.6153560' AS DateTime2), CAST(N'2021-08-26T14:01:12.6153560' AS DateTime2), N'Durante la Triple Alianza', 0, 0, 34)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (109, CAST(N'2021-08-26T14:01:41.7536570' AS DateTime2), CAST(N'2021-08-26T14:01:41.7536570' AS DateTime2), N'Al terminar la guerra de la Triple Alianza', 1, 0, 34)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (110, CAST(N'2021-08-26T14:02:20.9782880' AS DateTime2), CAST(N'2021-08-26T14:02:20.9782880' AS DateTime2), N'Ley  Avellaneda sancionada en 1876', 1, 0, 35)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (111, CAST(N'2021-08-26T14:02:41.3212690' AS DateTime2), CAST(N'2021-08-26T14:02:41.3212690' AS DateTime2), N'La ley de Bartolomé Mitre', 0, 0, 35)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (112, CAST(N'2021-08-26T14:03:12.2244620' AS DateTime2), CAST(N'2021-08-26T14:03:12.2244620' AS DateTime2), N'Ley 576 de 1872', 0, 0, 35)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (113, CAST(N'2021-08-26T14:03:50.7181230' AS DateTime2), CAST(N'2021-08-26T14:03:50.7181230' AS DateTime2), N'Algodón', 1, 0, 36)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (114, CAST(N'2021-08-26T14:04:40.8508940' AS DateTime2), CAST(N'2021-08-26T14:04:40.8508940' AS DateTime2), N'Pesca', 0, 0, 36)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (115, CAST(N'2021-08-26T14:04:52.3795680' AS DateTime2), CAST(N'2021-08-26T14:04:52.3795680' AS DateTime2), N'Caza', 0, 0, 36)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (116, CAST(N'2021-08-26T14:05:18.7359690' AS DateTime2), CAST(N'2021-08-26T14:05:18.7359690' AS DateTime2), N'Resistencia', 0, 0, 37)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (117, CAST(N'2021-08-26T14:05:36.2028550' AS DateTime2), CAST(N'2021-08-26T14:05:36.2028550' AS DateTime2), N'Puerto Tirol', 0, 0, 37)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (118, CAST(N'2021-08-26T14:05:52.1926450' AS DateTime2), CAST(N'2021-08-26T14:05:52.1926450' AS DateTime2), N'Vicentini', 1, 0, 37)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (119, CAST(N'2021-08-26T14:06:06.4126460' AS DateTime2), CAST(N'2021-08-26T14:06:06.4126460' AS DateTime2), N'La Verde', 0, 0, 37)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (120, CAST(N'2021-08-26T14:06:20.5473290' AS DateTime2), CAST(N'2021-08-26T14:06:20.5473290' AS DateTime2), N'La Escondida', 0, 0, 37)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (121, CAST(N'2021-08-26T14:06:43.5819480' AS DateTime2), CAST(N'2021-08-26T14:06:43.5819480' AS DateTime2), N'Resistencia', 0, 0, 38)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (122, CAST(N'2021-08-26T14:07:00.8438470' AS DateTime2), CAST(N'2021-08-26T14:07:00.8438470' AS DateTime2), N'Margarita Belén', 0, 0, 38)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (123, CAST(N'2021-08-26T14:07:36.0972720' AS DateTime2), CAST(N'2021-08-26T14:07:36.0972720' AS DateTime2), N'Quitilipi', 1, 0, 38)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (124, CAST(N'2021-08-26T14:07:48.8967170' AS DateTime2), CAST(N'2021-08-26T14:07:48.8967170' AS DateTime2), N'Machagai', 1, 0, 38)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (125, CAST(N'2021-08-26T14:08:26.5518970' AS DateTime2), CAST(N'2021-08-26T14:08:26.5518970' AS DateTime2), N'1951', 1, 0, 39)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (126, CAST(N'2021-08-26T14:08:36.6086210' AS DateTime2), CAST(N'2021-08-26T14:08:36.6096160' AS DateTime2), N'1994', 0, 0, 39)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (127, CAST(N'2021-08-26T14:08:47.0415580' AS DateTime2), CAST(N'2021-08-26T14:08:47.0415580' AS DateTime2), N'1862', 0, 0, 39)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (128, CAST(N'2021-08-26T14:09:12.9662660' AS DateTime2), CAST(N'2021-08-26T14:09:12.9662660' AS DateTime2), N'25', 1, 0, 40)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (129, CAST(N'2021-08-26T14:09:25.2600980' AS DateTime2), CAST(N'2021-08-26T14:09:25.2600980' AS DateTime2), N'20', 0, 0, 40)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (130, CAST(N'2021-08-26T14:09:36.5255740' AS DateTime2), CAST(N'2021-08-26T14:09:36.5255740' AS DateTime2), N'10', 0, 0, 40)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (131, CAST(N'2021-08-26T14:09:46.2582810' AS DateTime2), CAST(N'2021-08-26T14:09:46.2582810' AS DateTime2), N'5', 0, 0, 41)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (132, CAST(N'2021-08-26T14:09:54.3045830' AS DateTime2), CAST(N'2021-08-26T14:09:54.3045830' AS DateTime2), N'4', 0, 0, 41)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (133, CAST(N'2021-08-26T14:10:10.7377430' AS DateTime2), CAST(N'2021-08-26T14:10:10.7377430' AS DateTime2), N'3', 1, 0, 41)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (134, CAST(N'2021-08-26T14:10:34.8868880' AS DateTime2), CAST(N'2021-08-26T14:10:34.8868880' AS DateTime2), N'Entre Santa Silvina y Resistencia', 0, 0, 42)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (135, CAST(N'2021-08-26T14:11:16.3876440' AS DateTime2), CAST(N'2021-08-26T14:11:16.3876440' AS DateTime2), N'Entre Resistencia y Pampa del Infierno', 1, 0, 42)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (136, CAST(N'2021-08-26T14:12:45.2606890' AS DateTime2), CAST(N'2021-08-26T14:12:45.2606890' AS DateTime2), N'Entre Resistencia y Juan José Castelli', 0, 0, 42)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (137, CAST(N'2021-08-26T14:16:50.0390750' AS DateTime2), CAST(N'2021-08-26T14:16:50.0390750' AS DateTime2), N'Villa Occidental', 1, 0, 43)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (138, CAST(N'2021-08-26T14:17:15.3841570' AS DateTime2), CAST(N'2021-08-26T14:17:15.3841570' AS DateTime2), N'Resistencia', 0, 0, 43)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (139, CAST(N'2021-08-26T14:33:57.5439410' AS DateTime2), CAST(N'2021-08-26T14:33:57.5439410' AS DateTime2), N'Parque Nacional Chaco', 1, 0, 44)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (140, CAST(N'2021-08-26T14:34:58.2211190' AS DateTime2), CAST(N'2021-08-26T14:34:58.2211190' AS DateTime2), N'Parque Nacional El Impenetrable', 0, 0, 44)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (141, CAST(N'2021-08-26T14:35:31.3728350' AS DateTime2), CAST(N'2021-08-26T14:35:31.3728350' AS DateTime2), N'Parque Nacional Iberá', 0, 0, 44)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (142, CAST(N'2021-08-26T14:35:54.8105580' AS DateTime2), CAST(N'2021-08-26T14:35:54.8105580' AS DateTime2), N'Museo a cielo abierto de meteoritos', 1, 0, 45)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (143, CAST(N'2021-08-26T14:36:14.8430150' AS DateTime2), CAST(N'2021-08-26T14:36:14.8430150' AS DateTime2), N'Capital de los Inmigrantes', 0, 0, 45)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (144, CAST(N'2021-08-26T14:36:47.0845920' AS DateTime2), CAST(N'2021-08-26T14:36:47.0845920' AS DateTime2), N'Ciudad de las Esculturas', 0, 0, 45)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (145, CAST(N'2021-08-26T14:37:16.3747640' AS DateTime2), CAST(N'2021-08-26T14:37:16.3747640' AS DateTime2), N'Fiesta del Dorado', 1, 0, 46)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (146, CAST(N'2021-08-26T14:37:47.4166750' AS DateTime2), CAST(N'2021-08-26T14:37:47.4166750' AS DateTime2), N'Fiesta del Surubí', 0, 0, 46)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (147, CAST(N'2021-08-26T14:38:05.7085850' AS DateTime2), CAST(N'2021-08-26T14:38:05.7085850' AS DateTime2), N'Fiesta del Moncholo', 0, 0, 46)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (148, CAST(N'2021-08-26T14:38:19.9974330' AS DateTime2), CAST(N'2021-08-26T14:38:19.9974330' AS DateTime2), N'Castelli', 0, 0, 47)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (149, CAST(N'2021-08-26T14:38:37.6110550' AS DateTime2), CAST(N'2021-08-26T14:38:37.6110550' AS DateTime2), N'Las Breñas', 1, 0, 47)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (150, CAST(N'2021-08-26T14:39:00.2728920' AS DateTime2), CAST(N'2021-08-26T14:39:00.2728920' AS DateTime2), N'Puerto Tirol', 0, 0, 47)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (151, CAST(N'2021-08-26T14:39:16.1730300' AS DateTime2), CAST(N'2021-08-26T14:39:16.1730300' AS DateTime2), N'Puerto Vilelas', 0, 0, 48)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (152, CAST(N'2021-08-26T14:39:31.8700650' AS DateTime2), CAST(N'2021-08-26T14:39:31.8700650' AS DateTime2), N'Charata', 0, 0, 48)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (153, CAST(N'2021-08-26T14:39:50.9908910' AS DateTime2), CAST(N'2021-08-26T14:39:50.9908910' AS DateTime2), N'Puerto Tirol', 1, 0, 48)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (154, CAST(N'2021-08-26T14:40:13.0577260' AS DateTime2), CAST(N'2021-08-26T14:40:13.0577260' AS DateTime2), N'Pampa del Indio', 1, 0, 49)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (155, CAST(N'2021-08-26T14:40:36.6302540' AS DateTime2), CAST(N'2021-08-26T14:40:36.6302540' AS DateTime2), N'Pampa del Infierno', 0, 0, 49)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (156, CAST(N'2021-08-26T14:41:02.4344820' AS DateTime2), CAST(N'2021-08-26T14:41:02.4354810' AS DateTime2), N'Castelli', 0, 0, 49)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (157, CAST(N'2021-08-26T14:41:19.9575920' AS DateTime2), CAST(N'2021-08-26T14:41:19.9586210' AS DateTime2), N'Charata', 0, 0, 50)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (158, CAST(N'2021-08-26T14:41:35.7136380' AS DateTime2), CAST(N'2021-08-26T14:41:35.7136380' AS DateTime2), N'Gancedo', 0, 0, 50)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (159, CAST(N'2021-08-26T14:42:06.2679950' AS DateTime2), CAST(N'2021-08-26T14:42:06.2679950' AS DateTime2), N'Presidencia Roque Sáenz Peña', 1, 0, 50)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (160, CAST(N'2021-08-26T14:42:40.3583600' AS DateTime2), CAST(N'2021-08-26T14:42:40.3583600' AS DateTime2), N'Reserva Natural Provincial Fuerte Esperanza', 1, 0, 51)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (161, CAST(N'2021-08-26T14:43:02.0362310' AS DateTime2), CAST(N'2021-08-26T14:43:02.0362310' AS DateTime2), N'Parque Provincial Loro Hablador', 1, 0, 51)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (162, CAST(N'2021-08-26T14:43:25.6274960' AS DateTime2), CAST(N'2021-08-26T14:43:25.6284950' AS DateTime2), N'Campo del Cielo', 0, 0, 51)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (163, CAST(N'2021-08-26T14:43:42.2208270' AS DateTime2), CAST(N'2021-08-26T14:43:42.2208270' AS DateTime2), N'Villa Río Bermejito', 0, 0, 51)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (164, CAST(N'2021-08-26T14:43:56.9939810' AS DateTime2), CAST(N'2021-08-26T14:43:56.9939810' AS DateTime2), N'Las Breñas', 0, 0, 52)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (165, CAST(N'2021-08-26T14:44:07.4934500' AS DateTime2), CAST(N'2021-08-26T14:44:07.4934500' AS DateTime2), N'Fontana', 0, 0, 52)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (166, CAST(N'2021-08-26T14:44:27.7393030' AS DateTime2), CAST(N'2021-08-26T14:44:27.7393030' AS DateTime2), N'Quitilipi', 1, 0, 52)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (167, CAST(N'2021-08-26T14:44:45.4611310' AS DateTime2), CAST(N'2021-08-26T14:44:45.4611310' AS DateTime2), N'Río Pilcomayo', 0, 0, 53)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (168, CAST(N'2021-08-26T14:45:07.1292130' AS DateTime2), CAST(N'2021-08-26T14:45:07.1292130' AS DateTime2), N'Río Bermejo', 1, 0, 53)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (169, CAST(N'2021-08-26T14:45:21.8192180' AS DateTime2), CAST(N'2021-08-26T14:45:21.8192180' AS DateTime2), N'Río Negro', 0, 0, 53)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (170, CAST(N'2021-08-26T14:45:36.8769970' AS DateTime2), CAST(N'2021-08-26T14:45:36.8769970' AS DateTime2), N'Montaña', 0, 0, 54)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (171, CAST(N'2021-08-26T14:45:49.1047590' AS DateTime2), CAST(N'2021-08-26T14:45:49.1047590' AS DateTime2), N'Sierra', 0, 0, 54)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (172, CAST(N'2021-08-26T14:46:07.6854290' AS DateTime2), CAST(N'2021-08-26T14:46:07.6854290' AS DateTime2), N'Llanura', 1, 0, 54)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (173, CAST(N'2021-08-26T14:46:27.0985410' AS DateTime2), CAST(N'2021-08-26T14:46:27.0985410' AS DateTime2), N'Paraná', 0, 0, 55)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (174, CAST(N'2021-08-26T14:46:39.3796370' AS DateTime2), CAST(N'2021-08-26T14:46:39.3796370' AS DateTime2), N'Oro', 1, 0, 55)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (175, CAST(N'2021-08-26T14:46:50.5952420' AS DateTime2), CAST(N'2021-08-26T14:46:50.5952420' AS DateTime2), N'Tragadero', 1, 0, 55)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (176, CAST(N'2021-08-26T14:47:05.2562030' AS DateTime2), CAST(N'2021-08-26T14:47:05.2562030' AS DateTime2), N'Paraguay', 0, 0, 55)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (177, CAST(N'2021-08-26T14:47:26.6809000' AS DateTime2), CAST(N'2021-08-26T14:47:26.6809000' AS DateTime2), N'Negro', 1, 0, 55)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (178, CAST(N'2021-08-26T14:47:48.4131940' AS DateTime2), CAST(N'2021-08-26T14:47:48.4131940' AS DateTime2), N'Guycurú', 1, 0, 55)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (179, CAST(N'2021-08-26T14:48:21.5734950' AS DateTime2), CAST(N'2021-08-26T14:48:21.5734950' AS DateTime2), N'Portal del Impenetrable', 1, 0, 56)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (180, CAST(N'2021-08-26T14:48:36.6836030' AS DateTime2), CAST(N'2021-08-26T14:48:36.6836030' AS DateTime2), N'Perla del Paraná', 0, 0, 56)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (181, CAST(N'2021-08-26T14:48:54.9560330' AS DateTime2), CAST(N'2021-08-26T14:48:54.9560330' AS DateTime2), N'Ciudad de las Esculturas', 0, 0, 56)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (182, CAST(N'2021-08-26T14:49:11.6651960' AS DateTime2), CAST(N'2021-08-26T14:49:11.6651960' AS DateTime2), N'Baloncesto', 1, 0, 57)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (183, CAST(N'2021-08-26T14:49:24.1784420' AS DateTime2), CAST(N'2021-08-26T14:49:24.1784420' AS DateTime2), N'Fútbol', 0, 0, 57)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (184, CAST(N'2021-08-26T14:49:41.0116820' AS DateTime2), CAST(N'2021-08-26T14:49:41.0116820' AS DateTime2), N'Natación', 0, 0, 57)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (185, CAST(N'2021-08-26T14:49:56.0623120' AS DateTime2), CAST(N'2021-08-26T14:49:56.0623120' AS DateTime2), N'Tiro', 0, 0, 57)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (186, CAST(N'2021-08-26T14:50:39.5850070' AS DateTime2), CAST(N'2021-08-26T14:50:39.5850070' AS DateTime2), N'Museo Casa y Casa Jardín Schulz', 1, 0, 58)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (187, CAST(N'2021-08-26T14:51:14.0295210' AS DateTime2), CAST(N'2021-08-26T14:51:14.0295210' AS DateTime2), N'Estación Experimental Agropecuaria INTA', 0, 0, 58)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (188, CAST(N'2021-08-26T14:51:36.5771700' AS DateTime2), CAST(N'2021-08-26T14:51:36.5771700' AS DateTime2), N'Museo a cielo abierto', 0, 0, 58)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (189, CAST(N'2021-08-26T14:52:06.3046420' AS DateTime2), CAST(N'2021-08-26T14:52:06.3046420' AS DateTime2), N'Inmaculada Concepción de la Virgen María', 1, 0, 59)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (190, CAST(N'2021-08-26T14:52:26.3810070' AS DateTime2), CAST(N'2021-08-26T14:52:26.3810070' AS DateTime2), N'Virgen de Lourdes', 0, 0, 59)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (191, CAST(N'2021-08-26T14:52:50.5881760' AS DateTime2), CAST(N'2021-08-26T14:52:50.5881760' AS DateTime2), N'Virgen de Itatí', 0, 0, 59)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (192, CAST(N'2021-08-26T14:53:20.6437550' AS DateTime2), CAST(N'2021-08-26T14:53:20.6437550' AS DateTime2), N'San Fernando Rey', 1, 0, 60)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (193, CAST(N'2021-08-26T14:53:40.3133830' AS DateTime2), CAST(N'2021-08-26T14:53:40.3143830' AS DateTime2), N'El Cura Brochero', 0, 0, 60)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (194, CAST(N'2021-08-26T14:53:57.9092650' AS DateTime2), CAST(N'2021-08-26T14:53:57.9092650' AS DateTime2), N'Virgen de Itatí', 0, 0, 60)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (195, CAST(N'2021-08-26T14:54:11.5196720' AS DateTime2), CAST(N'2021-08-26T14:54:11.5196720' AS DateTime2), N'Complejo Termal', 1, 0, 61)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (196, CAST(N'2021-08-26T14:54:58.5339640' AS DateTime2), CAST(N'2021-08-26T14:54:58.5339640' AS DateTime2), N'Complejo Ecológico y Zoológico', 1, 0, 61)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (197, CAST(N'2021-08-26T14:55:24.2216090' AS DateTime2), CAST(N'2021-08-26T14:55:24.2216090' AS DateTime2), N'Museo Casa y Casa Jardín Schulz', 0, 0, 61)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (198, CAST(N'2021-08-26T14:55:56.8052890' AS DateTime2), CAST(N'2021-08-26T14:55:56.8052890' AS DateTime2), N'Las ruinas del Ingenio Azucarero', 1, 0, 62)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (199, CAST(N'2021-08-26T14:56:12.4794950' AS DateTime2), CAST(N'2021-08-26T14:56:12.4794950' AS DateTime2), N'Las Termas', 0, 0, 62)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (200, CAST(N'2021-09-02T19:41:45.1349990' AS DateTime2), CAST(N'2021-09-02T19:41:45.1349990' AS DateTime2), N'La soja', 1, 0, 63)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (201, CAST(N'2021-09-02T19:41:56.0678130' AS DateTime2), CAST(N'2021-09-02T19:41:56.0678130' AS DateTime2), N'La cebada', 0, 0, 63)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (202, CAST(N'2021-09-02T19:42:09.5091020' AS DateTime2), CAST(N'2021-09-02T19:42:09.5091020' AS DateTime2), N'El sorgo', 1, 0, 63)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (203, CAST(N'2021-09-02T19:42:24.1011450' AS DateTime2), CAST(N'2021-09-02T19:42:24.1011450' AS DateTime2), N'El maíz', 1, 0, 63)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (204, CAST(N'2021-09-02T19:42:37.4250740' AS DateTime2), CAST(N'2021-09-02T19:42:37.4250740' AS DateTime2), N'El girasol', 0, 0, 63)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (205, CAST(N'2021-09-02T19:43:35.5074570' AS DateTime2), CAST(N'2021-09-02T19:43:35.5074570' AS DateTime2), N'Santiago Perez Pons', 1, 0, 64)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (206, CAST(N'2021-09-02T19:43:57.5136980' AS DateTime2), CAST(N'2021-09-02T19:43:57.5136980' AS DateTime2), N'Martín Ritattore', 0, 0, 64)
GO
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (207, CAST(N'2021-09-02T19:44:21.8677880' AS DateTime2), CAST(N'2021-09-02T19:44:21.8677880' AS DateTime2), N'Sebastián Martinez', 0, 0, 64)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (208, CAST(N'2021-09-02T19:46:01.4319000' AS DateTime2), CAST(N'2021-09-02T19:46:01.4319000' AS DateTime2), N'Leche cultivada', 0, 0, 65)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (209, CAST(N'2021-09-02T19:46:16.0904030' AS DateTime2), CAST(N'2021-09-02T19:46:16.0904030' AS DateTime2), N'Leche materna en polvo', 1, 0, 65)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (210, CAST(N'2021-09-02T19:46:28.8220480' AS DateTime2), CAST(N'2021-09-02T19:46:28.8220480' AS DateTime2), N'Leche pasteurizada', 0, 0, 65)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (211, CAST(N'2021-09-02T19:48:00.0832230' AS DateTime2), CAST(N'2021-09-02T19:48:00.0832230' AS DateTime2), N'Repositorio Institucional de Acceso Abierto del Concejo Nacional de Investigaciones Científicas y Técnicas', 1, 0, 66)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (212, CAST(N'2021-09-02T19:48:31.2939340' AS DateTime2), CAST(N'2021-09-02T19:48:31.2939340' AS DateTime2), N'Centro de Investigación de Ciencia Digital', 0, 0, 66)
INSERT [dbo].[respuestas_respuesta] ([id], [creado], [modificado], [descripcion], [correcta], [seleccionada], [pregunta_id]) VALUES (213, CAST(N'2021-09-02T19:48:51.3647910' AS DateTime2), CAST(N'2021-09-02T19:48:51.3647910' AS DateTime2), N'Una plataforma de Facebook', 0, 0, 66)
SET IDENTITY_INSERT [dbo].[respuestas_respuesta] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 2/9/2021 16:59:58 ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 2/9/2021 16:59:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 2/9/2021 16:59:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 2/9/2021 16:59:58 ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 2/9/2021 16:59:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 2/9/2021 16:59:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 2/9/2021 16:59:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [partidas_partida_categoria_id_a962f8df]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [partidas_partida_categoria_id_a962f8df] ON [dbo].[partidas_partida]
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [partidas_partida_usuario_id_f5a4c879]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [partidas_partida_usuario_id_f5a4c879] ON [dbo].[partidas_partida]
(
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [preguntas_pregunta_categoria_id_92882307]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [preguntas_pregunta_categoria_id_92882307] ON [dbo].[preguntas_pregunta]
(
	[categoria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [respuestas_respuesta_pregunta_id_9d0b4a96]    Script Date: 2/9/2021 16:59:58 ******/
CREATE NONCLUSTERED INDEX [respuestas_respuesta_pregunta_id_9d0b4a96] ON [dbo].[respuestas_respuesta]
(
	[pregunta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[partidas_partida]  WITH CHECK ADD  CONSTRAINT [partidas_partida_usuario_id_f5a4c879_fk_auth_user_id] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[partidas_partida] CHECK CONSTRAINT [partidas_partida_usuario_id_f5a4c879_fk_auth_user_id]
GO
ALTER TABLE [dbo].[preguntas_pregunta]  WITH CHECK ADD  CONSTRAINT [preguntas_pregunta_categoria_id_92882307_fk_categorias_categoria_id] FOREIGN KEY([categoria_id])
REFERENCES [dbo].[categorias_categoria] ([id])
GO
ALTER TABLE [dbo].[preguntas_pregunta] CHECK CONSTRAINT [preguntas_pregunta_categoria_id_92882307_fk_categorias_categoria_id]
GO
ALTER TABLE [dbo].[respuestas_respuesta]  WITH CHECK ADD  CONSTRAINT [respuestas_respuesta_pregunta_id_9d0b4a96_fk_preguntas_pregunta_id] FOREIGN KEY([pregunta_id])
REFERENCES [dbo].[preguntas_pregunta] ([id])
GO
ALTER TABLE [dbo].[respuestas_respuesta] CHECK CONSTRAINT [respuestas_respuesta_pregunta_id_9d0b4a96_fk_preguntas_pregunta_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
USE [master]
GO
ALTER DATABASE [FINAL] SET  READ_WRITE 
GO
