-- 1) How many olympics games have been held?
select
	count(distinct games) as total_games 
from athlete


-- 2) List down all Olympics games held so far.
select	 
	distinct year, 
	Season, 
	City 
from athlete
order by Year


-- 3) Mention the total no of nations who participated in each olympics game?
select	 
	games, 
	count(distinct team) as total_countries 
from athlete
group by Games
order by total_countries desc