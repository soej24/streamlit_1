use movie_app_db;


select * from movie;
select * from user;

insert into user
(email, password, name, gender)
values
('qqq@gmail.com', '1234', 'Mike', 1);

insert into user
(email, password, name, gender)
values
('qqq@gmail.com', '234542a', 'Seri', 1);


-- 1. 하트 눌러서 즐겨찾기에 저장하는 SQL
insert into favorite
(movie_id, user_id)
values
(255, 1);

select * from favorite;

-- 2. 즐겨찾기 해제! 다시 하트 누르면 즐겨찾기에서 삭제하는 SQL
delete from favorite
where id = 4;

-- 3. 내 즐겨찾기 리스트 가져오는 SQL (9페이지)
select m.title, count(r.movie_id) as cnt, ifnull(avg(r.rating), 0) as avg
from favorite f
join movie m
  on f.movie_id = m.id
left join review r -- 리뷰가 없는 영화도 같이 뽑아야 하기 때문에
  on f.movie_id = r.movie_id
where f.user_id = 1
group by r.movie_id;
 -- 내꺼가 여기선 id 1

select *
from review;

-- 4. 내가 작성한 리뷰 리스트 가져오는 SQL (8페이지)
select m.title, r.rating
from review r
join movie m
  on r.movie_id = m.id
where r.user_id = 1;

-- 5. 영화제목 검색하여 영화 목록 가져오는 SQL
select title, count(r.movie_id), ifnull(avg(r.rating),0)
from movie m
left join review r
  on m.id = r.movie_id
where m.title like '%mon%'
group by r.movie_id;

-- 6. 해당 영화에 대한 리뷰 리스트 가져오는 SQL (5페이지)

select u.name, r.content, r.rating
from review r
join user u
  on r.user_id = u.id
where r.movie_id = 2;


-- 7. 영화 상세 정보 가져오는 SQL(4페이지)
-- 영화 하나 상세화면, where로 1나를 이미 검색했기 때문에
-- 그룹바이는 할 필요가 없다.
select title, genre, summary, attendance, year,
       count(r.movie_id) as cnt, avg(r.rating) as avg
from movie m
join review r 
  on m.id = r.movie_id
where m.id =2;

-- 8. 메인페이지의 영화 리스트 가져오는 SQL(3페이지) (내가 좋아요 한 정보까지 있어야 함)
-- 하트를 내가 했으면 1, 안했으면 0
select m.title, count(m.id), avg(r.rating), if(f.user_id is null, 0, 1)
from movie m
left join review r
        on m.id = r.movie_id -- 리뷰가 없는 영화도 가져와야 하기때문에 left join
left join favorite f
        on f.user_id = 1 and m.id = f.movie_id -- 내가 좋아요 누른 정보 가져옴
group by m.id; -- 영화 id로 그룹바이(영화별 리뷰갯수 구하기 위해서)
        
        
        
        
        