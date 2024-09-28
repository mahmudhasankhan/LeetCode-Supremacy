SELECT 
  e.user_id
FROM emails e
join texts t 
on e.email_id = t.email_id
where t.signup_action = 'Confirmed'
and EXTRACT(day from t.action_date - e.signup_date) = 1
