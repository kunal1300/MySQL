create database admission;
use admission;

create table Students
(
sid int,
sname char(30),
age int,
course char(30)
);

show tables;
describe Students;



insert into Students values
(1,"Amit",25,"mySql"),
(2,"Neha",24,"mySql"),
(3,"Soham",27,"mySql"),
(4,"Snehal",28,"mySql");

select * from Students;



create table patients(
pid int,
pname varchar(255),
dob date,
toe datetime
);

show tables;

desc patients;


insert into patients values
(1,'Harry','2000-05-26','2023-04-04 08:30:00'),
(2,'potter','2000-04-27','2023-04-04 08:30:00'),
(3,'jim','2000-05-26','2023-04-04 08:30:00'),
(4,'tom','2000-05-26','2023-04-04 08:30:00');


select * from patients;

create table if not exists  patients(
pid int,
pname varchar(255),
dob date,
toe datetime
);

create table test(id int);
show table status;
show tables;

drop table test;
show tables;

select * from Students;
describe Students;

alter table Students
add column marks int default 0;

alter table Students
drop column marks;

alter table Students change column sid std_id  int;

select * from Students;

alter table Students
drop column age ;

insert into Students (std_id,sname,course,marks) values (5,"john",null,30);

insert into students (std_id,sname,marks) values (6,'Jim',50); -- Type 2 Insert
select * from students;

insert into students (std_id,sname,course) values (7,'Tim','Mysql');
select * from students;

-- adding multiple records
insert into students values (8,'Potter','Mysql',78),(9,'Pat','Mysql',77),(10,'Albert','Mysql',88);
select * from students;

update Students
set sname = "Natasha"
where std_id =10;

set sql_safe_updates =0;

select * from Students;

update Students
set marks = null
where marks = 0;


update Students 
set course ="Da",marks=85
where std_id=9;


update Students set Course = "mysql";
select * from Students;


delete from Students
where std_id = 2;
select * from Students;

delete from Students
where marks is null;

select * from Students;

delete from Students;

insert into Students(std_id,sname,course,marks) values
(1,"Ritesh","Mysql",70),
(2,"Natasha","Mysql",90),
(3,"saloni","Mysql",95);

show create table Students;
truncate  Students;

show tables;

select * from patients;

select * from Students;

insert into Students values (1,"tom","sql",50);

insert into Students values (1,"tom","sql",50);

drop table Students;

create table  students
(
	sid integer unique,
	sname varchar(30) not null,
    age integer check(age>18),
    course varchar(20)
);

select * from students;
describe students;
insert into Students values (1,"tom",50,"sql");


insert into Students values (2,"tom",50,"sql");

insert into Students values (null,"jon",22,"Analytics");
insert into Students values (null,"jim",32,"mysql");

insert into Students values (5,"jim",17,"mysql");


insert into Students values (6,null,17,"mysql");

insert into Students(sid,age,course) values (7,23,"python");

alter table students
modify column sname varchar(30) not null default "Smith";

describe students;

select * from students;

insert into Students(sid,age,course) values (7,23,"python");



create table students2
 (
	sid tinyint primary key auto_increment,
	name varchar(100) not null,
    age tinyint check(age>18),
    gender enum('male','female'),
    email varchar(100) unique not null,
    phone_num char(10) unique,
    address varchar(100) default 'unkown'
); 

alter table students2
add column about varchar(200);

alter table students2
modify column about text;

alter table students2
change column sid sid_id int ;

describe students2;
