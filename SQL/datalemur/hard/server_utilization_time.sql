
WITH start_cte AS 
(
SELECT
  server_id,
  session_status,
  status_time,
  RANK() OVER(PARTITION BY server_id ORDER BY status_time) AS rnk
FROM server_utilization
WHERE session_status = 'start'
)

,

stop_cte AS 
(
SELECT
  server_id,
  session_status,
  status_time,
  RANK() OVER(PARTITION BY server_id ORDER BY status_time) AS rnk
FROM server_utilization
WHERE session_status = 'stop'
)

SELECT 
  FLOOR((extract(days from sum(days))*24 + 
  extract(hours from sum(days)))/24)
AS total_uptime_days
FROM (
SELECT 
  a.server_id,
  a.status_time AS start_time,
  b.status_time AS end_time,
  (b.status_time - a.status_time)::interval AS days
FROM start_cte as a
JOIN stop_cte as b on a.server_id = b.server_id
WHERE a.rnk = b.rnk) A

-- it was a nice problem
