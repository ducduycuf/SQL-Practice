--15. List down total gold, silver and bronze medals won by each country corresponding to each olympic games.
select
	games,
    nc.region,
	count(case when at.medal = 'Gold' then medal else null end) as gold_medals,
    count(case when at.medal = 'Silver' then medal else null end) as silver_medals,
    count(case when at.medal = 'Bronze' then medal else null end) as bronze_medals
from
    athlete at
join
    nocregions nc on nc.noc = at.noc
where
    at.medal <> 'NA'
group by
	games, nc.region
order by
	games