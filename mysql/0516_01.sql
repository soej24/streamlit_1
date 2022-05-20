use yh_db;

select * from books;

-- 데이터 불러올때 아예 디비까지 지정해주는 방법도 있다.
select *
from yh_db.books;

insert into books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
values
('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake book', 'Freida', 'Harris', 2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 111, 388);

select * from books;

-- distinct (함수는 아닌데 판다스에서 유니크와 똑같은 기능)
-- author_lname 의 이름을 중복없이 가져오세요.

select author_fname
from books;

-- 중복을 제거할대 사용
select distinct author_fname
from books;

-- 작가의 full name을 중복없이 가져오세요.
select distinct( concat( author_fname, ' ', author_lname ) )
from books;

-- 데이터 정렬 order by (오름차순 정렬! 오른쪽에는 정렬할 컬럼, sql문 맨 마지막에 쓴다)
-- 책 제목으로 정렬하세요.

-- 오름차순
select *
from books order by title;

-- 오름차순(디폴트라 생략 가능)
select *
from books order by title asc;

-- 내림차순 정렬은 desc이고,
-- 오름차순정렬은 디폴트 이므로, 아무것도 안쓰거나, asc라고 써주면 된다.alter

select *
from books order by title desc;

-- 년도 내림차순으로 정렬하여 년도와 책제목을 가져오시오.

select released_year, title
from books order by released_year desc;

-- author_lname 으로 정렬을 하고, 이 author_lname 이 같으면
-- author_fname 으로 정렬하세요.

select *
from books
order by author_lname, author_fname;  -- 먼저 첫번째로 정렬하고, 정렬한게 같으면 두번째꺼로 정렬한다.alter

select *
from books
order by author_lname, author_fname desc; -- 하나는 오름차순, 뒤에꺼는 내림차순으로 정렬

-- full name 을 내림차순으로 정렬하고, 책 페이지가 많은것부터 가져오세요.

select *, concat(author_fname, ' ', author_lname) as full_name
from books order by full_name desc, pages desc;

-- order by 에 숫자를 쓸수도 있다. (숫자는 컬럼, MySQL은 1부터 시작)
select *, concat(author_fname, ' ', author_lname) as full_name
from books order by 8 desc, pages desc;

-- limit 와 offset (offset는 컴퓨터가 매기는 숫자)
-- 몇개씩 끊어서 가져오시오!!

-- 책테이블의 데이터를 3개만 가져오시오.

select *
from books limit 3;  -- 맨 위에서부터 가져온다.

-- 최신책을 기준으로 3개만 가져오시오.

select *
from books
order by released_year desc
limit 3;

select *
from books
order by released_year desc
limit 0, 3; -- (앞에꺼는 가져오고 싶은 갯수, 두번째는 시작점)

-- 리미트 옆에 하나만 쓰면 갯수가져오기
-- 리미트에 컴마로 두개가 있다면 (위치 ~ 부터, 몇개까지 갯수)
-- 페이지 숫자 링크와 관련있음 (paging, 페이징)

select *
from books
order by released_year desc
limit 3; -- (0 은 생략 가능, 위에 코딩과 같은 결과)

select *
from books
order by released_year desc
limit 6, 3;

-- 최신책을 기준으로 10번째 책부터 끝까지 가져오시오.

select *
from books
order by released_year desc
limit 9, 19191919119;  -- 데이터 갯수세기를 배우기 전까지는 엄청큰 숫자를 써준다.

-- 문자열 포함 ( Search ) : like 키워드
-- 내가 찾고자 하는 문자열이, 컬럼에 포함되 있는지 확인하는 방법

-- 책 제목에 the 라고 들어있는(%) 책만 가져오시오.alter
select *
from books
where title like '%The%';

-- the로 시작하는 책만 가져오시오.
select *
from books
where title like 'The%';

-- the로 끝나는 책만 가져오시오.
select *
from books
where title like '%The';

-- author_fname 에 da 라고 들어있는 작가의
-- 책 제목, author_fnmae, 페이지수를 가져오시오.

select title, author_fname, pages
from books
where author_fname like '%da%';

