-- 11) Fetch the top 5 athletes who have won the most gold medals.
--- count then DENSE_RANK() to return the top 5 amount
with max_golds as
	(
	select 
		name,
		team,
		count(medal) as max_gold
	from athlete
	where medal = 'Gold'
	group by name, team
),
ranking as
	(
	select 
		*, 
		dense_rank() over(order by max_gold desc) as rnk
	from max_golds
)

select 
	name, 
	team, 
	max_gold
from ranking
where rnk <= 5