--- 20. Break down all olympic games where India won medal for Hockey and how many medals in each olympic games
select 
	region, 
	sport, 
	games, 
	count(medal) as total_medals
from athlete at
join nocregions nc on nc.noc = at.noc
where region = 'India' 
and medal <> 'NA'
group by region, sport, games
order by total_medals desc