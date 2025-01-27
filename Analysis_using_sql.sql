



-- PROJECT

use project;
show tables;
select* from athlete1;


-- Show how many medal counts present for entire data.
select medal, count(Medal)  from athlete1 group by Medal ;
-- Show count of unique Sports are present in olympics.
select distinct Sport from athlete1 ;


-- Show how many different medals won by Team India in data.
select Team,medal, count(Medal) from athlete1 group by  medal,team having team="india";


-- Show event wise medals won by india show from highest to lowest medals won in order.
select team, event , medal as medal_name from  athlete1 where team="India" and medal!="nomedal"  ;

 -- Show event and yearwise medals won by india in order of year.
 
 select event,team,year from  athlete1 where team="india" and medal!="nomedal" order by year;
 
 
 -- Show the country with maximum medals won gold, silver, bronze
 select team ,medal, count(medal) as medal_cnt   from athlete1 group by medal,team having medal!="Nomedal";
 
 -- Show the top 10 countries with respect to gold medals
select team ,count(medal) as gold_cnt  from athlete1  where medal ="gold" group by medal,team  order by gold_cnt desc limit 10  ;

-- Q8. Show in which year did United States won most medals
select team , year , count(medal) as usa_medal from athlete1 where team="united states" and medal!="nomedal" group by  team, year  order by usa_medal  desc limit 1; 
 

-- Q9. In which sports United States has most medals
select sport , team , count(medal) from athlete1 where medal!="Nomedal" and team="united states" group by Sport,team order by team desc limit 1 ;

-- Q10. Find top 3 players who have won most medals along with their sports and country.

select name, sport,medal,team, count(Medal) as Medal_cnt from athlete1 where medal!="nomedal" group by name, sport,team order by medal_cnt desc limit 3
;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


-- Q11. Find player with most gold medals in cycling along with his country.
select team,name ,sport ,count(Medal) as most_med from athlete1 where medal="gold" and sport="cycling" group by team, name order by most_med desc limit 1 ;

-- Q12. Find out the count of different medals of the top basketball player.

select name,sport,team,medal,count(medal) as basketball_med from athlete1 where sport="basketball" and medal<>"nomedal" group by team,name   order by basketball_med desc ;
-- 12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country
select name,sport,team,medal, count(medal) as medalcnt from athlete1  where medal<>"Nomedal" and sport='Basketball' group by name,team,sport order by medalcnt desc;

-- Q13. Find out medals won by male, female each year . Export this data and plot graph in excel.

select sex,year,count(medal) as medal_cnt from  athlete1 where medal!="nomedal" group by sex,year order by year asc;
