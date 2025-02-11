
select video_id, count(distinct name) as cnt
from (
select 
coalesce(user_firstname ||' '|| user_lastname, '')as name,
*
from user_flags
where flag_id is not null) a
group by video_id;
