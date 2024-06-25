

---------------------------------------------DML--------------------------------------------------------------------------

create table #contests(contest_id int, hacker_id int, name varchar(256))

create table #colleges(college_id int, contest_id int)

create table #challenges(challenge_id int, college_id int)

create table #view_stats(challenge_id int, total_views int, total_unique_views int)

create table #submission_stats(challenge_id int, total_submissions int, total_accepted_submissions int)



insert into #contests values(66406,17973, 'Rose'), (66556,79153, 'Angela'), (94828 ,80275, 'Frank')

insert into #colleges values(11219, 66406), (32473,66556), (56685 ,94828)

insert into #challenges 
values(18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 56685)

insert into #view_stats
values(47127 ,26, 19), 
(47127 ,15, 14),
(18765 ,43, 10),
(18765 ,72, 13),
(75516 ,35, 17),
(60292 ,11, 10),
(72974 ,41, 15),
(75516 ,75, 11)


insert into #submission_stats
values(75516 ,34, 12), 
(47127 ,27, 10),
(47127 ,56, 18),
(75516 ,74, 12),
(75516 ,83, 8),
(72974 ,68, 24),
(72974 ,82, 14),
(47127 ,28, 11);


---------------------------------------------------------END DML----------------------------------------------------------------

-----------------------------------------------------Solution------------------------------------------------------------------


WITH view_fact as (
SELECT
    c.contest_id as contest_id,
    c.hacker_id as hacker_id,
    c.name as name,
    SUM(v.total_views) as total_views,
    SUM(v.total_unique_views) as total_unique_views
FROM
    #Contests c
    JOIN #Colleges cg    ON c.contest_id = cg.contest_id
    JOIN #Challenges cn ON cg.college_id = cn.college_id
    JOIN #View_Stats v ON cn.challenge_id = v.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
)
, submission_fact as (
SELECT
    c.contest_id as contest_id,
    c.hacker_id as hacker_id,
    c.name as name,
    SUM(s.total_submissions) as total_submissions,
    SUM(s.total_accepted_submissions) as total_accepted_submissions
FROM
    #Contests c
    JOIN #Colleges cg    ON c.contest_id = cg.contest_id
    JOIN #Challenges cn ON cg.college_id = cn.college_id
    JOIN #Submission_Stats s ON cn.challenge_id = s.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
)

SELECT 
v.contest_id,
v.hacker_id,
v.name,
ISNULL(s.total_submissions,0) as total_submissions,
ISNULL(s.total_accepted_submissions,0) as total_accepted_submissions,
ISNULL(v.total_views,0) as total_views,
ISNULL(v.total_unique_views,0) as total_unique_views
from view_fact v
full join submission_fact s 
on v.contest_id = s.contest_id and v.hacker_id = s.hacker_id and v.name = s.name




------------------------------------- end solution------------------------------------------------------------


------------------drop tables ---------------------

drop table #challenges
drop table #colleges
drop table #contests
drop table #submission_stats
drop table #view_stats
