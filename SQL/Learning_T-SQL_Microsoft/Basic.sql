SELECT SalesPerson, Title + FirstName AS Customer_Name, Phone 
FROM SalesLT.Customer;

SELECT * FROM SalesLT.Customer;

SELECT CAST(CustomerID AS varchar(5)) + ': ' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;

SELECT * FROM SalesLT.SalesOrderHeader;

SELECT SalesOrderNumber + '(' + CAST(RevisionNumber as varchar(5)) + ')' AS 'Sales Orders'
FROM SalesLT.SalesOrderHeader;

SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS OrderRevision,
    CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

SELECT OrderDate,
    CONVERT(nvarchar(30), OrderDate, 102) AS 'ANSI Standard'
 FROM SalesLT.SalesOrderHeader; 

SELECT * FROM SalesLT.Customer;

SELECT FirstName + ' '+ ISNULL(MiddleName + ' ', '') + ' ' + LastName 
FROM SalesLT.Customer;

-- UPDATE SalesLT.Customer
-- SET EmailAddress = NULL
-- WHERE CustomerID % 7 = 1;

SELECT CustomerID,
    CASE 
        WHEN EmailAddress IS NOT NULL THEN EmailAddress
        ELSE Phone
    END AS 'PrimaryContact'
FROM SalesLT.Customer;

SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;


-- UPDATE SalesLT.SalesOrderHeader
-- SET ShipDate = NULL
-- WHERE SalesOrderID > 71899;

SELECT * FROM SalesLT.SalesOrderHeader

SELECT SalesOrderID, OrderDate,
    CASE 
        WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
        ELSE 'Shipped'
    END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;