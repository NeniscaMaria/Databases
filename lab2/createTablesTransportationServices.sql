
CREATE DATABASE Transportation_Services
GO
USE Transportation_Services
Go

create table Buses(
	Bid int primary key,
	NoOfSeats int not null)

create table Drivers(
	Did int,
	Name varchar(50) not null,
	Surname varchar(50) not null,
	Age int,
	Salary int,
	Contact varchar(50) not null,
	AccidentInsuranceExpirationDate date not null,
	Bid int foreign key references Buses(Bid),
	constraint pk_Drivers primary key(Bid))

create table Stations(
	Sid int primary key,
	Name varchar(50) not null)

create table Routes(
	Rid int primary key,
	DepartureStation int foreign key references Stations(Sid),
	ArrivalStation int foreign key references Stations(Sid),
	DepartureTime time not null,
	ArrivalTime time not null,
	NoOfTicketsAvailable int not null)

create table BusesOnRoutes(
	Bid int foreign key references Buses(Bid),
	Rid int foreign key references Routes(Rid),
	constraint pk_BOnR primary key(Bid,Rid))

create table Employees(
	Eid int primary key,
	Sid int foreign key references Stations(Sid),
	Name varchar(50),
	Surname varchar(50),
	Contact varchar(50),
	Age int,
	Salary int)

create table Tickets(
	Tid int primary key,
	Price int not null,
	DateBought date not null,
	Rid int foreign key references Routes(Rid))

create table Customers(
	Cid int primary key,
	Name varchar(50) not null,
	Surname varchar(50) not null,
	Age int not null)

create table TicketsToCustomers(
	Tid int foreign key references Tickets(Tid),
	Cid int foreign key references Customers(Cid),
	constraint pk_TicketsToCustomers primary key(Tid,Cid))

create table ITPs(
	Bid int foreign key references Buses(Bid),
	ExpirationDate date not null,
	constraint pk_ITPs primary key(Bid))

create table HealthInsurances(
	Eid int foreign key references Employees(Eid),
	Value int not null,
	ExpirationDate date not null,
	constraint pk_HealthInsurances primary key(Eid))

