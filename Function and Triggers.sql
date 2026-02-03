use classess;

select * from myemp;


set global log_bin_trust_function_creators=1;

select emp_id,FIRST_NAME,LAST_NAME,HIRE_DATE,Experience(emp_id) as "Experience" from myemp where Experience(emp_id) < 15; 

#greater than sal>15000


select * from books;

alter table books 
add column Sales int default 0;


CREATE TABLE `book_sales` (
    `sale_id` INT(11) NOT NULL AUTO_INCREMENT,
    `bookid` INT(11) DEFAULT NULL,
    `title` VARCHAR(100) DEFAULT NULL,
    `qty_sold` INT(11) DEFAULT NULL,
    `tos` DATETIME DEFAULT NULL,
    PRIMARY KEY (`sale_id`)
);

desc book_sales;
select * from book_sales;

select * from books;

update books
set sales = sales+3  
where BookId=6;

update books
set sales = sales+3
where bookid=11;


drop trigger books_AFTER_UPDATE;


