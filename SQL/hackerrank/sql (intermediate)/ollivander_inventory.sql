SELECT id, age, coins_needed, power
FROM (
SELECT 
    w.id,
    wp.age,
    w.coins_needed,
    w.power,
    ranking = DENSE_RANK() OVER(
        PARTITION BY w.power, wp.age ORDER BY w.coins_needed)
FROM 
Wands w 
JOIN Wands_Property wp
ON w.code = wp.code
WHERE wp.is_evil <> 1
) AS d
WHERE ranking = 1
ORDER BY  power DESC, age DESC

-- Good problem, resembles real life problems
