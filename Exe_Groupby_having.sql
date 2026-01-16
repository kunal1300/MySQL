use classess;
select * from books;

select *,length(Title) as "Lenght"  from books
where AuthorId in (1,5);

select * from myemp;

select distinct(FIRST_NAME)
from myemp 
where 
FIRST_NAME like "a%" or 
FIRST_NAME like "e%" or
FIRST_NAME like  "i%" or 
FIRST_NAME like  "o%" or
FIRST_NAME like  "u%";

select distinct(FIRST_NAME)
from myemp 
where substring(FIRST_NAME,1,1) in ("a","e","i","o","u");

select distinct(FIRST_NAME)
from myemp 
where left(FIRST_NAME,1) in ("a","e","i","o","u");


SELECT * FROM classess.books;

select AuthorId,count(*) from books group by AuthorId;

select AuthorId,count(*) as "Bookwritten"  
from books 
group by AuthorId 
having count(*) >=3 ;

select AuthorId,count(*) as "Bookwritten"  
from books 
group by AuthorId 
having count(*)=2 ;

select * from myemp;

select DEP_ID,avg(SALARY) as "Avg Salary"
from myemp 
group by DEP_ID 
order by DEP_ID asc;

select DEP_ID,avg(SALARY) as "Avg Salary"
from myemp 
group by DEP_ID having avg(SALARY)>8000;

SELECT * FROM movies;

select category, count(*) as "Total" from movies group by category;

select category, count(*) as "Total" from movies group by category having count(*)>2;


SELECT * FROM students;

select * from students order by student_name asc;

select * from students order by student_name desc;

select student_name,age from students order by age;


select qualification,student_name from students order by qualification,student_name;

select student_name,age from students order by age limit 5;

select student_name,dob,age from students order by dob asc,age desc;

select student_name,age from students order by age desc,student_name asc;

select student_name,length(student_name) as "Name Length" 
from students 
order by "Name Length" desc;

select qualification,age from students where qualification in ("BCA") order by age desc;

select * from myemp;

select DEP_ID,count(*) as "Total" from myemp group by DEP_ID order by DEP_ID;
 
 
select DEP_ID,MGR_ID  from myemp order by DEP_ID,MGR_ID ;


select FIRST_NAME,DEP_ID,HIRE_DATE from myemp order by DEP_ID,HIRE_DATE desc  ; 

select * from sales1;

select distinct(City) from sales1;

select CustomerName,Product from sales1 where Product ="kurti";

select PaymentMethod,count(PaymentMethod) as "Wallet payment" 
from sales1 where PaymentMethod = "wallet";

select * from sales1;

select * from sales1 order by DiscountPercent desc limit 5;

select Category,sum(Quantity) as Total from sales1 group by Category;


select Category,sum(Quantity) as Total from sales1 group by Category order by total desc;


select City,avg(DiscountPercent) as Avg_dis from sales1 
group by City 
having Avg_dis > 25 ;

select * from sales1;

select CustomerName, monthname(SaleDate) as "Month name",PaymentMethod from Sales1 where monthname(SaleDate) in("June","July") and 
PaymentMethod in ("Card") and year(SaleDate)=2024;


select City,count(*) as "Trans"  from sales1 group by City order by "Trans" desc limit 3;


# 3 show sales where paymentmethod is not COD and Discount >30
select * from sales1 where PaymentMethod not in ("COD") and DiscountPercent >30;

# 4 list customers whose  email domain is example.org
select CustomerEmail from sales1 where CustomerEmail like "%.org";
#or
select CustomerEmail,substring(CustomerEmail,-4) as "Substing" from sales1 where substring(CustomerEmail,-4)=".org";
#or
select CustomerEmail,right(CustomerEmail,4) as "right" from sales1 where right(CustomerEmail,4)=".org";

# 5 list customers whose  email domain is not example.org
select CustomerEmail from sales1 where CustomerEmail not like "%.org";
#or
select CustomerEmail,substring(CustomerEmail,-4) as "Substing" from sales1 where substring(CustomerEmail,-4)!=".org";
#or
select CustomerEmail,right(CustomerEmail,4) as "right" from sales1 where right(CustomerEmail,4)!=".org";

 
# 6 show number of sales for each month in 2024
select * from sales1;

select month(SaleDate) as CMonth,sum(Quantity*Price) as "Sales" from sales1
where year(SaleDate) = 2024
group by CMonth order by CMonth;

