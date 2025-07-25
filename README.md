# CNC360-
-- Show the titles and ratings of movies released in 2012 with a Metacritic score above 60 and domestic collections over ₹10 Crores.
select 
	i.title, i.rating 
    from imdb i
    join earning e on i.Movie_id = e.Movie_id
    where i.title like '%2012%' and i.MetaCritic >60 and e.Domestic >10000000;
