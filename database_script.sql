USE master
GO
	CREATE LOGIN LoadUser WITH PASSWORD = 'Lambda6789'
	CREATE USER LoadUser FOR LOGIN LoadUser;

USE customerdb
GO
	CREATE USER LoadUser FOR LOGIN LoadUser
	GRANT CONTROL ON DATABASE::[customerdb] to LoadUser;
GO
USE [customerdb]
GO

/****** Object:  Table [dbo].[data]    Script Date: 07/12/2022 04:11:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[data](
	[customerID] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](50) NULL,
	[SeniorCitizen] [nvarchar](50) NULL,
	[Partner] [nvarchar](50) NULL,
	[Dependents] [nvarchar](50) NULL,
	[tenure] [nvarchar](50) NULL,
	[PhoneService] [nvarchar](50) NULL,
	[MultipleLines] [nvarchar](50) NULL,
	[InternetService] [nvarchar](50) NOT NULL,
	[OnlineSecurity] [nvarchar](50) NULL,
	[OnlineBackup] [nvarchar](50) NULL,
	[DeviceProtection] [nvarchar](50) NULL,
	[TechSupport] [nvarchar](50) NULL,
	[StreamingTV] [nvarchar](50) NULL,
	[StreamingMovies] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[PaperlessBilling] [nvarchar](50) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[MonthlyCharges] [float] NULL,
	[TotalCharges] [float] NULL,
	[Churn] [nvarchar](50) NULL,
 CONSTRAINT [PK_data] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [customerdb]
GO

/****** Object:  Table [dbo].[predictions]    Script Date: 07/12/2022 04:11:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[predictions](
	[Partner_No] [nvarchar](50) NOT NULL,
	[Partner_Yes] [nvarchar](50) NOT NULL,
	[Dependents_No] [nvarchar](50) NOT NULL,
	[Dependents_Yes] [nvarchar](50) NOT NULL,
	[MultipleLines_No] [nvarchar](50) NOT NULL,
	[MultipleLines_No_phone_service] [nvarchar](50) NOT NULL,
	[MultipleLines_Yes] [nvarchar](50) NOT NULL,
	[InternetService_DSL] [nvarchar](50) NOT NULL,
	[InternetService_Fiber_optic] [nvarchar](50) NOT NULL,
	[InternetService_No] [nvarchar](50) NOT NULL,
	[OnlineSecurity_No] [nvarchar](50) NOT NULL,
	[OnlineSecurity_No_internet_service] [nvarchar](50) NOT NULL,
	[OnlineSecurity_Yes] [nvarchar](50) NOT NULL,
	[OnlineBackup_No] [nvarchar](50) NOT NULL,
	[OnlineBackup_No_internet_service] [nvarchar](50) NOT NULL,
	[OnlineBackup_Yes] [nvarchar](50) NOT NULL,
	[DeviceProtection_No] [nvarchar](50) NOT NULL,
	[DeviceProtection_No_internet_service] [nvarchar](50) NOT NULL,
	[DeviceProtection_Yes] [nvarchar](50) NOT NULL,
	[TechSupport_No] [nvarchar](50) NOT NULL,
	[TechSupport_No_internet_service] [nvarchar](50) NOT NULL,
	[TechSupport_Yes] [nvarchar](50) NOT NULL,
	[StreamingTV_No] [nvarchar](50) NOT NULL,
	[StreamingTV_No_internet_service] [nvarchar](50) NOT NULL,
	[StreamingTV_Yes] [nvarchar](50) NOT NULL,
	[StreamingMovies_No] [nvarchar](50) NOT NULL,
	[StreamingMovies_No_internet_service] [nvarchar](50) NOT NULL,
	[StreamingMovies_Yes] [nvarchar](50) NOT NULL,
	[PaperlessBilling_No] [nvarchar](50) NOT NULL,
	[PaperlessBilling_Yes] [nvarchar](50) NOT NULL,
	[PaymentMethod_Bank_transfer_automatic] [nvarchar](50) NOT NULL,
	[PaymentMethod_Credit_card_automatic] [nvarchar](50) NOT NULL,
	[PaymentMethod_Electronic_check] [nvarchar](50) NOT NULL,
	[PaymentMethod_Mailed_check] [nvarchar](50) NOT NULL,
	[tenure] [nvarchar](50) NOT NULL,
	[MonthlyCharges] [float] NOT NULL,
	[SeniorCitizen] [nvarchar](50) NOT NULL,
	[churn] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [customerdb]
GO

/****** Object:  Table [dbo].[test_data]    Script Date: 07/12/2022 04:13:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[test_data](
	[Partner_No] [nvarchar](50) NOT NULL,
	[Partner_Yes] [nvarchar](50) NOT NULL,
	[Dependents_No] [nvarchar](50) NOT NULL,
	[Dependents_Yes] [nvarchar](50) NOT NULL,
	[MultipleLines_No] [nvarchar](50) NOT NULL,
	[MultipleLines_No_phone_service] [nvarchar](50) NOT NULL,
	[MultipleLines_Yes] [nvarchar](50) NOT NULL,
	[InternetService_DSL] [nvarchar](50) NOT NULL,
	[InternetService_Fiber_optic] [nvarchar](50) NOT NULL,
	[InternetService_No] [nvarchar](50) NOT NULL,
	[OnlineSecurity_No] [nvarchar](50) NOT NULL,
	[OnlineSecurity_No_internet_service] [nvarchar](50) NOT NULL,
	[OnlineSecurity_Yes] [nvarchar](50) NOT NULL,
	[OnlineBackup_No] [nvarchar](50) NOT NULL,
	[OnlineBackup_No_internet_service] [nvarchar](50) NOT NULL,
	[OnlineBackup_Yes] [nvarchar](50) NOT NULL,
	[DeviceProtection_No] [nvarchar](50) NOT NULL,
	[DeviceProtection_No_internet_service] [nvarchar](50) NOT NULL,
	[DeviceProtection_Yes] [nvarchar](50) NOT NULL,
	[TechSupport_No] [nvarchar](50) NOT NULL,
	[TechSupport_No_internet_service] [nvarchar](50) NOT NULL,
	[TechSupport_Yes] [nvarchar](50) NOT NULL,
	[StreamingTV_No] [nvarchar](50) NOT NULL,
	[StreamingTV_No_internet_service] [nvarchar](50) NOT NULL,
	[StreamingTV_Yes] [nvarchar](50) NOT NULL,
	[StreamingMovies_No] [nvarchar](50) NOT NULL,
	[StreamingMovies_No_internet_service] [nvarchar](50) NOT NULL,
	[StreamingMovies_Yes] [nvarchar](50) NOT NULL,
	[PaperlessBilling_No] [nvarchar](50) NOT NULL,
	[PaperlessBilling_Yes] [nvarchar](50) NOT NULL,
	[PaymentMethod_Bank_transfer_automatic] [nvarchar](50) NOT NULL,
	[PaymentMethod_Credit_card_automatic] [nvarchar](50) NOT NULL,
	[PaymentMethod_Electronic_check] [nvarchar](50) NOT NULL,
	[PaymentMethod_Mailed_check] [nvarchar](50) NOT NULL,
	[tenure] [nvarchar](50) NOT NULL,
	[MonthlyCharges] [float] NOT NULL,
	[SeniorCitizen] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [customerdb]
GO

/****** Object:  Table [dbo].[training_data]    Script Date: 07/12/2022 04:13:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[training_data](
	[Partner_No] [nvarchar](50) NOT NULL,
	[Partner_Yes] [nvarchar](50) NOT NULL,
	[Dependents_No] [nvarchar](50) NOT NULL,
	[Dependents_Yes] [nvarchar](50) NOT NULL,
	[MultipleLines_No] [nvarchar](50) NOT NULL,
	[MultipleLines_No_phone_service] [nvarchar](50) NOT NULL,
	[MultipleLines_Yes] [nvarchar](50) NOT NULL,
	[InternetService_DSL] [nvarchar](50) NOT NULL,
	[InternetService_Fiber_optic] [nvarchar](50) NOT NULL,
	[InternetService_No] [nvarchar](50) NOT NULL,
	[OnlineSecurity_No] [nvarchar](50) NOT NULL,
	[OnlineSecurity_No_internet_service] [nvarchar](50) NOT NULL,
	[OnlineSecurity_Yes] [nvarchar](50) NOT NULL,
	[OnlineBackup_No] [nvarchar](50) NOT NULL,
	[OnlineBackup_No_internet_service] [nvarchar](50) NOT NULL,
	[OnlineBackup_Yes] [nvarchar](50) NOT NULL,
	[DeviceProtection_No] [nvarchar](50) NOT NULL,
	[DeviceProtection_No_internet_service] [nvarchar](50) NOT NULL,
	[DeviceProtection_Yes] [nvarchar](50) NOT NULL,
	[TechSupport_No] [nvarchar](50) NOT NULL,
	[TechSupport_No_internet_service] [nvarchar](50) NOT NULL,
	[TechSupport_Yes] [nvarchar](50) NOT NULL,
	[StreamingTV_No] [nvarchar](50) NOT NULL,
	[StreamingTV_No_internet_service] [nvarchar](50) NOT NULL,
	[StreamingTV_Yes] [nvarchar](50) NOT NULL,
	[StreamingMovies_No] [nvarchar](50) NOT NULL,
	[StreamingMovies_No_internet_service] [nvarchar](50) NOT NULL,
	[StreamingMovies_Yes] [nvarchar](50) NOT NULL,
	[PaperlessBilling_No] [nvarchar](50) NOT NULL,
	[PaperlessBilling_Yes] [nvarchar](50) NOT NULL,
	[PaymentMethod_Bank_transfer_automatic] [nvarchar](50) NOT NULL,
	[PaymentMethod_Credit_card_automatic] [nvarchar](50) NOT NULL,
	[PaymentMethod_Electronic_check] [nvarchar](50) NOT NULL,
	[PaymentMethod_Mailed_check] [nvarchar](50) NOT NULL,
	[tenure] [nvarchar](50) NOT NULL,
	[MonthlyCharges] [float] NOT NULL,
	[SeniorCitizen] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO













