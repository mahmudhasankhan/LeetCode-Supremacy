SELECT 
co.company_code, 
co.founder, 
count(distinct lm.lead_manager_code), 
count(distinct sm.senior_manager_code),
count(distinct m.manager_code),
count(distinct em.employee_code)
from company as co
JOIN lead_manager as lm
ON co.company_code = lm.company_code
JOIN senior_manager as sm
ON lm.lead_manager_code = sm.lead_manager_code
JOIN manager as m
ON m.senior_manager_code = sm.senior_manager_code
JOIN employee as em 
ON em.manager_code = m.manager_code
group by co.company_code, co.founder
order by co.company_code
