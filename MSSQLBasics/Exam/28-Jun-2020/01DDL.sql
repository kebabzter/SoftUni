CREATE DATABASE ColonialJourney

CREATE TABLE Planets
( 
   Id INT PRIMARY KEY IDENTITY,
   [Name] VARCHAR(30) NOT NULL
)

CREATE TABLE Spaceports
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL,
	PlanetId INT NOT NULL FOREIGN KEY REFERENCES Planets(Id)
)

CREATE TABLE Spaceships
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL,
	Manufacturer VARCHAR(30) NOT NULL,
	LightSpeedRate INT DEFAULT 0
)

CREATE TABLE Colonists
(
   Id INT PRIMARY KEY IDENTITY,
   FirstName VARCHAR(20) NOT NULL,
   LastName VARCHAR(20) NOT NULL,
   Ucn VARCHAR(10) NOT NULL UNIQUE,
   BirthDate DATE NOT NULL
)


CREATE TABLE Journeys
(
   Id INT PRIMARY KEY IDENTITY,
   JourneyStart DATETIME NOT NULL,
   JourneyEnd DATETIME NOT NULL,
   Purpose VARCHAR(11) CHECK (Purpose='Medical' OR Purpose='Technical' OR Purpose='Educational'OR Purpose='Military'),
   DestinationSpaceportId INT NOT NULL FOREIGN KEY REFERENCES Spaceports(Id),
   SpaceshipId INT NOT NULL FOREIGN KEY REFERENCES Spaceships(Id)
)

CREATE TABLE TravelCards
(
    Id INT PRIMARY KEY IDENTITY,
	CardNumber CHAR(10) NOT NULL UNIQUE,
	JobDuringJourney VARCHAR(8) CHECK (JobDuringJourney='Pilot' OR JobDuringJourney='Engineer' OR JobDuringJourney='Trooper' OR JobDuringJourney='Cleaner' OR JobDuringJourney='Cook'),
	ColonistId INT NOT NULL FOREIGN KEY REFERENCES Colonists(Id),
	JourneyId INT NOT NULL FOREIGN KEY REFERENCES Journeys(Id)
)