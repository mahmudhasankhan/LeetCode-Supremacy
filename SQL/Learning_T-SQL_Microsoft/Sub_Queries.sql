/* 
    Scalar and Multi-valued sub queries
*/

SELECT MAX(SalesOrderID) as Max_SalesOrderID
FROM SalesLT.SalesOrderHeader;

SELECT SalesOrderID, ProductID, OrderQty
FROM SalesLT.SalesOrderDetail
WHERE SalesOrderID = (
    SELECT MAX(SalesOrderID)
    FROM SalesLT.SalesOrderHeader
);

SELECT SalesOrderID, ProductID, OrderQty,
    (SELECT AVG(OrderQty)
     FROM SalesLT.SalesOrderDetail) AS AvgQty
FROM SalesLT.SalesOrderDetail
WHERE SalesOrderID = 
    (SELECT MAX(SalesOrderID)
     FROM SalesLT.SalesOrderHeader);

SELECT
*
FROM SalesLT.Address;


-- SELECT c.CustomerID, o.SalesOrderID
-- FROM Sales.Customer AS c
-- JOIN Sales.SalesOrderHeader AS o
--     ON c.CustomerID = o.CustomerID
-- WHERE c. CountryRegion = 'Canada';

/* Use self-contained or correlated subqueries */

SELECT SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader AS o1
WHERE SalesOrderID =
    (SELECT MAX(SalesOrderID)
     FROM SalesLT.SalesOrderHeader AS o2
     WHERE o2.CustomerID = o1.CustomerID)
ORDER BY CustomerID, OrderDate;



/* Working with EXISTS */

-- SELECT CustomerID, CompanyName, EmailAddress 
-- FROM Sales.Customer AS c 
-- WHERE
-- (SELECT COUNT(*) 
--   FROM Sales.SalesOrderHeader AS o
--   WHERE o.CustomerID = c.CustomerID) > 0;



-- SELECT CustomerID, CompanyName, EmailAddress 
-- FROM Sales.Customer AS c 
-- WHERE EXISTS
-- (SELECT * 
--   FROM Sales.SalesOrderHeader AS o
--   WHERE o.CustomerID = c.CustomerID);


/* EXERCISE */

-- Using simple sub queries


--------------------------------------|

SELECT MAX(UnitPrice)
FROM SalesLT.SalesOrderDetail;


SELECT Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice >
    (SELECT MAX(UnitPrice)
    FROM SalesLT.SalesOrderDetail);

--------------------------------------|

SELECT DISTINCT ProductID
FROM SalesLT.SalesOrderDetail
WHERE OrderQty >= 20;


SELECT Name FROM SalesLT.Product
WHERE ProductID IN
    (SELECT DISTINCT ProductID
    FROM SalesLT.SalesOrderDetail
    WHERE OrderQty >= 20);


SELECT DISTINCT Name
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS o
    ON p.ProductID = o.ProductID
WHERE OrderQty >= 20;

--------------------------------------|


/* Correlated Sub Queries */

--------------------------------------|

SELECT od.SalesOrderID, od.ProductID, od.OrderQty
FROM SalesLT.SalesOrderDetail AS od
ORDER BY od.ProductID;

SELECT od.SalesOrderID, od.ProductID, od.OrderQty
FROM SalesLT.SalesOrderDetail AS od
WHERE od.OrderQty =
    (SELECT MAX(OrderQty)
    FROM SalesLT.SalesOrderDetail AS d
    WHERE od.ProductID = d.ProductID)
 ORDER BY od.ProductID;

--------------------------------------|

SELECT o.SalesOrderID, o.OrderDate, o.CustomerID
FROM SalesLT.SalesOrderHeader AS o
ORDER BY o.SalesOrderID;


SELECT o.SalesOrderID, o.OrderDate,
    (SELECT CompanyName
    FROM SalesLT.Customer AS c
    WHERE c.CustomerID = o.CustomerID) AS CompanyName
FROM SalesLT.SalesOrderHeader AS o
ORDER BY o.SalesOrderID;

-- Equivalent
SELECT o.SalesOrderID, o.OrderDate, c.CompanyName
FROM SalesLT.SalesOrderHeader as o
JOIN SalesLT.Customer as c
    ON c.CustomerID = o.CustomerID
ORDER BY o.SalesOrderID;

--------------------------------------|


/*
    CHALLENGE 1!
*/

-- 1
SELECT p.ProductID, p.Name, p.ListPrice
FROM SalesLT.Product as p 
WHERE p.ListPrice < (
    SELECT AVG(d.UnitPrice)
    FROM SalesLT.SalesOrderDetail as d
)
ORDER BY p.ProductID;


--2
-- My code
SELECT p.ProductID, p.Name, p.ListPrice, o.UnitPrice
FROM SalesLT.Product as p
JOIN SalesLT.SalesOrderDetail as o 
    ON p.ProductID = o.ProductID
WHERE o.UnitPrice < 100 and p.ListPrice >= 100
ORDER BY ProductID;

-- Copied Code
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductID IN 
    (SELECT ProductID
    FROM SalesLT.SalesOrderDetail
    WHERE UnitPrice < 100.00)
AND ListPrice >= 100.00
ORDER BY ProductID;

/* Challenge 2: Analyze profitability */


--1
SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice,
(SELECT AVG(o.UnitPrice)
FROM SalesLT.SalesOrderDetail as o
WHERE p.ProductID = o.ProductID) as Avg_Selling_Price
FROM SalesLT.Product as p 
ORDER BY p.ProductID;

--2 
SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice,
(SELECT AVG(o.UnitPrice)
FROM SalesLT.SalesOrderDetail as o
WHERE p.ProductID = o.ProductID) as Avg_Selling_Price
FROM SalesLT.Product as p
WHERE p.StandardCost > (SELECT AVG(od.UnitPrice)
FROM SalesLT.SalesOrderDetail as od
WHERE p.ProductID = od.ProductID)
ORDER BY ProductID;