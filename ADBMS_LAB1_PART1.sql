WITH
    Sales_By_Quarter AS
(
    SELECT
        DATEPART(YEAR, OrderDate) AS [Year],
        DATEPART(QUARTER, OrderDate) AS [Quarter],
        SUM(TotalDue) AS [Quarterly Sales],
        SUM(TotalDue) - LAG(SUM(TotalDue)) OVER (ORDER BY DATEPART(YEAR, OrderDate), DATEPART(QUARTER, OrderDate)) AS [Change]
    FROM
        Sales.SalesOrderHeader
    GROUP BY
        DATEPART(YEAR, OrderDate),
        DATEPART(QUARTER, OrderDate)
)
SELECT
    RIGHT(CONCAT('    ', Q.[Year]), 12) AS [OrderYear],

    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 1 THEN Q.[Quarterly Sales] END), 'N0')), 12) AS [1st Quarter],
    RIGHT(REPLACE(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 1 THEN Q.[Quarterly Sales] END) * 100.0 / SUM(Q.[Quarterly Sales]), 'N2'), '%'), '    %','    '), 12) AS [Annual %],
    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 1 THEN Q.[Change]          END), 'N0')), 12) AS [4 to 1 Change],

    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 2 THEN Q.[Quarterly Sales] END), 'N0')), 12) AS [2nd Quarter],
    RIGHT(REPLACE(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 2 THEN Q.[Quarterly Sales] END) * 100.0 / SUM(Q.[Quarterly Sales]), 'N2'), '%'), '    %','    '), 12) AS [Annual %],
    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 2 THEN Q.[Change]          END), 'N0')), 12) AS [1 to 2 Change],

    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 3 THEN Q.[Quarterly Sales] END), 'N0')), 12) AS [3rd Quarter],
    RIGHT(REPLACE(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 3 THEN Q.[Quarterly Sales] END) * 100.0 / SUM(Q.[Quarterly Sales]), 'N2'), '%'), '    %','    '), 12) AS [Annual %],
    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 3 THEN Q.[Change]          END), 'N0')), 12) AS [2 to 3 Change],

    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 4 THEN Q.[Quarterly Sales] END), 'N0')), 12) AS [4th Quarter],
    RIGHT(REPLACE(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 4 THEN Q.[Quarterly Sales] END) * 100.0 / SUM(Q.[Quarterly Sales]), 'N2'), '%'), '    %','    '), 12) AS [Annual %],
    RIGHT(CONCAT('    ',FORMAT(SUM(CASE WHEN Q.[Quarter] = 4 THEN Q.[Change]          END), 'N0')), 12) AS [3 to 4 Change],

    RIGHT(CONCAT('    ',FORMAT(SUM(Q.[Quarterly Sales]), 'N0')), 12) AS [AnnualSales]
   
FROM
    Sales_By_Quarter    As Q
GROUP BY
    Q.[Year]
ORDER BY
    Q.[Year]