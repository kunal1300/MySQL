use classess;
show tables;
select * from students; 

describe students;


select student_name,age from students where age <= 22 ;
select * from students where qualification = "MCA";
select * from students where qualification = "B.Sc";
select * from students where qualification = "M.Tech";
select * from students where qualification = "BCA";
select * from students where qualification = "BE";

select student_name,age,enrolled_on from students where age<25 and day(enrolled_on)>="5" ;


select count(*) from students where qualification not in ("B.Sc");
select * from students where grad_year not in ("2020");

select * from students where grad_year between 2020 and 2023 order by student_id;



select * from students where qualification in ("MCA","B.Tech","B.Sc");

select * from students where address in ("Pune, Maharashtra","Hyderabad, Telangana");

select * from students where address not in ("Pune, Maharashtra","Hyderabad, Telangana");

select * from students where student_name  like "A%";
select * from students where student_name  like "%n";
select * from students where student_name  like "a%" and student_name like "%a" ;

select * from students where student_name  like "a%a";

select * from students where address  like "pune%" or address like "hyderabad%";
select * from students where address  like "%mah%" ;

select * from students where email  like "%gmail%" ;
select * from students where student_name not like "a%";
select * from students where phone  like "________00";

select * from students where student_name like "s__";
select * from students where email like "_____@gmail.com";


select * from students where student_name like "M__a";



