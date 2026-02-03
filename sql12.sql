use classess;

select * from myemp;
# self join
select e.emp_id,e.first_name,e.last_name,
m.first_name as mgr_fname,m.last_name as mgr_lname, m.emp_id as mgr_id
from myemp as e
inner join myemp as m 
on e.mgr_id = m.emp_id;

select * from movies;

select * from members;

#Union and Union all
SELECT *
FROM movies mv
LEFT JOIN members m
ON mv.id = m.movieid
UNION # removes duplicate
SELECT *
FROM movies mv
RIGHT JOIN members m
ON mv.id = m.movieid;

SELECT *
FROM movies mv
LEFT JOIN members m
ON mv.id = m.movieid
UNION all #allows/shows duplicate
SELECT *
FROM movies mv
RIGHT JOIN members m
ON mv.id = m.movieid;


select * from members m inner join movies mv
on mv.id = m.movieid;

#single valued query
select * from myemp where SALARY = (select max(SALARY) from myemp) ;
# multi valued query
select JOB_ID,SALARY from myemp where SALARY> (select avg(SALARY) from myemp) group by 1,2;

use classicmodels;
select * from offices;

select * from employees;

select * from employees where officeCode in (select officeCode from offices where country = "USA");

select * from employees e  join offices o on e.officeCode=o.officeCode where country = "USA";

# correlated Query
use classess;

select * from myemp;



select DEP_ID,avg(SALARY) as avgsal from myemp group by DEP_ID order by DEP_ID asc;



select * from myemp where DEP_ID =10;

select * from myemp e where SALARY > (select DEP_ID,avg(SALARY) from myemp) ;


select * from myemp where Salary  =(select max(Salary) from myemp);

select first_name,last_name,(select avg (salary) from myemp) as avgSal  from myemp;

select * from myemp;



select dep_id,count(*) as counts,avg(Salary) from myemp group by 1 order by 1,2,3;


#------------------
select * from myemp e where SALARY>
(select avg (SALARY) from myemp where DEP_ID=e.DEP_ID);




select * from (select FIRST_NAME,salary,(salary*0.2)as bonus from myemp) as s 
where bonus > 2000;


-- Filter emp whose bonus > 2000

-- calculate the total salary (salary + bonus)

-- filter total salary > 20000

-- deduct 5% tax, (final_salary = total_salary - total_salary * 0.05)

-- filter final_salary > 20000

select * 
from(select *,salary + bonus as total_salary
from (select first_name,salary,(salary *0.2)as bonus
from myemp)as s1
where bonus > 2000) as s2
where total_salary>20000;

select * from myemp;

select * from (select *,(total_salary - total_salary * 0.05) as final_salary
from (select *,(salary + bonus) as total_salary
from (select *,(salary * 0.2) as bonus
from myemp) as s1
where bonus > 2000) as s2
where total_salary > 20000) as s3
where final_salary > 20000;


with cte_1 as 
(
select FIRST_NAME,LAST_NAME,SALARY,(SALARY*0.2) as bonus from myemp
),
cte_2 as
(
select *,salary+bonus as total_salary from cte_1 where bonus >2000
),
cte_3 as
(
select *,total_salary-total_salary*0.05 as final_salary from cte_2 where total_salary>20000
)
select * from cte_3 where final_salary>21000;






