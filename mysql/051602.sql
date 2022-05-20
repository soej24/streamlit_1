use yh_db;

-- 제목에 stories 가 포함된 데이터를, 제목만 조회
select title
from books
where title like '%stories%';

-- 페이지수가 가장 긴 책을 찾아서, 제목과 페이지수를 조회하시오.
select title, pages
from books order by pages desc
limit 1;

-- 최근에 발간된 책 3권을 찾아서, 책의 제목과 발간년도를 조회하되,
-- 다음처럼 하이픈(-)을 붙여서 조회하시오. (컬럼명: summary)
select concat(title, ' - ', 'released_year') as summary
from books order by released_year desc
limit 3;

-- author_lname 에 공백 (" ") 이 들어있는 사람의,
-- 책 제목과 author_lname을 조회
select title, author_lname
from books
where author_lname like '% %';

-- 가장 stock_quantity 가 적은 책 3권의 title, year, stock_quantity를 조회하시오.
select title, released_year, stock_quantity
from books
order by stock_quantity
limit 3;

-- author_lname 과 title 로 정렬한 후
-- title 과 author_lname을 조회하시오.
select title, author_lname
from books
order by author_lname, title;

-- author_lname 으로 정렬하되, 
-- "My favorite author is"를 붙여서 조회하시오. (대문자로)
select upper( concat("My favorite author is", ' ', author_fname, ' ', author_lname) ) as yell
from books
order by author_lname;