-- 언더스코어 ( _ ) 기호를 이용한 쿼리문
-- 언더스코어 갯수만큼 숫자가 2자리수인지, 3자리수인지 자리수를 나타낸다.

select *
from books
where stock_quantity like '___';  -- 언더스코어 3개는 3자리 숫자를 가져온다.

select *
from books
where stock_quantity like '__';  -- 언더스코어 2개는 2자리 숫자를 가져온다.

-- (032)305-8216 like '(___)___-___'; 이런 문법은 없음, 예를 들려고 써놓은 것임

-- 책 제목에 퍼센트 기호가 있는 책을 가져오시오.

select *
from books
where title like '%\%%';

-- books 테이블의 데이터 갯수(책의 갯수)는?
-- count 함수 이용

select count(*)
from books;
-- 결과 19개

-- author_fname 의 갯수는?
-- 먼저 중복을 제거하고 그다음 한다.
select count( distinct author_fname )
from books;
-- 결과 12개

-- 책 제목에 the 라고 들어있는 책은 몇개인가요?
select count(*)
from books
where title like '%the%';

-- author_lname 별로, 몇권의 책을 썻는지
-- author_lname 과 cnt 라는 컬럼으로 데이터를 가져오시오.
-- 판다스에서는 values_count, 또는 groupby로 할수 있는데~
-- MySQL 에서는~ group by 로 묶어준다.
select author_fname, count(*) as cnt
from books
group by author_lname;

-- full_name 별로, 각 몇권의 책을 썼는지
-- full_name 과 책의 갯수 cnt 라는 컬럼으로 가져오시오.
select count(*) as cnt, concat(author_fname, ' ', author_lname) as full_name
from books
group by full_name;

-- group by 는, 컬럼 1개, 2개, 3개 ... 상관없이 여러개 가능
select author_fname, author_lname, count( * ) as cnt
from books
group by author_fname, author_lname;

-- 최소값 min() 함수
select min( released_year )
from books;

-- 최대값 max() 함수
select max( pages )
from books;

-- 페이지수가 가장 큰 책의 제목은??
select title
from books
order by pages desc
limit 1;

-- 평균값 avg() 함수 (판다스의 mean() 함수와 같은 기능)
-- 이 테이블의 책 페이지수 평균은?
select avg( pages )
from books;

-- 각 작가별로 자신이 쓴 책의 최소 년도는??
-- 작가의 성과 이름, 그리고 최소년도가 나오도록 가져오세요.
select min( released_year ), author_fname, author_lname
from books
group by author_fname, author_lname;

-- 각 작가별로, 자신이 쓴 책의 페이지가 가장 많은 책의 페이지수를
-- 작가의 성과 이름, 그리고 최대 페이지수로 나오도록 가져오세요.
select max( pages ), author_fname, author_lname
from books
group by author_fname, author_lname;

-- 이 테이블의 페이지수 총 합은??
select sum( pages )
from books;

-- 각 작가별로 책 재고량은??
-- 재고량과 작가 이름이 나오도록 데이터를 가져오시오.
select sum( stock_quantity ), author_fname, author_lname
from books
group by author_fname, author_lname;

-- 년도별로 평균 재고량은?
-- 평균재고량과 해당년도가 나오도록 데이터를 가져오시오.
select avg( stock_quantity ), released_year
from books
group by released_year;

select released_year as year, count(*) as '# books', avg( pages ) as 'avg pages'
from books
group by released_year
order by year;

-- 시간을 처리하는 방법 (파이썬에서는 date, time, datetime 이 있다)
-- MySQL 에서는 date YYY-MM-DD / time HH:MM:SS / datetime YYY-MM-DD HH:MM:SS

select * from people2;

insert into people2
(name, birthdate, birthtime, birthdt)
values
('Padma', '1998-11-11', '10:07:35', '1988-11-11 10:07:35'),
('Larry', '1994-04-22', '04:10:42', '1994-04-22 04:10:42');


select *
from people2;

-- 현재 시간과 관련된 함수 3개, curdate(), curtime(), now()
select curdate(); -- 현재날짜
select curtime();  -- 현재시간
select now(); -- 현재날짜시간

insert into people2
(name, birthdate, birthtime, birthdt)
values
('Herry', curdate(), curtime(), now() );

