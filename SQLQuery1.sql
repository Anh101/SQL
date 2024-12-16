CREATE DATABASE HL;
USE HL;
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(255),
    Gender VARCHAR(10),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    BirthOfDate DATE
);
INSERT INTO Employee (EmployeeID, EmployeeName, Gender, Email, Phone, BirthOfDate)
VALUES
(1, 'Nguyen Ngoc Duy', 'Male', 'duynn@gmail.com', '0123456789', '2003-01-01'),
(2, 'Le Hai Nam', 'Male', 'namlh@gmail.com', '0987654321', '2003-05-15'),
(3, 'Tran Thanh Trung', 'Male', 'trungtt@gmail.com', '0876543219', '2003-12-20'),
(4, 'Phan Van Hao', 'Male', 'haopv@gmail.com', '0812345679', '2003-03-10');
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName NVARCHAR(255),
    Gender VARCHAR(10),
    BirthofDate DATE,
    Phone VARCHAR(15),
    Gmail NVARCHAR(255)
);
INSERT INTO Customer (CustomerName, Gender, BirthofDate, Phone, Gmail)
VALUES
( 'Nguyen Ngoc Duy', 'Male', '2003-01-01', '0123456789', 'duynn@gmail.com'),
( 'Le Hai Nam', 'Male', '2003-05-15', '0987654321', 'namlh@gmail.com'),
( 'Tran Thanh Trung', 'Male', '2003-12-20', '0876543219', 'trungtt@gmail.com'),
( 'Phan Van Hao', 'Male', '2003-03-10', '0812345679', 'haopv@gmail.com');
CREATE TABLE Users (
    UsersID INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(50),
    PasswordHash VARCHAR(255),
    Salt VARCHAR(32),
    Role VARCHAR(10) CHECK (Role IN ('Admin', 'User')) NOT NULL,
    EmployeeID INT,
    CustomerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(MAX),
    ProductImage VARBINARY(MAX),
    SizeProduct VARCHAR(255),
	InputPrice DECIMAL(10,2),
    InventoryPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2),
);
CREATE TABLE CustomerProduct (
    CustomerProductID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Statistic (
    StatisticID INT PRIMARY KEY IDENTITY(1,1),
    CustomerProductID INT,
    EmployeeID INT,
	ProductID INT,
    QuantitySold INT,
    SaleDate DATE,
    TotalPrice DECIMAL(10,2),
	InputPrice DECIMAL(18,2),
    FOREIGN KEY (CustomerProductID) REFERENCES CustomerProduct(CustomerProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
ALTER TABLE Statistic
ADD CostPrice DECIMAL(18, 2);
ALTER TABLE Statistic
DROP COLUMN CostPrice;
ALTER TABLE Statistic
ADD CostPrice DECIMAL(18, 2) NOT NULL;

DROP TABLE IF EXISTS Statistic;
DROP TABLE IF EXISTS CustomerProduct;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
SELECT CustomerID, CustomerName, Gender,Gmail FROM Customer;
SELECT * FROM  Customer;
UPDATE Customer
SET Gmail = 'namlh@gmail.com'
WHERE CustomerID = 1;
DELETE Customer
WHERE CustomerID = 6;
