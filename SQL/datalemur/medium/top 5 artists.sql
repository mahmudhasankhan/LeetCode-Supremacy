with song_rank as (SELECT 
a.artist_name, s.name as song_name, gs.rank
FROM artists a
JOIN songs s
on a.artist_id = s.artist_id
join global_song_rank gs
on s.song_id = gs.song_id
WHERE gs.rank <= 10)

, rankings as (SELECT 
      artist_name, 
      count(rank) frequency 
  FROM song_rank 
GROUP BY artist_name)

SELECT artist_name, artist_rank  
FROM (SELECT artist_name,
dense_rank() OVER(ORDER BY frequency desc) as artist_rank
FROM rankings) a
WHERE artist_rank <= 5
