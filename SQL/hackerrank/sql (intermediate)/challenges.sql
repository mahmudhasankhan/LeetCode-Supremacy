/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
DECLARE @max_val = (
SELECT
TOP 1 count(c.challenge_id) 
FROM
    Hackers h
JOIN 
    Challenges c
ON 
    h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY count(c.challenge_id) desc
)

WITH temp as (SELECT
h.hacker_id, h.name, count(c.challenge_id) as challenges_created
FROM
    Hackers h
JOIN 
    Challenges c
ON 
    h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY count(c.challenge_id) desc, hacker_id );


DELETE FROM TEMP
hacker_id,
name,
challenges_created
from temp
group by hacker_id, name
having count(challenges_created) > 2
and count(challenges_created) < @max_val



SELECT * FROM
temp
order by challenges_created desc, hacker_id
