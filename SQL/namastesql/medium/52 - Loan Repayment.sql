/*
You're working for a large financial institution that provides various types of loans to customers. Your task is to analyze loan repayment data to assess credit risk and improve risk management strategies.

Write an SQL to create 2 flags for each loan as per below rules. Display loan id, loan amount , due date and the 2 flags.

 

1- fully_paid_flag: 1 if the loan was fully repaid irrespective of payment date else it should be 0.
2- on_time_flag : 1 if the loan was fully repaid on or before due date else 0.
Table: loans
+-------------+-----------+
| COLUMN_NAME | DATA_TYPE |
+-------------+-----------+
| loan_id     | int       |
| customer_id | int       |
| loan_amount | int       |
| due_date    | date      |
+-------------+-----------+
Table: payments
+--------------+-----------+
| COLUMN_NAME  | DATA_TYPE |
+--------------+-----------+
| amount_paid  | int       |
| loan_id      | int       |
| payment_date | date      |
| payment_id   | int       |
+--------------+-----------+


*/


-- solution:
with cte as (select loan_id, max(payment_date) as last_paid, sum(amount_paid) total_paid
from payments
group by loan_id
)

select 
	l.loan_id,
    l.loan_amount,
    l.due_date,
    case
    	when c.total_paid = l.loan_amount then 1
        else 0
    end as fully_paid_flag,
    case
    	when (c.total_paid = l.loan_amount) and 
        (c.last_paid <= l.due_date) then 1
        else 0
     end as on_time_flag
from loans l
join cte c
on l.loan_id = c.loan_id