select *
from people2;

select name, birthdate
from people2;

-- 년도 데이터만 가져오고 싶을때
-- year() 라는 함수이용

select name, year( birthdate )
from people2;

-- 월 데이터만 가져오고 싶을때
-- month() 함수 이용
select name, month( birthdate )
from people2;

-- 요일만 가져오고 싶을때 숫자로 알려줌
-- dayofweek() 함수 (1=sunday, 2=monday, 3=Tuesday, 4=Wednesday, 5=Thursday, 6=)
select name, dayofweek( birthdate )
from people2;

-- 요일만 가져오고 싶을때
-- dayname() 함수
select name, dayname( birthdate )
from people2;

-- 시간만 가져올때
select name, hour( birthtime )
from people2;

-- 분만 가져올때
select name, minute( birthtime )
from people2;

-- 초만 가져올때
select name, second( birthtime )
from people2;

-- 2000-11-11 13:50 에 태어났습니다.
select date_format( birthdt, '%Y-%m-%d %H:%i 에 태어났습니다.')
from people2;

-- birthdate 컬럼과 현재시간의 차이를 가져오시오. (diff는 차이~, now()를 먼저 쓴 이유는 현재시간이 항상 크기 때문에)
select datediff( now(), birthdate )
from people2;

-- birthdate 에 36일 후는??
select date_add(birthdate, interval 36 day)
from people2;

-- birthdate 에 28주 후는?
select date_add(birthdate, interval 28 week)
from people2;

select birthdate + interval 28 week
from people2;

select birthdate - interval 28 week
from people2;

select birthdt + interval 16 hour
from people2;

-- 2년 3개월 후 5시간 전은?
select birthdt + interval 2 year + interval 3 month - interval 5 hour
from people2;

-- date, time, datetime 테이터 타입에 대해서 배웠다.

-- 숫자로 보여주는 거는??
-- timestamp 데이터타입 -> 날짜를 숫자로 표현, 1970년 1월 1일 자정을 0으로 시작
-- 지금까지 흘러운 초

create table comments (
id int unsigned not null auto_increment primary key,
content varchar(100),
created_at timestamp default now() -- 건들지 않는다.
);

-- 리뷰 작성할때 자동으로 시간을 저장하고 싶을때, created_at timestamp default now() 만들어 놓는다.
-- 댓글을 쓸때 수정한 시간을 저장하고 싶을때 update_at timestamp default now() 만들어 놓는다.

insert into comments
(content)
values
('이 사과 정말 맛있습니다.');

select * from comments;

insert into comments
(content)
values
('진짜???');

select * from comments;

-- now() on~~~~~ 못적었음.
-- currnet_timestamp
-- currnet_timestamp on update current_timestamp

insert into comments
(content)
values
('사과 진짜 맛있나요????');

select * from comments;

update comments
set content = '맛없을거 같은데...'
where id = 4;

select * from comments;

-- 오늘 가장 중요한 부분 (다양한 조건의 데이터를 가져올때)
-- ~ 인것 가져오기

-- 년도가 2017인 데이터를 가져오시오.
select *
from books
where released_year = 2017;

-- 년도가 2017년이 아닌 데이터만 가져오시오.
select *
from books
where released_year != 2017;

-- author_lname 이 Harris 가 아닌 데이터만 가져오시오.
select *
from books
where author_lname != 'Harris';

-- 책 제목이 w 로 시작하는 책을 가져오시오.
select *
from books
where title like 'w%';

-- 책 제목이 w 로 시작하지 않는 책을 가져오시오. (이때는 not 을 붙여준다)
select *
from books
where title not like 'w%';

-- 년도가 2000년보다 큰 데이터만 가져오세요.
select *
from books
where released_year > 2000;

-- 년도가 2000년보다 큰 데이터만 가져오되 최신순으로 가져오세요.
select *
from books
where released_year > 2000
order by released_year desc;

-- author_lname 이름이 'Eggers' 이고, 년도는 2000년 이후인 데이터를 가져오세요.
-- ~ 이고 and
select *
from books
where author_lname = 'Eggers' and released_year > 2000;

