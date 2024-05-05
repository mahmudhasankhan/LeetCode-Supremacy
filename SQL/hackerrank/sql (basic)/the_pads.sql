
SELECT name+'('+left(occupation, 1)+')'
FROM occupations
ORDER BY name+'('+left(occupation, 1)+')'

SELECT 'There are a total of'+' '+CAST(COUNT(occupation) AS VARCHAR)+' '+lower(occupation)+'s.'
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation) 
