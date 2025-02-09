SELECT
  card_name,
  issued_amount
FROM (SELECT 
  date(issue_year::varchar || '-' || issue_month || '-' || '01') as issue_date,
  card_name,
  issued_amount,
  rank() over(partition by card_name order by date(issue_year::varchar || '-' || issue_month || '-' || '01')) as rnk
FROM monthly_cards_issued) a
WHERE rnk = 1
ORDER BY issued_amount desc;

--easy peasy
