use classess;
select * from myemp;

select emp_id,FIRST_NAME,LAST_NAME,salary,DEP_ID,
avg(salary) over (partition by DEP_ID order by DEP_ID ) as AvgSalary
from myemp;


select emp_id,FIRST_NAME,LAST_NAME,salary,DEP_ID,
avg(salary) over (partition by DEP_ID order by DEP_ID ) as AvgSalary
from myemp;



with cte1 as
(
select  emp_id,FIRST_NAME,LAST_NAME,salary,DEP_ID,
avg(salary) over (partition by DEP_ID order by DEP_ID ) as AvgSalary
from myemp
)
select *,(salary-AvgSalary) as differnce from cte1;


with cte1 as(
select emp_id,first_name,DEP_ID,salary,
max(salary) over(partition by DEP_ID) as max_salary from myemp
)
select * from cte1 where salary=max_salary; 


use learndb;
select * from marks;
select * from marks order by mark desc;

#rank and dense rank
select *,
rank() over (order by mark desc) as Ranks
from marks;


select *,
dense_rank() over (order by mark desc) as Ranks
from marks;

use classess;
select * from myemp;

with cte as(
select *,
dense_rank() over (order by salary desc) as Ranks
from myemp
)
select * from cte where ranks=3;



 

with cte as(
select *,
dense_rank() over (order by HIRE_DATE asc) as Hire_Ranks
from myemp
)
select * from cte where Hire_Ranks=2;

with cte_1 as(
select *,
dense_rank() over (partition by DEP_ID order by HIRE_DATE asc) as Hire_Ranks
from myemp
)
select * from cte_1 where Hire_Ranks=1;

use learndb;

select * from marks;


#row_number
select *,
row_number() over (order by mark desc) as rnk from marks;

use learndb;

create table trains(Train_id integer,   Station varchar(50),  Time time);
insert into trains values (110,'San Francisco', '10:00:00'),
(110,'Redwood City',  '10:54:00'),
(110,'Palo Alto','11:02:00'),
(110 ,'San Jose', '12:35:00'),
(120,'San Francisco','11:00:00'),
(120 ,'Palo Alto', '12:49:00'),
(120,'San Jose', '13:30:00');

select * from trains;


select *,
lag(time,1) over (partition by Train_id order by time ) Prev_stationTime,
lead(time,1) over (partition by Train_id order by time ) next_stationTime
from trains;

# find next station time
with cte as(
select *,
lead(time,1) over (partition by Train_id order by time ) next_stationTime,
lag(time,1) over (partition by Train_id order by time ) Prev_stationTime
from trains
)
select *,subtime(next_stationTime,time) as next_Difference,
subtime(Prev_stationTime,time) as pre_next_Difference 
from cte;



-- hw
-- ntile()
-- first_value()
-- last_value()
-- nth_value()

use classess;

SELECT *,
NTILE(3) OVER (ORDER BY salary DESC) AS salary_group
FROM myemp;

SELECT first_name, salary,
NTILE(3) OVER (ORDER BY salary DESC) AS salary_group
FROM myemp;

with cte as (
SELECT first_name, salary,
NTILE(3) OVER (ORDER BY salary DESC) AS salary_group
FROM myemp
)
select count(*) from cte where salary_group=2;


# first_value
with cte as (
SELECT first_name,DEP_ID, salary,
first_value(salary) OVER (partition by DEP_ID order by salary DESC) AS rnk
FROM myemp
)
select * from cte;

-- last_value
WITH cte AS (
SELECT first_name,dep_id,salary,
LAST_VALUE(salary) OVER (partition by dep_id order by salary desc
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS rnk
FROM myemp
)
SELECT * FROM cte;

#n_value

WITH cte AS (
SELECT first_name,dep_id,salary,
nth_value(salary,3) OVER (partition by dep_id order by salary desc
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Second_highest_sal
FROM myemp
)
SELECT * FROM cte;

WITH cte AS (
SELECT first_name,dep_id,salary,
nth_value(salary,2) OVER (order by salary desc
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Second_highest_sal
FROM myemp
)
SELECT * FROM cte;

select * from myemp;


select * from myemp limit 10;

select EMP_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEP_ID from myemp;

create view view1 as
select EMP_ID,FIRST_NAME,LAST_NAME,JOB_ID,SALARY,DEP_ID  from myemp;



select * from view1;
select * from view1 limit 10;


use classess;

select * from movies;
select * from members;


select mv.title,mm.first_name,mm.last_name
from movies mv left join members mm on mv.id=mm.movieid;


select mv.title,ifnull(mm.first_name,"--") as Firstname,ifnull(mm.last_name,"--") as Lastname
from movies mv left join members mm on mv.id=mm.movieid;



drop view view1;

create view rentals as
select mv.title,ifnull(mm.first_name,"--") as Firstname,ifnull(mm.last_name,"--") as Lastname
from movies mv left join members mm on mv.id=mm.movieid;

select * from rentals;


create view Aview as
select * from authors where AuthorId<15;

select * from Aview;

insert into Aview values(20,"Kunal Solanki");

delete from authors where AuthorId=20;

select * from authors;

drop view Aview;


create  view  Aview as 
select * from authors where AuthorId<15 with check option;

select * from Aview;

insert into Aview values(20,"Kunal Solanki");
insert into Aview values(20,"Kunal Solanki");





