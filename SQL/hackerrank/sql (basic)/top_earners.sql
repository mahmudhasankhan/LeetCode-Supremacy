select top 1 e.earnings, count(e.earnings) as count
from (select *, (salary * months) as earnings 
from employee ) e
group by e.earnings
order by e.earnings desc

-- it was a good problem, timer doesnt work tho
