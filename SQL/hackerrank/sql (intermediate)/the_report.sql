select name, cast(NULL as int) as Grade, Marks
into #temp
from students
order by Marks desc, name asc


update #temp
set Grade = 10
where marks between 90 and 100


update #temp
set Grade = 9
where marks between 80 and 89


update #temp
set Grade = 8
where marks between 70 and 79


update #temp
set Grade = 7
where marks between 60 and 69


update #temp
set Grade = 6
where marks between 50 and 59

update #temp
set Grade = 5
where marks between 40 and 49


update #temp
set Grade = 4
where marks between 30 and 39


update #temp
set Grade = 3
where marks between 20 and 29


update #temp
set Grade = 2
where marks between 10 and 19


update #temp
set Grade = 1
where marks between 0 and 9

update #temp
set name = NULL
where Grade < 8


select * from #temp
order by grade desc, name 

drop table #temp

-- this technique granted very verbose but super fast and I have learned this from my manager
