use classess;
select current_date() as today;

select * from students;

select student_name,dob,timestampdiff(day,dob,curdate()) as cal_age
from students;

select student_name,dob,month(dob) from students where month(dob)=7;

select student_name,dob,monthname(dob) from students where monthname(dob) = "July";

select student_name,dob,month(dob) as Months from students;

select student_name,dob,year(dob) as Years from students;

select student_name,enrolled_on,day(enrolled_on)as Day_enro, month(enrolled_on)as month_enr 
,year(enrolled_on) as year_enr ,monthname(enrolled_on)as Month_enr,
dayname(enrolled_on)as Week_enr from students;


select CustomerName,City, Upper(CustomerName)as upper_name,lower(CustomerName)as lower_name,concat(CustomerName," From ",City) as cus_city from sales1;

select CustomerName, substr(CustomerName,1,5) as subFirst_5_Char, left(CustomerName,5) as leftFirst_5_Char from sales1;


select CustomerName from sales1 where CustomerName like "a%";

select CustomerName from sales1 where CustomerName like "% a%";

select * from sales1 where CustomerName like "% a%" or CustomerName like "% b%";


select SaleDate,day(SaleDate)as Day_sales  ,month(SaleDate)as month_sales  ,year(SaleDate) as year_sales from Sales1;


select SaleDate,datediff(curdate(),SaleDate)as Difference from Sales1;

select CustomerName,SaleDate,date_format(SaleDate,"%d-%m-%y") as new_date from sales1;

use classess;

select concat(CustomerName,"-" ,year(SaleDate)) as Name_SalesYear from sales1;

select CustomerName,SaleDate from sales1 where CustomerName like 'a%' and SaleDate > "2024-1-1";


select concat(CustomerName," - ",date_format(SaleDate,"%d-%m-%y")) as Name_date from sales1 where year(SaleDate)=2023;


select * from sales1;

Select CustomerName,SaleDate,Product,replace(Product,"Nike","Adidas") as newCol,
datediff(curdate(),SaleDate)from sales1 where SaleDate > "2023-3-31";



select concat((CustomerName),"-",date_format(SaleDate,"%d/%m/%y")) as customer from sales1;


Select CustomerName,year(SaleDate) as "Year", Month(SaleDate) as "Month",
date_format(SaleDate,"%d-%m-%y") as "Date" from sales1 where CustomerName like "%m%" ;

Select CustomerName,SaleDate from sales1
where CustomerName like "s%" and SaleDate < "2024-6-01" ;

select Product,date_format(SaleDate,"%M-%Y") from sales1
where Product like "%Shoes%";

Select concat(CustomerName,"-",datediff(curdate(),SaleDate),"-",Product) as data_ from Sales1
where CustomerName like "S%" and SaleDate < "2024-08-1";



select * from Sales1;

select Product,Category,Price,City from Sales1 where City="Pune";

select max(Price) as Max_city,City from Sales1 group by 2 order by 1 asc ;


select Product,avg(DiscountPercent) as "Avg Discount" from Sales1 group by 1 order by 2 asc;


select Product,sum(Price*Quantity) as Total_sales from Sales1  group by Product ;

#where City = "Pune" 
select City,count(City) as "Transaction" from Sales1 group by City;

select Category ,sum(Quantity) as "Total Sold" from Sales1 group by Category;
select * from Sales1;

select Category ,round(avg(Price),1) as "Avg_Price" from Sales1 group by Category;


select PaymentMethod, sum(Quantity*Price) as Revenu from Sales1 group by PaymentMethod;

select Category,city,sum(Quantity*Price) as Revenu 
 from Sales1 group by city,Category order by Category asc;
 
 
select month(SaleDate) as "Sale Month",sum(Quantity*Price) as "MonthSale" from Sales1 group by month(SaleDate);

select year(SaleDate) as SaleYear,month(SaleDate) as saleMonth,
sum(Quantity*Price) as Totalsale
from sales1  
Group by month(SaleDate),year(SaleDate);

#FWGHSOL

#From->Where->Group By ->Having By -> Select-> order by-> Limit

select emp_id, first_name, salary,
(salary * 0.2) as bonus,
(salary + salary * 0.2) as total_salary
from myemp;

select first_name, hire_date,
monthname(hire_date) as month_name
from myemp;