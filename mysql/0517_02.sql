use yh_db;

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students;
select * from papers;

select s.first_name, p.title, p.grade
from students s
join papers p
on s.id = p.student_id
order by p.grade desc;

select s.first_name, p.title, p.grade
from students s
left join papers p
on s.id = p.student_id;

select s.first_name, ifnull(p.title,'MISSING'), ifnull(p.grade,0)
from students s
left join papers p
on s.id = p.student_id;

select s.first_name, avg(ifnull(grade,0)) as average
from students s
left join papers p
on s.id = p.student_id
group by s.first_name
order by average desc;

select s.first_name, avg(ifnull(grade,0)) as average, if(avg(ifnull(grade,0)) >80,'PASSING','FAILING') as passing_status
from students s
left join papers p
on s.id = p.student_id
group by s.first_name
order by average desc;

-- title은 Null은 MISSiN, grade Null

select s.first_name, ifnull(p.title, 'MISSING'), p.title, p.grade
from students s
left join papers p
  on s.id = p.student_id;
  
-- first_name, average (각 학생별로 평균 구하기)
select s.first_name, ifnull( avg(grade) , 0) as average
from students s
left join papers p
	on s.id = p.student_id
group by s.id;

-- first_name, average, passing_status (80점보다 크면 PASSING, 그렇지 않으면 FAILING
-- select 레벨에서는 새로 만든 컬럼은 인식하지 못한다.
select s.first_name, ifnull( avg(grade) , 0) as average , if(avg(grade)>=80, 'PASSING', 'FAILING') as passing_status
from students s
left join papers p
	on s.id = p.student_id
group by s.id;