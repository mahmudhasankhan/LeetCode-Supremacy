-- INNER JOIN
SELECT TOP (10) *
FROM SalesLT.Product;

SELECT TOP (10) *
FROM SalesLT.ProductCategory;

SELECT p.Name AS ProductName, c.Name AS Category
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS c
    ON p.ProductCategoryID = c.ProductCategoryID;


SELECT TOP (10) * 
FROM SalesLT.SalesOrderHeader
ORDER BY TotalDue DESC


SELECT TOP (10) * 
FROM SalesLT.SalesOrderDetail
ORDER BY UnitPrice DESC

SELECT TOP (10) *
FROM SalesLT.Product
ORDER BY Weight DESC

-- Outer JOIN

SELECT TOP (10) *
FROM SalesLT.Customer
ORDER BY FirstName ASC;

SELECT TOP (10) *
FROM SalesLT.SalesOrderHeader;

SELECT c.FirstName + ' ' + c.LastName AS Customer,
    CASE
        WHEN h.SalesOrderNumber IS NULL THEN 'DID NOT PLACE ORDER'
        ELSE h.SalesOrderNumber
    END AS OrderStatus
FROM SalesLT.Customer AS c 
LEFT JOIN SalesLT.SalesOrderHeader AS h
    ON c.CustomerID = h.CustomerID
WHERE h.SalesOrderNumber IS NOT NULL
ORDER BY c.CustomerID;

SELECT c.FirstName, c.LastName,
    CASE
        WHEN oh.SalesOrderNumber IS NULL THEN 'DID NOT PLACE ORDER'
        ELSE oh.SalesOrderNumber
    END AS OrderStatus
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NOT NULL
ORDER BY c.CustomerID;


SELECT p.Name As ProductName, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON od.SalesOrderID = oh.SalesOrderID
ORDER BY p.ProductID;


SELECT p.Name As ProductName, c.Name AS Category, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT OUTER JOIN SalesLT.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
    ON od.SalesOrderID = oh.SalesOrderID
INNER JOIN SalesLT.ProductCategory AS c
    ON p.ProductCategoryID = c.ProductCategoryID
ORDER BY p.ProductID;


-----------------------------------
-- EXERCISE
SELECT SalesLT.Product.Name As ProductName, SalesLT.ProductCategory.Name AS Category
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory
 ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;

-- Modify 

SELECT SalesLT.Product.Name As ProductName, SalesLT.ProductCategory.Name AS Category
FROM SalesLT.Product
JOIN SalesLT.ProductCategory
    ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;


-- Modify 

SELECT p.Name As ProductName, c.Name AS Category
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory As c
    ON p.ProductCategoryID = c.ProductCategoryID;


-- Modify
 
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name As ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader AS oh
JOIN SalesLT.SalesOrderDetail AS od
    ON od.SalesOrderID = oh.SalesOrderID
JOIN SalesLT.Product AS p
    ON od.ProductID = p.ProductID
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;


-- OUTER JOINS

SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;


-- Modify 

SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;


-- Modify 

SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NULL 
ORDER BY c.CustomerID;


-- Modify

SELECT p.Name As ProductName, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON od.SalesOrderID = oh.SalesOrderID
ORDER BY p.ProductID;


-- Modify
SELECT p.Name As ProductName, c.Name AS Category, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT OUTER JOIN SalesLT.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
    ON od.SalesOrderID = oh.SalesOrderID
INNER JOIN SalesLT.ProductCategory AS c
    ON p.ProductCategoryID = c.ProductCategoryID
ORDER BY p.ProductID;



-- CROSS JOIN

SELECT p.Name, c.FirstName, c.LastName, c.EmailAddress
FROM SalesLT.Product as p
CROSS JOIN SalesLT.Customer as c;



-- SELF JOIN

SELECT pcat.Name AS ParentCategory, cat.Name AS SubCategory
FROM SalesLT.ProductCategory as cat
JOIN SalesLT.ProductCategory pcat
    ON cat.ParentProductCategoryID = pcat.ProductCategoryID
ORDER BY ParentCategory, SubCategory;



/*
    CHALLENGE 1!
*/

-- 1
SELECT c.CompanyName, s.SalesOrderID, s.TotalDue
FROM SalesLT.Customer as c
JOIN SalesLT.SalesOrderHeader as s
 ON c.CustomerID = s.CustomerID
ORDER BY s.TotalDue DESC;


-- 2
SELECT c.CompanyName,
s.SalesOrderID,
s.TotalDue, 
ca.AddressType,
ad.AddressLine1,
ISNULL(ad.AddressLine2, '') as AddressLine2,
ad.City,
ad.CountryRegion,
ad.PostalCode
FROM SalesLT.Customer as c
JOIN SalesLT.SalesOrderHeader as s
    ON c.CustomerID = s.CustomerID
JOIN SalesLT.CustomerAddress as ca
    ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address as ad
    ON ca.AddressID = ad.AddressID
WHERE ca.AddressType = 'Main Office'
ORDER BY s.TotalDue DESC;


/*
    CHALLENGE 2!
*/

-- 1
SELECT c.CompanyName, c.FirstName + ' ' + c.LastName as Contact, oh.SalesOrderID, oh.TotalDue
FROM SalesLT.Customer as c
LEFT JOIN SalesLT.SalesOrderHeader as oh
    ON c.CustomerID = oh.CustomerID
ORDER BY oh.SalesOrderID DESC;

-- 2
select c.CustomerID, c.CompanyName, c.FirstName + ' ' + c.LastName as Contact, c.Phone
FROM SalesLT.Customer as c
LEFT JOIN SalesLT.CustomerAddress as ca
    ON c.CustomerID = ca.CustomerID
WHERE ca.AddressID IS NULL;


/*
    CHALLENGE 3!
*/

SELECT * FROM SalesLT.Product;
SELECT * FROM SalesLT.ProductModel;
SELECT * FROM SalesLT.ProductModelProductDescription;
SELECT * FROM SalesLT.ProductDescription;
SELECT * FROM SalesLT.ProductCategory;


SELECT pcat.Name AS ParentCategory, cat.Name AS SubCategory, prd.Name AS ProductName
FROM SalesLT.ProductCategory pcat
JOIN SalesLT.ProductCategory as cat
    ON pcat.ProductCategoryID = cat.ParentProductCategoryID
JOIN SalesLT.Product as prd
    ON prd.ProductCategoryID = cat.ProductCategoryID
ORDER BY ParentCategory, SubCategory, ProductName;

