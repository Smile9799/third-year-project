giCREATE DATABASE EverTest;

USE EverTest;

CREATE TABLE Users(
    ID int AUTO_INCREMENT PRIMARY KEY,
    FirstName varchar(100) not null,
    LastName varchar(100) not null,
	Email varchar(100) not null,
	Password varchar(100) not null,
	UserType varchar(100) not  null,
	Cell_Number varchar(100)not null,
	IDNumber varchar(100)not null,
	Province varchar(100) not null,
	City varchar(100) not null,
	StreetNumber varchar(100) not null,
	StreetName varchar(100) not null,
	ZipCode varchar(100) not null,
	isActive int not null,
	DOB varchar(100) not null
    );
    Create Table Pitch
(
	PitchID int  AUTO_INCREMENT primary key,
	ID int not null,
	PitchName varchar(255) not null,
	ManagementLocation varchar(255) not null,
	Industry varchar(255) not null,
	Stage varchar(255) not null,
	IdealInvestorRole varchar(255) not null,
	Budget decimal not null,
	MinimumInvestmentPerInvestor decimal not null,
	MaximumInvestmentPerInvestor decimal not null,
	PreviousRoundRaise decimal not null,
	ShortSummary varchar(255) not null,
	TheBusiness varchar(255) not null,
	TheMarket varchar(255) not null,
	ProgressProof varchar(255) not null,
	Objectives varchar(255) not null,
	VideoURLLink varchar(255) not null,
	Grade int not null,
	ReviewerMessage varchar(255) not null,
	DeliveryMessage varchar(255) not null,
	isDeleted int not null,
	isSuccess int not null,
	isReviewed int not null,

	Foreign key (ID) References Users(ID)
);
Create Table Innovator
(
	InnovatorID  int AUTO_INCREMENT primary key,
	PitchID int not null,
	Files varbinary(255),
	ID int not null,

	Foreign key (PitchID) References Pitch(PitchID),
	Foreign key (ID) References Users(ID)
);
Create Table Investor
(
	InvestorID  int AUTO_INCREMENT primary key,
	ProjectGroup varchar(255) not null,
	Budget decimal not null,
	MaximumAmount decimal not null,
	Stage  varchar(255) not null,
	Location varchar(255) not null,
	ID int not null,
	Foreign key (ID) References Users(ID)
);
Create Table Reviewer
(
	ReviewerID  int AUTO_INCREMENT primary key,
	ID int not null,
	ProjectGroup varchar(255) not null,

	Foreign key (ID) References Users(ID)
);
create table SavedPitches(
	id int AUTO_INCREMENT primary key,
	PitchID int not null,
	UserID int not null,

	 Foreign key (PitchID) references Pitch(PitchID),
	 Foreign key (UserID) References Users(ID)
);
create table MeetingDetails(

	id int AUTO_INCREMENT primary key,
	PitchID int not null,
	InterviewDate varchar(255),
	InterviewTime varchar(255),
	InterviewVenue varchar(255),
	InterviewRoom varchar(255),
	InterviewAddress varchar(255),
	isSuccess int not null,
	UserId int not null,
	InvestorMessage varchar(255) not null,
	
	Foreign key (UserId) references Users(ID),
	Foreign key (PitchID) references Pitch(PitchID)
);
CREATE TABLE BidEquity(
    Id int AUTO_INCREMENT PRIMARY KEY,
    PitchID int not null,
    Investorfunds decimal not null,
    Investorpercentage decimal not null,
    Innovatorfunds decimal not null,
    Innovatorpercentage decimal not null,
    isAccepted int not null,
    isRejected int not null,
    InvestorMessage varchar(255) null,
    InnovatorMessage varchar(255) null,
    
    FOREIGN KEY (PitchID) REFERENCES Pitch(PitchID)
    );