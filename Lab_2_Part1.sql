/**Source Database**/
create database source_db_shiv
use source_db_shiv
go

create table SaleOrder 
(OrderID int identity primary key, 
 OrderDate date, 
 CustomerID int); 

create table OrderItem
(ItemID int,
 OrderID int references SaleOrder(OrderID),
 Quantity int,
 UnitPrice money,
 LastModified datetime default getdate()
 primary key (OrderId, ItemID));

select * from SaleOrder
select * from OrderItem

/**Destination Database**/
create database destination_db_shiv
use destination_db_shiv
go
create table ItemsReport
(CustomerID int,
 OrderDate date,
 OrderID int,
 ItemID int primary key,
 Quantity int,
 UnitPrice money,
 LastModified datetime);  

 CREATE TABLE ItemsAudit
 (
  Audit_PK INT  IDENTITY(1,1) NOT NULL
  ,CustomerID int
  ,OrderDate date
  ,OrderID int
  ,ItemID int
  ,OldQuantity int
  ,NewQuantity int
  ,OldUnitPrice money
  ,NewUnitPrice money
  ,NewLastModified datetime
  ,OldLastModified datetime
  ,[Action] CHAR(6) NULL
  ,ActionTime DATETIME DEFAULT GETDATE()
 );

 select * from ItemsAudit
 select * from ItemsReport

 /**Create View for Source**/
use source_db_shiv
go
CREATE VIEW v1 AS 
SELECT CustomerID, OrderDate, s.OrderID, ItemID, Quantity, UnitPrice, LastModified
FROM SaleOrder s JOIN OrderItem o
ON s.OrderID = o.OrderID;

select * from v1
/**Insert Data into the tables**/
USE source_db_shiv
GO
INSERT INTO SaleOrder (OrderDate, CustomerID) 
VALUES ('2021-02-04', 1), 
	   ('2021-02-05', 2), 
	   ('2021-02-06', 3),
	   ('2021-02-07',4);

INSERT INTO SaleOrder(OrderDate,CustomerID) VALUES ('2022-04-01',5);

SELECT * FROM SaleOrder

INSERT INTO OrderItem (ItemID, OrderID, Quantity, UnitPrice) 
VALUES (1,1, 10, 5), 
	   (2,2, 20, 10), 
	   (3,3, 30, 15), 
       (4,2, 40, 20);


SELECT * FROM OrderItem
-----------------------------------------------------------------------------


SELECT * FROM ItemsReport
CREATE PROCEDURE [dbo].[DataPipeline] AS
BEGIN 
MERGE destination_db_shiv.dbo.ItemsReport d
USING source_db_shiv.dbo.v1 s
ON s.ItemID = d.ItemID
WHEN MATCHED THEN update set d.Quantity = s.Quantity, d.UnitPrice = s.UnitPrice, 
d.LastModified = s.LastModified
WHEN NOT MATCHED BY SOURCE THEN delete
WHEN NOT MATCHED THEN INSERT (CustomerID, OrderDate, OrderID, ItemID, Quantity, UnitPrice, 
LastModified) VALUES (s.CustomerID, s.OrderDate, s.OrderID, s.ItemID, 
s.Quantity, s.UnitPrice, s.LastModified)
OUTPUT $action,
ISNULL(Deleted.CustomerID, Inserted.CustomerID),
ISNULL(Deleted.OrderDate, Inserted.OrderDate),
ISNULL(Deleted.OrderID, Inserted.OrderID),
ISNULL(Deleted.ItemID, Inserted.ItemID),
Deleted.Quantity,
Inserted.Quantity,
Deleted.UnitPrice,
Inserted.UnitPrice,
Deleted.LastModified,
Inserted.LastModified
INTO destination_db_shiv.dbo.ItemsAudit ([Action], CustomerID, OrderDate, OrderID, ItemID, OldQuantity, NewQuantity, 
OldUnitPrice, NewUnitPrice, NewLastModified, OldLastModified);
END;



USE source_db_shiv
GO
EXEC [dbo].[DataPipeline]

select *from ItemsReport
select * from ItemsAudit




