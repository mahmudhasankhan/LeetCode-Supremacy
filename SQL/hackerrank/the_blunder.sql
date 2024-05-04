SELECT CAST(CEILING(AVG(CAST(Salary AS FLOAT)) - AVG(CAST(REPLACE(Salary,'0','') AS FLOAT))) AS INT) 
FROM EMPLOYEES

-- ceiling returns the next integer.
