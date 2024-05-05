select n, 'Root'
from bst 
where p is null
union
select n, 'Inner'
from bst
where n in (select p from bst)
and p is not null
union
select n, 'Leaf'
from bst
where n not in (
select n
from bst
where n in (select p from bst))
order by n

-- took more than 8 minutes, but managed to solve on my own. 
-- i need to solve more in order to get better
