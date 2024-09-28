SELECT U.city, COUNT(T.status) as total_orders FROM trades T
JOIN users U ON T.user_id = U.user_id
where T.status = 'Completed'
GROUP BY U.city
ORDER BY COUNT(T.status) DESC
limit 3;
