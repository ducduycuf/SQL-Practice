--- 18. Which countries have never won gold medal but have won silver/bronze medals?
-- Can't use (medal <> 'Gold') because it may returns the country that has won both gold and silver or bronze
with cte as
	(
	select distinct region, medal
	from athlete at
	join nocregions nc on nc.noc = at.noc
	where at.medal in ('Silver', 'Bronze') 
	and region not in 
		(
		select distinct region
		from athlete at_gold
		join nocregions nc_gold on nc_gold.noc = at_gold.noc
		where at_gold.medal = 'Gold'
	)
)

select 
	region,
	count(case when medal = 'Gold' then medal else null end) as gold,
	count(case when medal = 'Silver' then medal else null end) as silver,
	count(case when medal = 'Bronze' then medal else null end) as bronze
from athlete at
join nocregions nc on nc.noc = at.noc
where region in 
	(
	select distinct region
	from cte
)
group by region
order by silver desc, bronze desc