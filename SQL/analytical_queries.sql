-- 1.	Napište SQL dotaz, kterým ověříte, zda jsou v tabulce Products nějaké záznamy se stejným ProductName. (3 body) 

SELECT 
 	p.ProductName,
 	COUNT(*) AS  DuplicateCount
FROM Products AS p
GROUP BY ProductName    -- seskupí řádky podle názvu produktu
HAVING COUNT(*) > 1;        -- nechá jen ty názvy, které se opakují(duplicity)

-- Nejsou žádné duplicitní záznamy se stejným ProductName



 
-- 2.	Napište SQL dotaz, kterým pro každou zemi (Country) spočítejte celkovou cenu objednávek. Vyberte ty země, kde celková cena je větší než 100 a seřaďte je podle celkové ceny. (5 bodů) 

SELECT 
	c.Country,
	SUM(od.Quantity * p.Price) AS TotalOrderPrice 
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
ORDER BY TotalOrderPrice DESC;




-- 3.	Napište SQL dotaz, kterým pro každého dopravce (ShipperName) spočítejte zvlášt počet objednávek na produkty kategorie “Seafood” a počet objednávek na produkty kategorie “Beverages”. Objednávky omezte na rok 1997. (5 bodů) 


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

--Je nutné použít DISTINCT, protože jedna objednávka může mít více řádků v OrderDetails. U dopravce Speedy Express by v kategorii SeafoodOrders vycházel počet objednávek 7 místo 5ti.
-- Bez DISTINCT bychom počítali spíš počet položek objednávek, ne skutečný počet objednávek. 

-- 5a) Kteří zaměstnanci v roce 1997 vygenerovali nejvyšší tržby, největší počet objednávek a jaká byla průměrná hodnota objednávky?

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



-- 5b) Které produktové kategorie mají nejvyšší tržby a kolik kusů se v nich prodalo?

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



