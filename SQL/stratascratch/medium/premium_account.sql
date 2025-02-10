SELECT
    a.entry_date,
    COUNT(a.account_id) as premium_paid_accounts,
    COUNT(b.account_id) as premium_paid_accounts_after_7d
FROM premium_accounts_by_day as a
LEFT JOIN premium_accounts_by_day b ON a.account_id = b.account_id
AND (b.entry_date - a.entry_date) = 7 and b.final_price > 0
WHERE a.final_price > 0
GROUP BY a.entry_date
ORDER BY a.entry_date
LIMIT 7

-- tough problem to solve
