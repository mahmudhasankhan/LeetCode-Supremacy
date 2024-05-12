/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

WITH num_challenges as (
SELECT
h.hacker_id, h.name, count(c.challenge_id) as challenges_created
FROM
    Hackers h
JOIN 
    Challenges c
ON 
    h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name )
,   
count_challenges as ( 
SELECT 
    challenges_created,
    COUNT(challenges_created) as count_cc
FROM 
    num_challenges
GROUP BY challenges_created )


SELECT 
    nc.hacker_id,
    nc.name,
    nc.challenges_created
FROM 
    num_challenges nc
JOIN 
    count_challenges cc
ON nc.challenges_created = cc.challenges_created
WHERE cc.count_cc = 1 OR nc.challenges_created = (SELECT MAX(challenges_created) FROM num_challenges)
ORDER BY nc.challenges_created DESC, nc.hacker_id

    
