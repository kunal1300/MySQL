use classess ;


select str_to_date('07,01,2022','%d,%m,%Y') as date;

select  str_to_date('January 26,2026','%M %d,%Y') as date;

select  str_to_date('January 26,26','%M %d,%y') as date;

select  date_format('2023-12-01','%W, %M %e,%Y') as date;

select  str_to_date('2023-January-06 18:45:30','%Y-%M-%d %H:%i:%s') as date;

select str_to_date(REGEXP_REPLACE('27th January 2026','(st|nd|rd|th)',""),'%d %M %Y')as date;

SELECT SUBSTR("DATASCIENCE",5) AS ExtractString;
SELECT SUBSTR("DATASCIENCE" FROM 5) AS ExtractString;

SELECT SUBSTR("DATASCIENCE",5,4) AS ExtractString;

SELECT SUBSTR("DATASCIENCE",-7,3) AS ExtractString;


SELECT trim("   APPLE   ") AS DATA;

select trim(leading from "  Apple   ") as data;
select trim(trailing from "  Apple   ") as data;
select trim("*" from "****DataScience*****") as result;

select student_name,upper(student_name) as Upper_student,lower(student_name) as Lower_student from students ;

select student_name,length(student_name) as "Length" from students;

select * from students;
select student_name,qualification,concat(student_name," - ",qualification) As Details from students;

select student_name,substr(student_name,1,3) as FirstThreeletters from students;
select student_name,substr(student_name,-3) as FirstThreeletters from students;


select email,replace(email,"gmail","innomatics") as NewEmail from students;

select student_name,substr(student_name,1,4),substr(student_name,-4) from students;

select student_name,left(student_name,4), right(student_name,4) from students;

select student_name,reverse(student_name) as ReverseName from students;





