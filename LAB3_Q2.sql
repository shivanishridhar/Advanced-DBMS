SELECT h.SalesOrderID,
(SELECT ProductID, OrderQty
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = h.SalesOrderID
FOR JSON PATH)
AS Products
FROM 
Sales.SalesOrderHeader AS h
WHERE SalesOrderID BETWEEN 43660 AND 43680
ORDER BY h.SalesOrderID
FOR JSON PATH;










