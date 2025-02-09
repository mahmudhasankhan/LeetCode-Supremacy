WITH call_info as (SELECT 
  ph.caller_id, 
  pi.country_id as caller_country,
  pi.network as caller_network, 
  ph.receiver_id, 
  pi2.country_id as receiver_country,
  pi2.network as receiver_network,
  ph.call_time
FROM phone_calls ph
JOIN phone_info pi
on ph.caller_id = pi.caller_id
JOIN phone_info pi2
on ph.receiver_id = pi2.caller_id)

SELECT 
  round((sum(case when caller_country <> receiver_country then 1 else 0 end) / count(*)::decimal)*100,1) as international_calls_pct
FROM call_info;
