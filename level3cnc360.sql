use ab;
select * from earning;
select * from genre;
select * from imdb;
-- Print the title and ratings of the movies released in 2012 whose metacritic rating is more than 60 and Domestic collections exceed 10 Crores. 
select 
	i.title, i.rating 
    from imdb i
    join earning e on i.Movie_id = e.Movie_id
    where i.title like '%2012%' and i.MetaCritic >60 and e.Domestic >10000000;
 -------------------------------------------------------------------------------------   
/* Print the genre and the maximum net profit among all the movies of that genre released in 2012 per genre. Note:
1. Do not print any row where either genre or the net profit is empty/null.
2. net_profit = Domestic + Worldwide - Budget
3. Keep the name of the columns as 'genre' and 'net_profit'
4. The genres should be printed in alphabetical order.*/
with ab as (select 	
	g.genre,(e.domestic + e.worldwide - i.Budget) as net_profit
from imdb i
    join earning e on i.Movie_id = e.Movie_id
    join genre g on e.Movie_id = g.Movie_id
    where i.title like '%2012%' and g.genre is not null)
select genre, max(net_profit) as net_profit
from ab
where net_profit is not null
group by genre
order by genre asc;
 -------------------------------------------------------------------------------------   
/*Print the genre and the maximum weighted rating among all the movies of that genre released in 2014 per genre. Note:
1. Do not print any row where either genre or the weighted rating is empty/null.
2.  weighted_rating = avgerge of (rating + metacritic/10.0)
3. Keep the name of the columns as 'genre' and 'weighted_rating'
4. The genres should be printed in alphabetical order.*/
select 	
	g.genre, max((i.Rating + (i.metacritic/10.0))/2) as weighted_rating
from imdb i
    join earning e on i.Movie_id = e.Movie_id
    join genre g on e.Movie_id = g.Movie_id
    where i.title like '%2014%' and g.genre is not null and i.metacritic is not null and i.rating is not null 
    group by g.genre
	order by genre asc ;
 -------------------------------------------------------------------------------------   
/*A country is big if it has an area of bigger than 3 million square km or a population of more than 25 million. Write a SQL solution to output big countries' name, population and area.*/    
select name , population,area
from world
where area>3000000 or population>25000000


















