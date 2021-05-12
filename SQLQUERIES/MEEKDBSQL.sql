Create Database MEEKDB
GO

Use MEEKDB
Go

Create table Users
(
	ID int identity primary key,
	FirstName varchar(max) null,
	LastName varchar(max) null,
	Email varchar(max) not null,
	Password varchar(max) not null,
	UserType varchar(max) not  null,
	Cell_Number varchar(max) null,
	IDNumber varchar(max) null,
	Province varchar(max) not null,
	City varchar(max) not null,
	StreetNumber varchar(max) not null,
	StreetName varchar(max) not null,
	ZipCode varchar(max) not null,
	isActive int not null,
	DOB varchar(max) null
)
GO
Create Table Pitch
(
	PitchID int  identity primary key,
	ID int not null,
	PitchName varchar(max) not null,
	ManagementLocation varchar(max) not null,
	Industry varchar(max) not null,
	Stage varchar(max) not null,
	IdealInvestorRole varchar(max) not null,
	Budget Money not null,
	MinimumInvestmentPerInvestor Money not null,
	MaximumInvestmentPerInvestor Money not null,
	PreviousRoundRaise Money not null,
	ShortSummary varchar(max) not null,
	TheBusiness varchar(max) not null,
	TheMarket varchar(max) not null,
	ProgressProof varchar(max) not null,
	Objectives varchar(max) not null,
	VideoURLLink varchar(max) not null,
	Grade int not null,
	ReviewerMessage varchar(max) not null,
	DeliveryMessage varchar(max) not null,
	isDeleted int not null,
	isSuccess int not null,
	isReviewed int not null,

	Foreign key (ID) References Users(ID)
)
GO
Create Table Innovator
(
	InnovatorID  int identity primary key,
	PitchID int not null,
	Files varbinary(max),
	ID int not null,

	Foreign key (PitchID) References Pitch(PitchID),
	Foreign key (ID) References Users(ID)
)
GO
Create Table Investor
(
	InvestorID  int identity primary key,
	ProjectGroup varchar(max) not null,
	Budget Money not null,
	MaximumAmount Money not null,
	Stage  varchar(max) not null,
	Location varchar(max) not null,
	ID int not null,
	
	Foreign key (ID) References Users(ID)
)
GO
Create Table Reviewer
(
	ReviewerID  int identity primary key,
	ID int not null,
	ProjectGroup varchar(max) not null,

	Foreign key (ID) References Users(ID)
)
GO

create table SavedPitches(
	id int identity primary key,
	PitchID int not null,
	UserID int not null,

	 Foreign key (PitchID) references Pitch(PitchID),
	 Foreign key (UserID) References Users(ID)
)
GO
create table MeetingDetails(

	id int identity primary key,
	PitchID int not null,
	InterviewDate varchar(max),
	InterviewTime varchar(max),
	InterviewVenue varchar(max),
	InterviewRoom varchar(max),
	InterviewAddress varchar(max),
	isSuccess int not null,
	UserId int not null,
	InvestorMessage varchar(max) not null
	
	Foreign key (UserId) references Users(ID),
	Foreign key (PitchID) references Pitch(PitchID)
)