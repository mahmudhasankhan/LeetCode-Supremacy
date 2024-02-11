/*

Table: Accounts

+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.
 

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.

*/

-- Solution:

SELECT 
cast(NUll as varchar(256)) as category,
income
into #temp
FROM Accounts

update #temp
set category = 'Low Salary' 
where income < 20000


update #temp
set category = 'Average Salary' 
where income >= 20000
and incom <= 50000

update #temp
set category = 'High Salary' 
where income >= 50000


select category, count(category) as accounts_count
from #temp
group by category

-- this would've worked in a realistic setting, oh well :/

---------------------------------------------------------------------

 WITH temp AS(
     select *, 
     CASE
         WHEN income < 20000 then 'Low Salary'
         WHEN income between 20000 and 50000 then 'Average Salary'
         WHEN income > 50000 then 'High Salary'
     END AS category
     from Accounts
 )

 select category, count(account_id) as accounts_count
 from temp
 group by category

-- Tried but 10/11 cases passed

--------------------------------------------------------------------
SELECT 'Low Salary' as category,
SUM(CASE WHEN income < 20000 THEN 1 ElSE 0 END) AS accounts_count FROM Accounts
UNION 
SELECT 'High Salary' as category,
SUM(CASE WHEN income > 50000 THEN 1 ElSE 0 END) AS accounts_count FROM Accounts
UNION 
SELECT 'Low Salary' as category,
SUM(CASE WHEN income between 20000 and 50000 THEN 1 ElSE 0 END) AS accounts_count FROM Accounts
ORDER BY accounts_count DESC 

-- passed
