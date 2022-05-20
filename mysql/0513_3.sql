use shirts_db;

insert into shirts
(aritcle, color, shirt_size, last_worn)
values
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 10),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

select * from shirts;

select aritcle, color from shirts;

update shirts
set shirt_size = 'L'
where aritcle = 'polo shirt';

update shirts
set last_worn = 0
where last_worn > 15;

update shirts
set last_worn = 15
where shirt_size = 'M';

-- 하얀 셔츠들만, 사이즈는 XS로 컬러는 off white로 바꾸세요.
update shirts
set color = 'off white', shirt_size = 'XS'
where color = 'white';

select * from shirts;

delete from shirts
where last_worn > 200;

select * from shirts;

delete from shirts
where article = 'tank top';

-- 데이터 전체 삭제
delete from shirts;

-- 테이블 자체를 삭제
drop table shirts;

