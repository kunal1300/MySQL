create database assignment_netflix;
use assignment_netflix;

select count(*) from netflix;

select type,count(type)as Count from netflix group by type;

select director,count(*)as count from netflix group by director order by count desc;


select * from netflix ;

SELECT type, min(release_year) AS release_year
FROM netflix
GROUP BY type;

select country,count(country)as content  from netflix group by country order by content desc;

SELECT title, duration FROM netflix WHERE type = 'Movie' ORDER BY CAST(REPLACE(duration, ' min', '') AS UNSIGNED) DESC LIMIT 1;