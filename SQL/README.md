# SQL Basics

## Contents:

-   [JOINS](###Join)
-   [AGGREGATE FUNCIONS](###Aggregate)
-   [WINDOW FUNCTIONS](###Window)


### JOINS
Joins are used to combine rows from two or more tables based on a related/ common column.

Different types of Joins:
- (INNER) JOIN: Returns records that have matching values in both table.
- LEFT (OUTER) JOIN: Returns all records from the left table and the matched records from the right table.For the rows for which there is no matching row on the right side, the result-set will contain null. LEFT JOIN is also known as LEFT OUTER JOIN.
- RIGHT (OUTER) JOIN: Returns all records from the right table and matched rows from the left table. Similarly, any unmatched rows from the left table will contain null
- FULL (OUTER) JOIN: Return all records from both the table. FULL JOIN creates the result-set by combining results of both LEFT JOIN and RIGHT JOIN. The result-set will contain all the rows from both tables. For the rows for which there is no matching, the result-set will contain NULL values.

### AGGREGATE FUNCIONS
The word aggregate means: a **whole** formed or calculated by combining several seperate components; total.

Aggregate functions perform calculations on a set of values and return a single value. 

**Except for COUNT(*)** aggregate functions ignore NULL values.

#### Whats the difference between having and where clause?
Where clause can be used to reduce the rows as soon as possible. Using it you can filter out the rows that you dont need to form groups and perform aggregate functions on. Having is like where clause but applies only to groups as a whole whereas, where clause applies to individual rows.

Where and Having can both be used at the same time for query efficiency.

- The `WHERE` clause is applied first to the individual rows in the tables or table-valued objects. Only the rows that meet the conditions in the `WHERE` clause are grouped.
- The `HAVING` clause is then applied to the rows in the result set. Only the groups that meet the `HAVING` conditions appear in the query output. You can apply a `HAVING` clause only to columns that also appear in the `GROUP BY` clause or in an aggregate function.

Example:

```sql
SELECT titles.pub_id, AVG(titles.price)
FROM titles INNER JOIN publishers
   ON titles.pub_id = publishers.pub_id
WHERE publishers.state = 'CA'
GROUP BY titles.pub_id
HAVING AVG(price) > 10;

```
### WINDOW FUNCTIONS
