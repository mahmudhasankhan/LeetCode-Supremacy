
with highest_open_by_month as
(SELECT 
ticker,
to_char(date, 'Mon-YYYY') as month_year,
max(open) over(partition by ticker, to_char(date, 'Mon-YYYY') order by open) as highest_open_by_mnth
FROM stock_prices)

,
highest_mnth as (select ticker, month_year, highest_open_by_mnth,
row_number() over( partition by ticker order by highest_open_by_mnth desc) as rnk
from highest_open_by_month)

-- select * from highest_mnth where rnk = 1;


, lowest_open_by_month as 
(
SELECT 
ticker,
to_char(date, 'Mon-YYYY') as month_year,
min(open) over(partition by ticker, to_char(date, 'Mon-YYYY') order by open) as lowest_open_by_mnth
FROM stock_prices
)
,
lowest_mnth as 
(
  select ticker, month_year, lowest_open_by_mnth,
row_number() over( partition by ticker order by lowest_open_by_mnth) as rnk
from lowest_open_by_month
)

-- select * from lowest_mnth where rnk = 1


select h.ticker, h.month_year, h.highest_open_by_mnth, l.month_year, l.lowest_open_by_mnth
from highest_mnth h 
inner join lowest_mnth l on h.ticker = l.ticker
where l.rnk = 1 and h.rnk = 1
order by h.ticker

-- took way long to solve this even tho its a easy problem. I am really slow
