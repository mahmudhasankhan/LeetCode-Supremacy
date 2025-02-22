/*
Spotify Medium Problem 

Find the top 10 ranked songs in 2010

What were the top 10 ranked songs in 2010?
Output the rank, group name, and song name but do not show the same song twice.
Sort the result based on the year_rank in ascending order.

Table: billboard_top_100_year_end

*/

-- solution:

select 
distinct year_rank, group_name, song_name 
from billboard_top_100_year_end 
where year = 2010
order by year_rank
limit 10
