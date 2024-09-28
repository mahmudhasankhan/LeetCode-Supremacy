SELECT m1.card_name, max(m1.issued_amount) - min(m2.issued_amount) as difference FROM 
monthly_cards_issued m1 
join monthly_cards_issued m2
on m1.card_name = m2.card_name
GROUP BY m1.card_name
ORDER BY max(m1.issued_amount) - min(m2.issued_amount) DESC
