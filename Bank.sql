--First part - Bank

CREATE DATABASE Bank

CREATE TABLE Titles(
	ID INT IDENTITY (1,1),
	Title nvarchar(25) NOT NULL,
	CONSTRAINT CHK_Title CHECK (Title='Director' OR Title='Vice president' OR Title='Investment associate' OR Title='Investment analyst')
)

CREATE TABLE BankUsers(
	ID INT IDENTITY (1,1),
	FirstName nvarchar(25) NOT NULL,
	LastName nvarchar(25) NOT NULL,
	Oib BIGINT NOT NULL,
	PhoneNumber nvarchar(25) UNIQUE,
	UserAddress nvarchar(50),
	City nvarchar(25) NOT NULL,
	Country nvarchar(25) NOT NULL,
	ZipCode nvarchar(25) NOT NULL
)

CREATE TABLE BankTransactions(
	ID INT IDENTITY (1,1),
	DateOfTransaction datetime NOT NULL,
	TransactionStatus BIT NOT NULL
)

CREATE TABLE Employees(
	ID INT IDENTITY (1,1),
	FirstName nvarchar(25) NOT NULL,
	LastName nvarchar(25) NOT NULL,
	Title nvarchar(25) NOT NULL,
	Email nvarchar(25) NOT NULL,
	CONSTRAINT CHK_TitleEmployees CHECK (Title='Director' OR Title='Vice president' OR Title='Investment associate' OR Title='Investment analyst')
)

ALTER TABLE BankUsers
ADD CONSTRAINT UniqueOib UNIQUE(Oib)

ALTER TABLE BankTransactions
ADD DescriptionToTransaction nvarchar(50)

ALTER TABLE Employees
ADD Notes nvarchar(50)

INSERT INTO Titles
(Title)
VALUES
('Director'),('Vice president'),('Investment associate'),('Investment analyst')

INSERT INTO BankUsers
(FirstName,LastName,Oib,PhoneNumber,UserAddress,City,Country,ZipCode)
VALUES
('Rashad','Bartlett',11111111111,'111','Street 1','New York','USA','1000'),
('Amber','Kent',11111111112,'112','Street 2','London','UK','2000'),
('Janelle','Lindsey',11111111113,'113','Street 3','Tuscaloosa','USA','3000'),
('Mitros','Katrakis',11111111114,'114','Street 4','Tokyo','Japan','4000'),
('Rashad','Bartlett',11111111115,'115','Street 1','New York','USA','1000')

INSERT INTO BankTransactions
(DateOfTransaction,TransactionStatus)
VALUES
('2012-01-05',0),('2013-01-05',1),('2014-01-05',1),('2015-01-05',1),('2016-01-05',1),('2017-01-05',0),('2018-01-05',1)

INSERT INTO Employees
(FirstName,LastName,Title,Email)
VALUES
('Artur','Dorsey','Director','ad@bank.com'),('Ember','Moore','Vice president','em@bank.com'),('Sameer','Gill','Investment associate','sg@bank.com'),('Tayla','Sears','Investment analyst','ts@bank.com')

SELECT * FROM Employees
WHERE FirstName LIKE N'[a-g]%'
ORDER BY FirstName

UPDATE Employees
SET
	FirstName=N'Živko'
WHERE
	FirstName='Artur'

DELETE FROM BankTransactions
WHERE TransactionStatus=0



--Second part - Northwind

USE Northwind

SELECT TOP 50 CompanyName,ContactName,ContactTitle,Address,City,Phone FROM Customers

SELECT COUNT(*) FROM Customers
WHERE Fax IS NOT NULL AND Region IS NOT NULL

SELECT TOP 2 FirstName,LastName,Title FROM Employees
ORDER BY BirthDate

SELECT * FROM Customers
WHERE Address LIKE '[1-9]%' AND CompanyName LIKE '__a%'
ORDER BY Country

SELECT TOP 1 OrderID FROM [Order Details]
ORDER BY Quantity DESC


--The same thing as the one above but doing by selecting from table order and not order details directly

--SELECT OrderID FROM Orders
--WHERE OrderID IN (SELECT TOP 1 OrderID FROM [Order Details] ORDER BY Quantity DESC)

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders)