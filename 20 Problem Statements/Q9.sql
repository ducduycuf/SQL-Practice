-- 9) Fetch details of the oldest athletes to win a gold medal.
--- return all the details: name, sex, max_age, team, games, city, sport, event, medal
with maximum_age as
	(
	select 
		max(age) as max_age
	from athlete
	where medal = 'Gold'
)
select 
	name, sex, max_age, team, games, city, sport, event, medal
from maximum_age ma
join athlete at on at.age = ma.max_age
where medal = 'Gold'