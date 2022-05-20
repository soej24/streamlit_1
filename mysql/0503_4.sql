use yh_db;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;

select author_fname, author_lname
from books;

-- 작가이름을 합쳐서 full_name으로 가져오세요.
select concat( author_fname, ' ', author_lname ) as full_name
from books;


-- concat_ws 붙여줄때 공백이나 하이픈등 알아서 해준다.
select concat_ws( '-', author_fname, author_lname, pages ) as full_name
from books;

-- 문자열의 일부분만 가져오기 (파이썬의 슬라이싱과 비슷하다)
select *
from books;

-- 제목을 처음부터 10글자 까지만 가져오기
select substr( title, 1, 10 ) as title;

-- 제목의 맨 뒤에서 5번째 글자부터 끝까지 가져오세요.
select substr( title, -5 ) as title
from books;

-- 제목의 5번째 글자부터 12번째 글짜까지 가져오세요.
select substr( title, 5, 12 ) as title
from books;

-- 제목의 처음부터 10글자를 가져오되,
-- 뒤에 ... 을 붙여서 가져오세요.
select concat( substr( title, 1, 10 ), '...' ) as short_title;

-- '나쁜놈아 그렇게 살지마라'
select replace( '나쁜놈아 그렇게 살지마라', '나쁜놈', '***' );

-- 제목 컬럼에 들어있는 e를 3으로 바꿔서 가져오세요.
select * from books;

select replace( title, 'e', '3' )
from books;

-- 문자열의 순서를 거꾸로 뒤집는 함수
-- 'hello' => 'olleh'

-- author_fname을 뒤집어서 가져오세요.
select reverse( author_fname )
from books;

-- 책 제목의 길이를 구하시오.
select char_length( title ) as length
from books;

-- 책 제목 길이는 12
-- 책 제목 길이는 15
select concat('책 제콕 길이는', char_length( title ) )
from books;

-- 대문자, 소문자 바꾸기
select upper( title )
from books;

select lower( title )
from books;

-- 실습문제 풀어보기

select * from books;

-- 제목에 공백이 있는데 -> 로 바꿔라
select replace( title, ' ', '->' ) as title
from books;

-- 다음 컬럼처럼 나오게 해주세요.

select author_lname as forwards,
reverse( author_lname ) as backwords
from books;

-- 대문자로 이름 합치기
select upper( concat_ws( ' ', author_fname, author_lname ) ) as 'full name in caps'
from books;

-- 타이틀 컬럼과 연도 컬럼 합치되, was released in이 들어가도록 햡쳐서 조회
select concat( title, ' ', 'was released in', ' ', released_year ) as blurb
from books;

-- 타이틀과 타이틀에 적힌 글자 갯수 나오도록
select title, char_length( title ) as 'character count'
from books;

select * from books;

-- 숏 타이틀은 앞에서 10글자만 나오고, 뒤에 ...이 나오도록 만들고,
-- author는 이름 두개 컬럼을 합치고 quantity는 원래 숫자에 in stock이 붙도록 조회

select concat( substr( title, 1, 10 ), '...') as 'short title',
concat( author_lname, ',', author_fname) as author,
concat( stock_quantity, ' in stock') as quantity
from books;
