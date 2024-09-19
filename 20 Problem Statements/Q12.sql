-- 12) Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
--- same as previous
with total_medal as
	(
	select 
		name,
		team,
		count(medal) as max_medals
	from athlete
	where medal in ('Gold', 'Silver', 'Bronze')
	group by name, team
),
ranking as
	(
	select *, dense_rank() over(order by max_medals desc) as rnk
	from total_medal
)

select 
	name, 
	team, 
	max_medals
from ranking
where rnk <= 5