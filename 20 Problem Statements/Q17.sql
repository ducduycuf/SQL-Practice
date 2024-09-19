-- 17. Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
--- the same with the previous queries, including total_medal
with count_medals as
	(
	select 
		games,
		region, 
		count(case when medal = 'Gold' then medal else null end) as count_golds,
		count(case when medal = 'Silver' then medal else null end) as count_silvers,
		count(case when medal = 'Bronze' then medal else null end) as count_bronzes,
		count(case when medal in ('Gold', 'Silver', 'Bronze') then medal else null end) as count_total_medals
	from athlete at
	join nocregions nc on nc.noc = at.noc
	where medal <> 'NA'
	group by games, region
),
ranked_medals as
	(
	select
		games, 
		region,
		count_golds,
		count_silvers,
		count_bronzes,
		count_total_medals,
		rank() over(partition by games order by count_golds desc) as gold_rnk,
		rank() over(partition by games order by count_silvers desc) as silver_rnk,
		rank() over(partition by games order by count_bronzes desc) as bronze_rnk,
		rank() over(partition by games order by count_total_medals desc) as total_medal_rnk
	from count_medals
)

select 
	gold.games,
	concat(gold.region, ' - ', gold.count_golds) as max_gold,
	concat(gold.region, ' - ', silver.count_silvers) as max_silver,
	concat(gold.region, ' - ', bronze.count_bronzes) as max_bronze,
	concat(gold.region, ' - ', total.count_total_medals) as max_total_medals
from ranked_medals gold
left join ranked_medals silver on silver.games = gold.games and silver.silver_rnk = 1
left join ranked_medals bronze on bronze.games = silver.games and bronze.bronze_rnk = 1
left join ranked_medals total on total.games = bronze.games and total.total_medal_rnk = 1
where gold.gold_rnk = 1
order by games