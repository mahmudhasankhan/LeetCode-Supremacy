select
(sum(case when status = 'open' then 1 else 0 end)/ count(*)::decimal) as active_users_share
from fb_active_users
where country = 'USA';
