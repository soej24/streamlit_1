use memo_app_db;

select * from user;

insert into user
(email, password, name)
values
('abce4@nate.com', 'aaad12345', '홍길동');

-- 삭제할때
delete from user
where id = 5;

select * from memo;

insert into memo
(user_id, content, todo_date)
values
(3, '과제하기', '2022-05-10 15:30');
-- 이러면 에러, user_id가 forigen key로 설정되서

-- 친구 추가하는 SQl
select * from follow;

insert into follow
(follower_id, followee_id)
values
(3, 2);

-- 내 일정 가져오되 미래의 25개씩 SQl 
select * from user;
select * from memo;

select * 
from memo m
where user_id =2
order by todo_date desc
limit 0, 25;

-- 일정 완료 여부 셋팅하는 SQL
update memo
set is_completed = 1
where id = 2;

select * from memo;

-- 현재 시간 기준으로 지나지 않은 일정을 가져온다.
select *
from memo date ;



-- 친구 목록 가져오기
select *
from follow f
join user u 
   on f.followee_id = u.id
where follower_id = 1;

-- 나의 id는 1이다. 
-- 내 친구들인 김나나와 홍길동의 일정을 가져오는 SQL


select * 
from memo;

select u.name, m.content, m.todo_date, m.is_completed
from follow f
join memo m
  on f.followee_id = m.user_id
join user u
  on m.user_id = u.id
where follower_id = 1 and todo_date > now()
order by todo_date desc;

-- 현재 시간 이전의 지난 일정을 가져온다.
select u.name, m.content, m.todo_date, m.is_completed
from follow f
join memo m
  on f.followee_id = m.user_id
join user u
  on m.user_id = u.id
where follower_id = 1 and todo_date > now()
order by todo_date desc;