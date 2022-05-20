use yh_db;

insert into cats
(name, breed, age)
values
('Ringo', 'Tabby', 4),
('Cindy', 'Maine Coon', 10),
('Dumbledore', 'Maine Coon', 11),
('Egg', 'Persian', 4),
('Misty', 'Tabby', 13),
('George Michael', 'Ragdoll', 9),
('Jackson', 'Sphynx', 7);

select * from cats;

-- 기존 데이터의 값을 변경하는 SQL
-- breed 가 Tabby인 고양이의 종을, Shorthair로 변경

update cats
set breed = 'Shorthair'
where breed = 'Tabby';

-- 고양이 이름이 Misty 인 고양이의 나이를 14로 바꾸세요.alter

update cats
set age = 14
where name = 'Misty';

-- 이름이 'Jackson'인 고양이의 이름을 Jack로 바꾸세요.

update cats
set name = 'Jack'
where name = 'Jackson';

-- 데이터 삭제하는 방법

delete from cats
where name = 'Egg';

select * from cats;

-- 고양이의 나이가 4살인 고양이 데이터를 삭제하시오.

delete from cats
where age = 4;

-- 나이가 10살인 고양이의 데이터를 가져오세요.

select * from cats
where age = 10;

-- 모든 고양이의 이름과 나이만 가져오시오.

select name, age from cats;

-- 고양이의 나이가 10살이상인 고양이의 이름과 나이만 가져오시오.

select name, age from cats
where age >= 10;



