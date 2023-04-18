/**Top 3 products in each Territory**/
select TerritoryID,
(select top 3
ProductID,
SUM(OrderQty) as TotalProductQuantity
from Sales.SalesOrderDetail o 
join sales.SalesOrderHeader h on o.SalesOrderID = h.SalesOrderID
join sales.SalesTerritory t1 on h.TerritoryID = t.TerritoryID
where t1.TerritoryID = t.TerritoryID
GROUP BY ProductID
ORDER BY TotalProductQuantity DESC
FOR JSON PATH)
as Top3Products
from sales.SalesTerritory t
ORDER BY TerritoryID
FOR JSON PATH;