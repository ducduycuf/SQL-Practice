-- 5) Which nation has participated in all of the olympic games?
--- count games then find the maximum participation --> use CTEs
with total_games as
	(
	select 
		team, 
		count(distinct games) as total_participated_games
	from athlete
	group by Team
),
max_participation as
	(
	select 
		max(total_participated_games) as max_participated_games
	from total_games
)

select 
	tg.team, 
	tg.total_participated_games
from total_games tg
join max_participation mp on mp.max_participated_games = tg.total_participated_games