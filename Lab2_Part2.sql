/**SOURCE DATABASE**/
USE source_db_shiv
GO 
CREATE TABLE CustomerOrder 
(OrderID INT IDENTITY PRIMARY KEY, 
 CustomerID INT NOT NULL, 
 OrderDate DATETIME DEFAULT getdate(), 
 OrderValue MONEY NOT NULL);

/**DESTINATION DATABASE**/
CREATE TABLE CustomerReport 
(CustomerID INT PRIMARY KEY, 
 LastName VARCHAR(50), 
 FirstName VARCHAR(50), 
 Email VARCHAR(50), 
 Phone VARCHAR(20), 
 TotalPurchase MONEY, 
 NumberOfOrders INT, 
 ModifiedDate DATETIME DEFAULT getdate()); 
 
CREATE TABLE AuditCustomer 
 ( 
  Audit_PK  INT  IDENTITY(1,1) PRIMARY KEY 
  ,CustomerID  INT  NOT NULL 
  ,OrderID INT 
  ,OrderDate DATETIME 
  ,OrderValue MONEY 
  ,ModifiedDate DATETIME 
  ,[Action] CHAR(6) 
 ); 

INSERT INTO CustomerOrder(CustomerID,OrderDate,OrderValue) VALUES
(2,GETDATE(),5);
SELECT * FROM CustomerOrder

/**INSERT TRIGGER**/
CREATE TRIGGER TR_IN_CustOrder
ON [source_db_shiv].[dbo].CustomerOrder
AFTER INSERT
AS
BEGIN
DECLARE @custID INT
DECLARE @orderValue MONEY
SELECT @custID = CustomerID, @orderValue = OrderValue
FROM inserted

UPDATE [destination_db_shiv].[dbo].CustomerReport
SET TotalPurchase = TotalPurchase + @orderValue, NumberOfOrders = NumberOfOrders + 1
WHERE CustomerID = @custID

INSERT INTO [destination_db_shiv].[dbo].AuditCustomer (CustomerID, OrderID, OrderDate, OrderValue, ModifiedDate, [Action])
SELECT @custID, OrderID, OrderDate, @orderValue, GETDATE(), 'INSERT'
FROM inserted
END

/**CHECK TABLES**/
SELECT * FROM AuditCustomer
SELECT * FROM CustomerReport
SELECT * FROM CustomerOrder

UPDATE CustomerOrder 
SET OrderValue = 10 where CustomerID = 3

SELECT * FROM CustomerReport

/**INSERT DATA IN CUSTOMERREPORT**/
INSERT INTO CustomerReport(CustomerID,LastName,FirstName,Email,Phone,TotalPurchase,NumberOfOrders,ModifiedDate) VALUES
(2,'Inamdar','Chaitanya','inamdar.chaitanya@gmail.com','8674584367',90,5,GETDATE());
INSERT INTO CustomerReport(CustomerID,LastName,FirstName,Email,Phone,TotalPurchase,NumberOfOrders,ModifiedDate) VALUES
(3,'Bandivdekar','Akshaya','bandivdekar.akshaya@gmail.com','8674974367',80,5,GETDATE());
INSERT INTO CustomerReport(CustomerID,LastName,FirstName,Email,Phone,TotalPurchase,NumberOfOrders,ModifiedDate) VALUES
(5,'Kalmady','Aditi','kalmady.aditi@gmail.com','8474984367',30,2,GETDATE());
INSERT INTO CustomerReport(CustomerID,LastName,FirstName,Email,Phone,TotalPurchase,NumberOfOrders,ModifiedDate) VALUES
(6,'Gole','Shivani','shivani.s.gole@gmail.com','8574983377',80,5,getdate())

select * from customerOrder

INSERT INTO CustomerOrder(CustomerID,OrderDate,OrderValue) VALUES
(5,GETDATE(),35);

/**DELETE TRIGGER**/
CREATE TRIGGER TR_DEL_CustOrder
ON source_db_shiv.dbo.CustomerOrder
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE @cust_id INT; 
DECLARE @order_value MONEY; 

SELECT @cust_id = d.CustomerID, 
       @order_value = d.OrderValue 
FROM deleted d 

UPDATE destination_db_shiv.dbo.CustomerReport 
SET TotalPurchase = TotalPurchase - @order_value, 
    NumberOfOrders = NumberOfOrders - 1, 
    ModifiedDate = GETDATE() 
WHERE CustomerID = @cust_id; 

INSERT INTO destination_db_shiv.dbo.AuditCustomer 
        (CustomerID, 
         OrderID, 
         OrderDate, 
         OrderValue, 
         ModifiedDate, 
         [Action]) 
SELECT @cust_id, 
       d.OrderID, 
       d.OrderDate, 
       @order_value, 
       GETDATE(), 
       'DELETE' 
FROM deleted d; 
END
GO

DELETE FROM CustomerOrder WHERE CustomerID = 5

/**UPDATE TRIGGER**/
CREATE TRIGGER TR_UP_CustOrder
ON [source_db_shiv].[dbo].CustomerOrder
AFTER UPDATE
AS
BEGIN
DECLARE @OldValue MONEY, @NewValue MONEY, @CustomerID INT;
SELECT @OldValue = deleted.OrderValue, @NewValue = inserted.OrderValue, @CustomerID = inserted.CustomerID
FROM deleted
INNER JOIN inserted ON deleted.OrderID = inserted.OrderID;

UPDATE [destination_db_shiv].[dbo].CustomerReport
SET TotalPurchase = @NewValue,
    ModifiedDate = GETDATE()
WHERE CustomerID = @CustomerID;

INSERT INTO [destination_db_shiv].[dbo].AuditCustomer (CustomerID, OrderID, OrderDate, OrderValue, ModifiedDate, [Action])
SELECT inserted.CustomerID, inserted.OrderID, inserted.OrderDate, inserted.OrderValue, GETDATE(), 'UPDATE'
FROM inserted;
END;

INSERT INTO CustomerOrder(CustomerID,OrderDate,OrderValue) VALUES
(6,GETDATE(),26);


UPDATE CustomerOrder
SET OrderValue = 20 where CustomerID = 6

