-- 4) Which year saw the highest and lowest no of countries participating in olympics?
--- The output should be 'Olympic games'  '-' 'number of participating countries' --> use CONCAT
with tb_total_countries as
	(
	select	 
		games, 
		count(distinct team) as total_countries 
	from athlete
	group by Games
)

select 
	(
	select 
		concat(games, '-', total_countries)
	from tb_total_countries
	where total_countries = (select max(total_countries) from tb_total_countries)
) as highest_countries,
	(
	select 
		concat(games, '-', total_countries)
	from tb_total_countries
	where total_countries = (select min(total_countries) from tb_total_countries)
) as lowest_countries