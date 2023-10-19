/* Write your T-SQL query statement below */
select MAX(num) as num
FROM MyNumbers
WHERE num in (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING count(num) = 1
)


-- Runtime: 807ms, Beats 44.11%of users with MS SQL Server
