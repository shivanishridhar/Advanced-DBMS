/**Create a database**/
create database ADBMS_LAB5
use ADBMS_LAB5
go

/**Table Creation**/
create table Customer
(CustomerID int primary key,
LastName varchar(50),
FirstName varchar(50),
TotalPurchase money);

select * from Customer

create table SaleOrder
(OrderID int primary key,
CustomerID int not null references Customer(CustomerID),
OrderDate date default getdate(),
Amount money);

select * from SaleOrder
/**Insertion  of data in Customer**/
INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (1, 'Gole', 'Shivani', 100.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (2, 'Gole', 'Rupa', 250.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (3, 'Kalmady', 'Aditi', 150.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (4, 'Goswami', 'Anahita', 75.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (5, 'Davis', 'Michael', 500.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (6, 'Sharma', 'Prabodh', 422.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (7, 'Rathi', 'Shrikant', 396.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (8, 'Raikar', 'Chintan', 120.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (9, 'Ganvir', 'Rakshit', 135.00);

INSERT INTO Customer (CustomerID, LastName, FirstName, TotalPurchase)
VALUES (10, 'Rosia', 'Ruchira', 20.00);

select * from Customer


/**Insertion of data into SaleOrder**/
INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (1, 1, '2022-01-01', 100)

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (2, 1, '2022-02-15', 75);

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (3, 2, '2023-03-10', 200);

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (4, 3, '2023-04-22', 50);

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (5, 4, '2022-05-07', 150);


INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (6, 5, '2022-07-29', 150);

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (7, 6, '2022-04-20', 150);

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (8, 7, '2022-06-12', 150);

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (9, 8, '2023-01-29', 150);

INSERT INTO SaleOrder (OrderID, CustomerID, OrderDate, Amount)
VALUES (10, 9, '2023-05-15', 150);



select * from SaleOrder

/**Code for Job creation**/
DECLARE @s_archiveTableName nvarchar(100);
DECLARE @sql nvarchar(max);

DECLARE @archiveMonth nvarchar(50);
SET @archiveMonth = UPPER(datename(month, dateadd(month, 0, getdate())));

DECLARE @archiveYear nvarchar(4);
SET @archiveYear = datename(year, dateadd(year, -1, getdate()));

SET @s_archiveTableName = 'OrderArchive' + @archiveMonth + @archiveYear;

SET @sql = 'SELECT * INTO ' + @s_archiveTableName + ' FROM SaleOrder WHERE OrderDate < DATEADD(year, -1, GETDATE()); DELETE FROM SaleOrder WHERE OrderDate < DATEADD(year, -1, GETDATE())';

EXEC sp_executesql @sql;

select * from SaleOrder
select * from OrderArchiveMAY2022

