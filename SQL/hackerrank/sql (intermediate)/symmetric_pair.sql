/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
WITH sym as (
SELECT
    X,
    Y,
    ROW_NUMBER() OVER(ORDER BY X, Y) AS row_num
FROM Functions
)

SELECT
    DISTINCT
    s1.X,
    s1.Y
FROM sym as s1
JOIN sym as s2
ON s1.X = s2.Y 
AND s2.X = s1.Y
AND s1.row_num <> s2.row_num
WHERE s1.X <= s1.Y
ORDER BY s1.X, s1.Y
