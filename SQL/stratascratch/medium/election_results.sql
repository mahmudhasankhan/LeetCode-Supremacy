/*
Deloitte, Google - medium problem

ELECTION RESULTS 

The election is conducted in a city and everyone can vote for one or more candidates, or choose not to vote at all. Each person has 1 vote so if they vote for multiple candidates, their vote gets equally split across these candidates. For example, if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 vote each.
Find out who got the most votes and won the election. Output the name of the candidate or multiple names in case of a tie. To avoid issues with a floating-point error you can round the number of votes received by a candidate to 3 decimal places.

Table: voting_results

*/

-- solution:



with vote_count_per_voter as (
select voter, count(candidate) as cnt
from voting_results
where candidate is not null
group by voter)

, voting_point_per_voter as (
select voter, round(1/cnt::decimal,3) as voting_point
from vote_count_per_voter
)

, final_result as (
Select vr.candidate, sum(vp.voting_point) as total_vote
from voting_results vr
join voting_point_per_voter as vp
on vr.voter = vp.voter
where candidate is not null
group by vr.candidate
order by total_vote desc
)

select candidate from final_result limit 1

-- one of the best problems I've solved. Demonstrates the use of used ctes here
