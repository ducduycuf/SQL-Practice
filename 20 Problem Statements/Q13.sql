-- 13) Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
--- count medal then DENSE_RANK()
with count_medals as
	(
	select 
		region, 
		count(medal) as total_medals
	from nocregions nc
	join athlete at on at.noc = nc.noc 
	where medal <> 'NA'
	group by region
)

select 
	top 5 region, 
	total_medals, 
	dense_rank() over(order by total_medals desc) as rnk
from count_medals