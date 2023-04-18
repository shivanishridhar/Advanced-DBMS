/**SQL query for generating JSON file**/
select SalesPersonID, 
CAST(ROUND(SUM(TotalDue),0) AS INT) AS TotalSales 
FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID 
ORDER BY SalesPersonID ASC
FOR JSON PATH