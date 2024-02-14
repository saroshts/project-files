use project_movie_database;

-- Can you get all data about movies?
select *
from movies;

-- How do you get all data about directors?
select *
from directors;

-- Check how many movies are present in IMDB.
select distinct(count(title))
from movies
where vote_average is not null;

-- Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select *
from directors
where name in ("James Cameron", "Luc Besson", "John Woo");

-- Find all directors with name starting with Steven.
select *
from directors
where name like "Steven%";

-- Count female directors.
select distinct(count(*))
from directors
where gender = 1;

-- Find the name of the 10th first women directors?
select name
from directors
where gender = 1
order by name
limit 10;

-- What are the 3 most popular movies?
select title
from movies 
order by popularity desc
limit 3;

-- What are the 3 most bankable movies?
select title
from movies 
order by revenue desc
limit 3;

-- What is the most awarded average vote since the January 1st, 2000?
Select title, avg(vote_average) As avg_vote
From movies
Where release_date >= '2000-01-01'
group by title
order by avg_vote desc
limit 1;

-- Which movie(s) were directed by Brenda Chapman?
select d.name, m.title
from movies m
right join directors d on m.director_id = d.id
where d.name = "Brenda Chapman";

-- Whose director made the most movies?
select d.name, count(m.title) as movie_count
from movies m
right join directors d on m.director_id = d.id
group by d.name
order by movie_count desc
limit 3;

-- Whose director is the most bankable?
select d.name, sum(revenue) as Revenue
from movies m
right join directors d on m.director_id = d.id
group by d.name
order by Revenue desc
limit 3;

