SELECT year_month, count(unique_shipment) as count from 
(select 
	to_char(shipment_date, 'YYYY-MM') as year_month, shipment_id::varchar || '-' || sub_id::varchar as unique_shipment
from amazon_shipment) a
GROUP BY year_month
