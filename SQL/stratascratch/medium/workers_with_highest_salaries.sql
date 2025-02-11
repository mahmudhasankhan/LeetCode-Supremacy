select worker_title
from (select w.*, t.worker_title,
dense_rank() over(order by salary desc) as rnk
from worker w
join title t on w.worker_id = t.worker_ref_id) a
where rnk = 1;
