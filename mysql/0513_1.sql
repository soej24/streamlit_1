use yh_db;  -- 작업할 데이터베이스 선택하는 SQL

Show tables;  -- 지금 작업하고 있는 DB의 테이블이름을 보여주는 SQL

desc tweets;

-- 데이터를 테이블에 저장하는 방법

insert into cats (name, age) values ('Jetson', 7);

-- 저장된 데이터를 확인하는 방법alter

select * from cats;

insert into cats (name, age) values ('야옹이', 3);

select * from cats;

insert into cats values ('Blue', 6); -- 컬럼이 순서대로라면 생략할수 있다.

-- 하나의 SQL 문으로 데이터를 여러개 저장하는 방법

insert into cats
(name, age)
values
('검정이', 4) , ('노랑이', 3), ('Happy', 8);


select * from people;

insert into people
(first_name, last_name, age)
values
('Tina', 'Belcher', 13);

select * from people;

insert into people
(first_name, last_naem, age)
values
('Linda', 'Belcher', 45), ('Phillip', 'Frond', 38), ('Calvin', 'Fischoeder', 70);

insert into people
(first_name, age)
values
('Tina', 13);

-- not null 인 경우, 데이터를 안넣으면 
-- 문자열은 공백으로 저장되고, 숫자는 0이 된다.

insert into people
(first_name)
values
('Tina');

insert into people
(first_name)
values
('Tina');

select * from people;  

-- default 항목에 데이터를 적어주면
-- 해당 데이터가 비어있는 상태로 insert 되면,
-- default에 적은 데이터로 저장된다.

insert into people
(first_name)
values
('Tina');





