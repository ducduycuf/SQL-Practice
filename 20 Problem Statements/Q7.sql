-- 7) Which Sports were just played only once in the olympics?
--- choose CTE for more readabilty
--- without the use of CTEs, the GROUP BY function in this situation can be a problem for choosing distinct sports
--- (as I would have to group by both Sport and Games)
with t1 as
	(
	select 
		distinct Sport, 
		count(distinct games) as total_participated_games
	from athlete
	group by sport
)

select 
	distinct t1.Sport, 
	total_participated_games, 
	games
from t1
join athlete on athlete.Sport = t1.Sport
where total_participated_games = 1