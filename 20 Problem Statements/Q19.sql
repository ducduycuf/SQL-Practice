--- 19. In which Sport/event, India has won highest medals.
with cte as
	(
	select sport, region, count(medal) as total_medals, rank() over(order by count(medal) desc) as rnk
	from athlete at
	join nocregions nc on nc.noc = at.noc
	where region = 'India'
	group by sport, region
)

select sport, region, total_medals
from cte
where rnk = 1