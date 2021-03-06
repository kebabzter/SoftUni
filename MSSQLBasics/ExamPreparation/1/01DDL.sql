CREATE DATABASE Airport

CREATE TABLE Planes
(
   Id INT PRIMARY KEY IDENTITY,
   [Name] VARCHAR (30) NOT NULL,
   Seats INT NOT NULL,
   [Range] INT NOT NULL,
)


CREATE TABLE Flights
(
    Id INT PRIMARY KEY IDENTITY,
	DepartureTime DATETIME,
	ArrivalTime DATETIME,
	Origin VARCHAR(50) NOT NULL,
	Destination VARCHAR(50) NOT NULL,
	PlaneId INT NOT NULL FOREIGN KEY REFERENCES Planes (Id)
)


CREATE TABLE Passengers
(
   Id INT PRIMARY KEY IDENTITY,
   FirstName VARCHAR(30) NOT NULL,
   LastName VARCHAR(30) NOT NULL,
   Age INT NOT NULL,
   [Address] VARCHAR(30) NOT NULL,
   PassportId CHAR(11) NOT NULL
)

CREATE TABLE LuggageTypes
(
   Id INT PRIMARY KEY IDENTITY,
   [Type] VARCHAR(30) NOT NULL
)

CREATE TABLE Luggages
(
   Id INT PRIMARY KEY IDENTITY,
   LuggageTypeId INT FOREIGN KEY REFERENCES LuggageTypes(Id),
   PassengerId INT FOREIGN KEY REFERENCES Passengers(Id),
)

CREATE TABLE Tickets
(
     Id INT PRIMARY KEY IDENTITY,
	 PassengerId INT FOREIGN KEY REFERENCES Passengers(Id),
	 FlightId INT FOREIGN KEY REFERENCES Flights(Id),
	 LuggageId INT FOREIGN KEY REFERENCES Luggages(Id),
	 Price DECIMAL (18,2) NOT NULL
)