-- =====================================================
-- Task 1
-- Check whether the Products table contains duplicate
-- ProductName values.
-- =====================================================
-- CZ 1.Napište SQL dotaz, kterým ověříte, 
-- zda jsou v tabulce Products nějaké záznamy se stejným ProductName.  

-- EN 1. Write an SQL query to check whether there are any records
-- in the Products table with the same ProductName.

SELECT
    p.ProductName,
    COUNT(*) AS DuplicateCount
FROM Products AS p
GROUP BY
    p.ProductName
HAVING COUNT(*) > 1;

-- Result:
-- No duplicate ProductName values were found.

--CZ:  Nejsou žádné duplicitní záznamy se stejným ProductName


-- =====================================================
-- Task 2
-- Calculate total order value for each country.
-- Return only countries with total order value > 100
-- and sort them by total order value.
-- =====================================================

-- CZ 2. Napište SQL dotaz, kterým pro každou zemi (Country) spočítejte celkovou cenu objednávek.
-- Vyberte ty země, kde celková cena je větší než 100 a seřaďte je podle celkové ceny.

-- EN 2. Write an SQL query to calculate the total order value for each country (Country).
-- Select the countries where the total order value is greater than 100
-- and sort them by total order value.

SELECT 
	c.Country,
	SUM(od.Quantity * p.Price) AS 'TotalOrderValue' 
FROM Customers AS c
INNER JOIN Orders  AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
GROUP BY Country
HAVING 
     SUM(od.Quantity * p.Price) > 100
ORDER BY TotalOrderValue DESC;


-- =====================================================
-- Task 3
-- For each shipper, calculate separately the number
-- of orders containing Seafood products and the number
-- of orders containing Beverages products.
-- Limit the analysis to 1997.
-- =====================================================

-- CZ 3.	Napište SQL dotaz, kterým pro každého dopravce (ShipperName) spočítejte zvlášt počet objednávek na produkty kategorie “Seafood” a 
-- počet objednávek na produkty kategorie “Beverages”. Objednávky omezte na rok 1997. 

-- EN 3. Write an SQL query to calculate, for each shipper (ShipperName),
-- separately the number of orders containing products from the "Seafood" category
-- and the number of orders containing products from the "Beverages" category.
-- Limit the orders to the year 1997.

SELECT
 	s.ShipperName,

 	COUNT(DISTINCT CASE
 	WHEN c.CategoryName = 'Seafood'
 	THEN o.OrderID
 	END) AS SeafoodOrdersCount,

 	COUNT(DISTINCT CASE
 	WHEN c.CategoryName = 'Beverages'
 	THEN o.OrderID
 	END) AS BeveragesOrdersCount

FROM Shippers AS s
INNER JOIN Orders AS o
    ON s.ShipperID = o.ShipperID
INNER JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
JOIN Categories AS c
    ON p.CategoryID = c.CategoryID

WHERE o.OrderDate >= '1997-01-01' 
AND o.OrderDate < '1998-01-01'

GROUP BY 
	s.ShipperName
ORDER BY 
	s.ShipperName;

-- ENG: 
-- DISTINCT is required because one order can contain
-- multiple OrderDetails rows from the same category.
-- Without DISTINCT, the query would count order lines
-- rather than unique orders.

-- CZ: 
-- Je nutné použít DISTINCT, protože jedna objednávka může mít více řádků v OrderDetails. 
-- U dopravce Speedy Express by v kategorii SeafoodOrders vycházel počet objednávek 7 místo 5ti.
-- Bez DISTINCT bychom počítali spíš počet položek objednávek, ne skutečný počet objednávek. 


-- =====================================================
-- Task 5a
-- Employee performance in 1997:
-- total sales, number of orders and average order value.
-- =====================================================
-- CZ: 5a) Kteří zaměstnanci v roce 1997 vygenerovali nejvyšší tržby, největší počet objednávek a jaká byla průměrná hodnota objednávky?
-- ENG: Which employees generated the highest sales in 1997, how many orders did they handle, and what was their average order value?

WITH OrderValues AS (
    SELECT
        o.OrderID,
        o.EmployeeID,
        SUM(od.Quantity * p.Price) AS OrderValue
    FROM Orders AS o
    INNER JOIN OrderDetails AS od
        ON o.OrderID = od.OrderID
    INNER JOIN Products AS p
        ON od.ProductID = p.ProductID
    WHERE o.OrderDate >= '1997-01-01'
      AND o.OrderDate < '1998-01-01'
    GROUP BY
        o.OrderID,
        o.EmployeeID
)

SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    COUNT(ov.OrderID) AS OrderCount,
    SUM(ov.OrderValue) AS TotalSales,
    AVG(ov.OrderValue) AS AverageOrderValue
FROM Employees AS e
INNER JOIN OrderValues AS ov
    ON e.EmployeeID = ov.EmployeeID
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY
    TotalSales DESC;


-- =====================================================
-- Task 5b
-- Product category performance in 1997:
-- number of orders, units sold and total sales.
-- =====================================================
--CZ: 5b) Které produktové kategorie mají nejvyšší tržby a kolik kusů se v nich prodalo?
--ENG: Which product categories generated the highest sales, and how many units were sold in each category?


SELECT
    	 c.CategoryName,
   	 COUNT(DISTINCT o.OrderID) AS OrderCount,
    	 SUM(od.Quantity) AS UnitSold,
   	 SUM(od.Quantity * p.Price) AS TotalSales
FROM Categories AS c
INNER JOIN Products AS p 
    	ON c.CategoryID = p.CategoryID
INNER  JOIN OrderDetails AS od 
 	ON p.ProductID = od.ProductID
INNER  JOIN Orders AS o 
    	ON od.OrderID = o.OrderID
WHERE o.OrderDate >= '1997-01-01' 
      AND o.OrderDate < '1998-01-01' 
GROUP BY  
c.CategoryName
ORDER BY 
 	 TotalSales DESC;



