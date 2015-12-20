Create Table Address(
    AddressID Integer primary key,
    AddressLine1 varchar(50) not null,
    AddressLine2 varchar(50) null,
    City varchar(30) not null,
    Email varchar(50) not null,
    Region varchar(2) null,
    AddressState char(2) not null,
    Zip Integer not null
 );

  Create TABLE Airport(
    AirportCode varchar(4) not null primary key,
    AirportName varchar(50),
    Lattitude varchar(10) not null,
    Longitude varchar(10) not null
 );

  Create table Pilot(
    PilotFAAID varchar(8) primary key,
    MedicalClass varchar(1) not null,
    MedicalDate date not null,
    MedicalExpDate date not null,
    NeedsVacation char(1) not null,
    PilotFirstName varchar(50) not null,
    PilotLastName varchar(50) not null,
    PilotMiddleName varchar(50) null,
    TotalFlyHours INTEGER not null,
    AddressID INTEGER not null,
	foreign key(addressID) references Address(addressID)
 );

  Create TABLE Passenger(
    PassengerFFN INTEGER Primary Key,
    AddressID INTEGER not null,
    PassengerName VARCHAR(50) not null,
    PassengerPhone varchar(15) not null,
    foreign key(addressID) references Address(addressID)
 );

  Create TABLE AirplaneType(
  AirplaneTypeID varchar(10) primary key,
  NumOfEconomy integer not null,
  NumOfFirst integer not null,
  NumOfPremium integer not null,
  NumOfSeats integer not null
);

 Create TABLE Airplane(
  AirplaneID varchar(10) primary key,
  AirplaneTypeID varchar(10) not null,
  foreign key(AirplaneTypeID) references AirplaneType(AirplaneTypeID)
);

create table PilotRate(
    PilotFAAID VARCHAR(8) not null,
    AirplaneTypeID varchar(10) not null,
    CertExpDate date null,
    CertLevel Char(1) not null,
    CertType Char(1) not null,
    Ratings VARCHAR(4) null,
    RecordType INTEGER null,
    Primary Key(PilotFAAID, Ratings),
    foreign key(AirplaneTypeID) references AirplaneType(AirplaneTypeID),
    Foreign Key(PilotFAAID) REFERENCES Pilot(PilotFAAID)
 );

 create table Flight(
    FlightNumber INTEGER primary key,
    ArrivalAirport varchar(4),
    DeptAirport varchar(4),
    SchArrivalTime time,
    SchDepTime time,
	EconomyPrice decimal(10,2) not null,
    PremiumPricing decimal(10,2) not null,
    FirstPricing decimal(10,2) not null,
	AirplaneID varchar(10) not null,
    foreign key (DeptAirport) references Airport(AirportCode),
	foreign key (ArrivalAirport) references Airport(AirportCode),
	foreign key (AirplaneID) references Airplane(AirplaneID)
 );

 create table ActualFlight(
    FlightNumber INTEGER,
    FlightDate date,
    ActArrivalTime time  null,
    ActDepTime time null,
    ActFlightDur integer null,
    AriFlightDate Date null,
    DepFlightDate Date null,
    AirplaneID varchar(10) not null,
  	PilotFAAID1 varchar(8) null,
    PilotFAAID2 varchar(8) null,
    Primary Key(FlightNumber, FlightDate),
    foreign key (FlightNumber) references Flight(FlightNumber),
  	foreign key (PilotFAAID1) references Pilot(PilotFAAID),
  	foreign key (PilotFAAID2) references Pilot(PilotFAAID),
    foreign key (AirplaneID) references Airplane(AirplaneID)
 );

 create table TicketRes(
    TicketNumberID integer primary key,
    AirplaneID varchar(10) not null,
    PassengerFFN integer not null,
    FlightNumber integer not null,
    FlightDate date not null,
  	TypeOfSeat varchar(10) not null,
    foreign key (FlightNumber, FlightDate) references ActualFlight(FlightNumber, FlightDate),
    foreign key (PassengerFFN) references Passenger(PassengerFFN),
  	foreign key (AirplaneID) references Airplane(AirplaneID)
);