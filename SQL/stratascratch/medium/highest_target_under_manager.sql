/*
Salesforce Medium Problem

Highest Target Under Manager

Identify the employee(s) working under manager manager_id=13 who have achieved the highest target. Return each such employee’s first name alongside the target value. The goal is to display the maximum target among all employees under manager_id=13 and show which employee(s) reached that top value.

Table: salesforce_employees
*/

-- solution

select first_name, target from salesforce_employees
where manager_id=13 and target = (
select max(target)
from salesforce_employees
where manager_id=13
);