-- author_lname 이름이 'Eggers' 이고, 년도는 2000년 이후이며
-- 제목에 novel 이라고 들어간 데어터를 가져오세요.

select *
from books
where author_lname = 'Eggers' and
	  released_year > 2000 and
      title like '%novel%';
      
-- author_lname 이 'Eggers' 이거나 출간년도가 2010년보다 큰 책을 가져오시오.
-- ~ 이거나 or
select *
from books
where author_lname = 'Eggers' or
	  released_year > 2010;
      
-- 무엇과 무엇 사이의 데이터를 가져올때!!! (포함)
-- 년도가 2004년부터 2015년 사이의 책 데이터를 가져오시오.
select *
from books
where released_year >= 2004 and
      released_year <= 2015;
      
-- ~와 ~ 사이 between A and B 사용할수도 있다. (위와 같은 결과)
select *
from books
where released_year between 2004 and 2015;

-- author_lname 이 'Carver' 이거나 'Lahiri' 이거나 'Smith' 인 데이터만 가져오시오.
select *
from books
where author_lname = 'Carver' or
      author_lname = 'Lahiri' or
      author_lname = 'Smith';

-- ~ 이거나 ~ 이거나 ~ 이거나 in( , , ) 이렇게 쓸수 있다. 위와 같은 결과
select *
from books
where author_lname in ('Carver', 'Lahiri', 'Smith');

-- 년도가 2000년 이후에 나온 책들은 Modern 이라고 하고,
-- 그렇지 않은 책들은 Old 라고 새로운 컬럼을 만들어 가져오세요.
select * ,
   case 
      when released_year >= 2000 then 'Modern'
      else 'Old'
   end as Genre
from books;

-- stock_quantity 가 0~50 사이면, * (별포1개)
-- stock_quantity 가 51~100 사이면, ** (별포2개)
-- stock_quantity 가 그 외에는 *** (별포3개)
select *,
   case
     when stock_quantity between 0 and 50 then '*'
     when stock_quantity between 51 and 100 then '**'
     else '***'
   end as star
from books;


-- if(함수) !!!!
-- pages 가 300보다 크면 long, 그렇지 않으면 short

select *, if( pages >= 300, 'long', 'short')
from books;

select * from people;
insert into people
(first_name)
values
('Mike');

-- ifnull() 함수, 컬럼에 NULL 값을 다른 값으로 변경할때
select *, ifnull( age, 100)
from people;

select * from books;

-- 1980년 이전에 발행된 책
select *
from books
where released_year < 1980;

-- Eggers, Chabon이 쓴 책
select *
from books
where author_lname like '%Eggers%' or '%Chabon%';

-- 위에랑 같은 결과(이렇게 해도 된다)
select *
from books
where author_lname in ('Eggers', 'Chabon');

-- Lahiri가 썼고, 2000년 이후 발간된 책
select *
from books
where author_lname = 'Lahiri' and released_year > 2000;

-- 페이지수가 100부터 200까지인 책
select *
from books
where pages between 100 and 200;

-- lname이 C나 S로 시작하는 작가가 쓴 책
select *
from books
where author_lname like '%C%' or '%S%';

-- 위와 같은 결과 (이렇게 할수도 있다)
select *
from books
where substr(author_lname, 1, 1) = 'C' or -- 첫번째에서 1개만 가져와 C랑 같은지
	  substr(author_lname, 1, 1) = 'S'; -- 또는 S와 같은지

-- 책 제목에 'stories'가 있으면 Type을 Short Stories
-- 'Just kind' 그리고 'Hearbreaking Work가 있으면 Memoir
-- Everything Else이 있으면 Novel

select *
from books;

select title, author_lname,
   case
     when title like '%stroies%' then 'Short Stories'
     when title = 'Just kide' or title = 'Hearbreaking Work' then 'Memoir'
     else 'Novel'
   end as TYPE
from books;

-- author_fname과 author_lname 별 묶어서 책이 몇권인지, 책의 갯수는 하나냐 그렇지 않으냐
select  title, author_lname, if( count(*) = 1 , concat(count(*),' book') , concat(count(*), ' books')) as COUNT
from books
group by author_lname, author_fname
order by author_lname;