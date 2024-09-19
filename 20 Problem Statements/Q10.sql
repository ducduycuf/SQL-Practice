-- 10) Find the Ratio of male and female athletes participated in all olympic games.
--- use concat to return the output as ratio
with sex_count as
	(
	select 
		count(case when sex = 'M' then sex else null end) as male_count,
		count(case when sex = 'F' then sex else null end) as female_count
	from athlete
),
ratio as 
	(
	select 
		cast(male_count * 1.0 / female_count as decimal(8,2)) as sex_ratio
	from sex_count
)

select concat('1', ':', sex_ratio) as ratio
from ratio