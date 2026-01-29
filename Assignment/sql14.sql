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



