
SELECT manufacturer, drug_count, total_loss * (-1)
FROM
(SELECT manufacturer, count(drug) as drug_count, sum(total_sales - cogs) as total_loss
FROM pharmacy_sales
where total_sales - cogs < 0
GROUP BY manufacturer) a
ORDER BY total_loss * (-1) desc
