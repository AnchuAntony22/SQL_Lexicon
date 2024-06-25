create database registry;
use registry;
drop table Car;
CREATE TABLE Car (
    Id INT NOT NULL PRIMARY KEY,
    Brand NVARCHAR(20),
    Year INT,
    Model NVARCHAR(20)
);
create database groupss;
use groupss;
CREATE TABLE person (
    Id INT AUTO_INCREMENT,
    FirstName NVARCHAR(20),
    LastName NVARCHAR(20),
    Age INT,
    Email NVARCHAR(20)
);
insert into person values
(1,'Anchu', 'Antony', 33, 'aaad@gmail.com');
insert into person values
(2,'Anju', 'Antony', 33, 'aaafdf@gmail.com');
insert into person values
(3,'Anu', 'Antony', 33, 'aaadgfdgf@gmail.com');
use registry;
CREATE TABLE Sale (
    Id INT,
    Price INT,
    Seller NVARCHAR(30),
    Buyer NVARCHAR(30)
);
insert into Car values(1, 'Volvo', 2000, 'model');
insert into Car values(2, 'Bmw', 2006, 'model c');
insert into Car values(3, 'Toyoto', 2008, 'model a');

