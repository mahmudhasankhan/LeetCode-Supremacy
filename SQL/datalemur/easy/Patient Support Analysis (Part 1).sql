select count(*) from (SELECT policy_holder_id, count(case_id) as call_count 
FROM callers
GROUP BY policy_holder_id
HAVING  count(case_id) >= 3) a
