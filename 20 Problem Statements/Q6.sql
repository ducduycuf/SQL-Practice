-- 6) Identify the sport which was played in all summer olympics.
--- same as the previous
with total_games as
	(
	select 
		count(distinct games) as total_games, 
		Season, 
		Sport
	from athlete
	where Season = 'summer'
	group by Sport, Season
),
max_games as
	(
	select 
		max(total_games) as max_played_games
	from total_games
)

select 
	sport, 
	season, 
	max_played_games
from total_games tg
join max_games mg on mg.max_played_games = tg.total_games