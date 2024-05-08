select h.hacker_id, h.name
from submissions s
join challenges c
on s.challenge_id = c.challenge_id
join difficulty d
on c.difficulty_level = d.difficulty_level
join hackers h 
on s.hacker_id = h.hacker_id
where d.score = s.score
group by h.hacker_id, h.name
having count(s.challenge_id) > 1
order by count(s.challenge_id) desc, h.hacker_id

-- this was a very good challenge, i failed to read the question carefully
