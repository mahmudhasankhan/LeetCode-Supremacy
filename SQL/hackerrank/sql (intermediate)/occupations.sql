
select Doctor, Professor, Singer, Actor
FROM (
		select name,
		occupation,
		row_number() over(partition by occupation order by name) as num
		from occupation
) as derive_table
Pivot
(
max(name)
for occupation in (Doctor, Professor,Singer, Actor) ) as pivottable


-- learned the pivot operator.
