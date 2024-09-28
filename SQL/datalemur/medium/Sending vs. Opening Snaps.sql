
with cte as(SELECT
user_id,
activity_type,
sum(time_spent) as time_spent
FROM activities
GROUP BY user_id, activity_type)



SELECT
  ag.age_bucket,
  ROUND(c1.time_spent/(c1.time_spent+c2.time_spent) * 100.0, 2) as send_perc,
  ROUND(c2.time_spent/(c1.time_spent+c2.time_spent) * 100.0, 2) as open_perc
FROM cte c1
JOIN cte c2 ON c1.user_id = c2.user_id
JOIN age_breakdown ag on c2.user_id = ag.user_id
WHERE c1.activity_type = 'send'
AND c2.activity_type = 'open'
ORDER BY ag.age_bucket

