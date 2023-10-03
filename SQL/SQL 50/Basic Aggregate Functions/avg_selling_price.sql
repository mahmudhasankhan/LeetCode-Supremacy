/* Write your T-SQL query statement below */
SELECT P.product_id
, ISNULL(ROUND(CAST(SUM(P.price * U.units) AS DECIMAL(10,2)) / CAST(SUM(U.units) AS DECIMAL(10,2)), 2), 0) AS average_price
FROM Prices AS P
LEFT JOIN UnitsSold AS U
ON P.product_id = U.product_id
AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;

-- 853ms, Beats 40.16%of users with MS SQL Server
