use yh_db;

-- 3개의 테이블 합쳐서 조회하기
-- INSERTING A BUNCH OF DATA
INSERT INTO series (title, released_year, genre) VALUES
   ('Archer', 2009, 'Animation'),
   ('Arrested Development', 2003, 'Comedy'),
   ("Bob's Burgers", 2011, 'Animation'),
   ('Bojack Horseman', 2014, 'Animation'),
   ("Breaking Bad", 2008, 'Drama'),
   ('Curb Your Enthusiasm', 2000, 'Comedy'),
   ("Fargo", 2014, 'Drama'),
   ('Freaks and Geeks', 1999, 'Comedy'),
   ('General Hospital', 1963, 'Drama'),
   ('Halt and Catch Fire', 2014, 'Drama'),
   ('Malcolm In The Middle', 2000, 'Comedy'),
   ('Pushing Daisies', 2007, 'Comedy'),
   ('Seinfeld', 1989, 'Comedy'),
   ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
   ('Thomas', 'Stoneman'),
   ('Wyatt', 'Skaggs'),
   ('Kimbra', 'Masters'),
   ('Domingo', 'Cortes'),
   ('Colt', 'Steele'),
   ('Pinkie', 'Petit'),
   ('Marlon', 'Crafford');
  
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
   (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
   (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
   (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
   (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
   (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
   (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
   (7,2,9.1),(7,5,9.7),
   (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
   (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
   (10,5,9.9),
   (13,3,8.0),(13,4,7.2),
   (14,2,8.5),(14,3,8.9),(14,4,8.9);
   
select * from reviewers;
select * from series;
select * from reviews;

-- title, rating
select s.title, r.rating
from series s
join reviews r
  on s.id = r.series_id;
  
-- title, avg_rating
select s.title, avg(r.rating) as avg_rating
from series s
join reviews r
  on s.id = r.series_id
group by s.title;

-- first_name, last_name, rating

select rv.first_name, rv.last_name, r.rating
from reviewers rv
join reviews r
  on rv.id = r.reviewer_id;

-- unreviewed_series (시리즈에 있는 것들은 전부 다 가져오고 그옆에~ 붙여라)
select title as unreviewed_series
from series s
left join reviews r
  on s.id = r.series_id
where r.rating is null;

-- genre, avg_rating
select genre, avg(r.rating) as avg_rating
from series s
join reviews r
  on s.id = r.series_id
group by genre;

-- first_name, last_name, OUNT, MIN, MAX, AVG, STATUS
-- id로 그룹바이
select rv.first_name, rv.last_name, count(r.rating) as COUNT,
       ifnull( min(r.rating), 0.0) as MIN,
       ifnull( max(r.rating), 0.0) as MAX,
       ifnull( avg(r.rating), 0.0) as AVG,
       if( count(r.rating) = 0, 'INACTIVE', 'ACTIVE' ) as STATUS
from reviewers rv
left join reviews r
  on rv.id = r.reviewer_id
group by rv.id;

-- title, rating, raviewer 3개 테이블 조인하기
select s.title, r.rating, concat( rv.first_name, ' ', rv.last_name ) as reviewer
from series s
join reviews r
  on s.id = r.series_id
join reviewers rv
  on r.reviewer_id = rv.id
order by s.title;