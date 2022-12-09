USE master 
GO 
CREATE DATABASE Car_Rental_System_Database ;

USE Car_Rental_System_Database 
GO 

CREATE TABLE Car (
	CarID INTEGER  NOT NULL ,
	Color TEXT NOT NULL , 
	ManufacturCompany TEXT NOT NULL ,
	CarModel TEXT NOT NULL , 
	EngineCapacity TEXT NOT NULL , 
	HorsePower TEXT NOT NULL , 
	MaximumSpeed TEXT NOT NULL ,
	TransmissionType TEXT NOT NULL ,
	YearModel TEXT NOT NULL , 
	Fuel TEXT NOT NULL , 
	TankSize TEXT NOT NULL , 
	Seats TEXT NOT NULL , 
	TractionType TEXT NOT NULL , 
	FuelTankCapacity TEXT NOT NULL , 
	NumberOfCylinder TEXT NOT NULL , 
	Price REAL NOT NULL 

	PRIMARY KEY (CarID)
);

==============================================================================

CREATE TABLE Borrower (
	BorrowerID INTEGER NOT NULL , 
	BorrowerName TEXT NOT NULL , 
	Gender TEXT NOT NULL , 
	NationalID TEXT NOT NULL , 
	PhoneNumber TEXT NOT NULL ,
	Email TEXT NOT NULL ,
	BorrowerPassword TEXT NOT NULL , 
	UserName TEXT , 
	City TEXT NOT NULL , 
	Country TEXT NOT NULL , 
	Nationalty TEXT NOT NULL ,

	PRIMARY KEY (BorrowerID) 
);

==============================================================================

CREATE TABLE Department (
	DepartmentID INTEGER NOT NULL , 
	DepartmentName TEXT NOT NULL , 
	DepartmentLocation TEXT NOT NULL , 
	DepartmentStartDate TEXT NOT NULL ,

	PRIMARY KEY (DepartmentID)
);

==============================================================================

CREATE TABLE Employee (
	EmployeeID INTEGER NOT NULL , 
	EmployeeName TEXT NOT NULL , 
	EmployeeDepartment INTEGER NOT NULL ,
	EmployeeEmail TEXT NOT NULL , 
	EmployeeUserName TEXT NOT NULL , 
	EmployeePassword TEXT NOT NULL , 
	EmployeeGender TEXT NOT NULL , 
	EmployeeAge TEXT NOT NULL , 
	EmployeeNationalID TEXT NOT NULL , 
	EmployeePhoneNumber TEXT NOT NULL , 
	EmployeeCountry TEXT NOT NULL , 
	EmployeeCity TEXT NOT NULL , 
	EmployeeAddress TEXT NOT NULL , 
	EmployeeNationality TEXT NOT NULL , 
	EmployeeSalary TEXT NOT NULL , 
	EmployeeBankingInforamtion TEXT NOT NULL ,
	EmployeeGraduationState TEXT NOT NULL ,

	PRIMARY KEY (EmployeeID),
	FOREIGN KEY (EmployeeDepartment) REFERENCES Department(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE ,

);

==============================================================================

CREATE TABLE Rent (
	RentID INTEGER NOT NULL , 
	BorrowerID INTEGER NOT NULL , 
	CarID INTEGER NOT NULL , 
	Duration INTEGER NOT NULL , 
	RentalDate DATE NOT NULL , 
	PaymentMethod TEXT NOT NULL , 

	PRIMARY KEY (RentID) ,
	FOREIGN KEY (BorrowerID) REFERENCES Borrower(BorrowerID) ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (CarID ) REFERENCES Car(CarID) ON DELETE CASCADE ON UPDATE CASCADE ,
);

==============================================================================

CREATE TABLE WorksOn (
	DepartmentID INTEGER NOT NULL , 
	CarID INTEGER NOT NULL , 

	PRIMARY KEY (DepartmentID , CarID) ,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE ,
	FOREIGN KEY (CarID) REFERENCES Car(CarID) ON DELETE CASCADE ON UPDATE CASCADE ,
);

==============================================================================

CREATE TABLE Manage (
	DepartmentID INTEGER NOT NULL , 
	EmployeeID INTEGER NOT NULL , 
	EmployeeName TEXT NOT NULL ,
	DepartmentName TEXT NOT NULL ,

	PRIMARY KEY (DepartmentID , EmployeeID) ,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ,
);

==============================================================================

CREATE TABLE Worksin (
	DepartmentID INTEGER NOT NULL , 
	EmployeeID INTEGER NOT NULL , 
	EmployeeName TEXT NOT NULL ,
	DepartmentName TEXT NOT NULL ,
	HireDate TEXT NOT NULL ,

	PRIMARY KEY (DepartmentID , EmployeeID) ,
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ,
);
