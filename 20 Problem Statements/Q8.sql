-- 8) Fetch the total no of sports played in each olympic games.
select 
	distinct games, 
	count(distinct sport) as total_sports
from athlete
group by Games
order by count(distinct sport) desc