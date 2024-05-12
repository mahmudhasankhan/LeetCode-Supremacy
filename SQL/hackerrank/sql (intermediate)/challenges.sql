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

SELECT 
    hacker_id,
    name,
    challenges_created
(SELECT
h.hacker_id, h.name, count(c.challenge_id) as challenges_created
FROM
    Hackers h
JOIN 
    Challenges c
ON 
    h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY count(c.challenge_id) desc, hacker_id
) d
GROUP BY hacker_id, name 
HAVING count(challenges_created) > 2
