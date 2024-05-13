
-- part 1
-- total score is the sum of their maximum scores for all of the challenges
-- hacker_ id
-- name
-- total score of the hackers 

-- order by desc scores


-------------------------- Solution I got from youtube ---------------------------------------

WITH Maximum_scores AS (
SELECT 
	hacker_id,
	challenge_id,
	MAX(score) as max_score
FROM Submissions
GROUP BY hacker_id, challenge_id
)

SELECT
        h.hacker_id,
        h.name,
        SUM(m.max_score) AS total_score
FROM Hackers h
JOIN Maximum_scores m 
	ON h.hacker_id = m.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(m.max_score) <> 0
ORDER BY SUM(m.max_score) DESC, h.hacker_id

-------------------------- Solution I got from youtube ---------------------------------------





-------------------------------------- My Solution --------------------------------------------

WITH rank_score 
AS (
SELECT 
	hacker_id,
	name,
	challenge_id,
	score as max_score
FROM (
    SELECT
	    h.hacker_id,
	    h.name,
	    s.challenge_id,
	    s.score,
	    score_rank = ROW_NUMBER() OVER(PARTITION BY h.hacker_id, s.challenge_id ORDER BY s.score DESC)
    FROM Hackers h 
    JOIN Submissions s
    ON h.hacker_id = s.hacker_id
    ) r
WHERE score_rank = 1
)


SELECT 
	hacker_id,
	name,
	SUM(max_score) AS total_score
FROM rank_score
GROUP BY hacker_id, name
HAVING SUM(max_score) <> 0
ORDER BY SUM(max_score) DESC, hacker_id

-------------------------------------- My Solution --------------------------------------------

-- Remarks: This was a good problem! Initially started with dense_rank and rank but later figured out that row_number was the right window function to use here
