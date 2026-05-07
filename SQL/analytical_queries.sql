-- 1.	Napište SQL dotaz, kterým ověříte, zda jsou v tabulce Products nějaké záznamy se stejným ProductName. (3 body) 

SELECT 
 	ProductName,
 	COUNT(*) AS  Počet
FROM Products
GROUP BY ProductName    -- seskupí řádky podle názvu produktu
HAVING COUNT(*) > 1;        -- nechá jen ty názvy, které se opakují(duplicity)

-- Nejsou žádné duplicitní záznamy se stejným ProductName



 
-- 2.	Napište SQL dotaz, kterým pro každou zemi (Country) spočítejte celkovou cenu objednávek. Vyberte ty země, kde celková cena je větší než 100 a seřaďte je podle celkové ceny. (5 bodů) 

SELECT 
	Country,
	SUM(od.Quantity * p.Price) AS TotalOrderPrice 
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
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
 	END) AS SeafoodOrders,

 	COUNT(DISTINCT CASE
 	WHEN c.CategoryName = 'Beverages'
 	THEN o.OrderID
 	END) AS BeveragesOrders

FROM Shippers s
JOIN Orders o
    ON s.ShipperID = o.ShipperID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
JOIN Categories c
    ON p.CategoryID = c.CategoryID

WHERE YEAR(o.OrderDate) = 1997
GROUP BY s.ShipperName
ORDER BY s.ShipperName;

--Je nutné použít DISTINCT, protože jedna objednávka může mít více řádků v OrderDetails. U dopravce Speedy Express by v kategorii SeafoodOrders vycházel počet objednávek 7 místo 5ti.
-- Bez DISTINCT bychom počítali spíš počet položek objednávek, ne skutečný počet objednávek. 

-- 5a) Kteří zaměstnanci v roce 1997 vygenerovali nejvyšší tržby, největší počet objednávek a jaká byla průměrná hodnota objednávky?

SELECT
    e.FirstName,
    e.LastName,
    COUNT(DISTINCT o.OrderID) AS PocetObjednavek,
    SUM(od.Quantity * p.Price) AS CelkovaTrzba,
    SUM(od.Quantity * p.Price) / COUNT(DISTINCT o.OrderID) AS PrumernaHodnotaObjednavky
 
FROM Employees e
JOIN Orders o
    ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY
    CelkovaTrzba DESC;


-- 5b) Které produktové kategorie mají nejvyšší tržby a kolik kusů se v nich prodalo?

SELECT
    cat.CategoryName,
    COUNT(DISTINCT o.OrderID) AS PocetObjednavek,
    SUM(od.Quantity) AS ProdaneMnozstvi,
    SUM(od.Quantity * p.Price) AS CelkovaTrzba,
    AVG(p.Price) AS PrumernaCenaProduktu
FROM Categories cat
JOIN Products p 
    ON cat.CategoryID = p.CategoryID
JOIN OrderDetails od 
    ON p.ProductID = od.ProductID
JOIN Orders o 
    ON od.OrderID = o.OrderID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY 
    cat.CategoryName
ORDER BY 
    CelkovaTrzba DESC;


