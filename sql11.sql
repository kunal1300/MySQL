use learndb;

-- check common columns in both tables: id in movies, movieid in members
-- common records in both tables: 1,2,5,8,10: 5 records
use classess;
select * from movies,members;

select m1.movieid from members m1 
join movies m2 on m1.movieid=m2.id;






-- Q.1. Display member and movie name who have watched movies.
-- Inner Join: Common records will be displayed
-- Display only those members who have watched a movie

select m1.first_name,m1.last_name,m2.title from members m1 
join movies m2 on m1.movieid=m2.id;



-- Q.2. Display all members, even those who did not watch any movie
-- LEFT Join

select * from members m1 left join movies m2 on  m1.movieid=m2.id;


-- Q.3. Display all movies, even if no member watched them
-- RIGHT JOIN

select * from members m1 right join movies m2 on  m1.movieid=m2.id;


-- Q.4. Display Members who have NOT watched any movie
-- LEFT Join where movie id is NULL

select * from members m1 left join movies m2 on  m1.movieid=m2.id where id is null;

-- Q.5. Display Movies that have NOT been watched by anyone
-- Movies table - 3,4,6,7,9 movie ids are not watched by anyone

select * from members m1 right join movies m2 on  m1.movieid=m2.id where m2.id in(3,4,6,7,9);

-- try same result with RIGHT JOIN

select * from members m1 right join movies m2 on  m1.movieid=m2.id where movieid is null;


-- Q.6. Count how many members watched movies in each category
-- Animation movies watched by 2 members, Action - 1, 18+ - 1, Romance - 1


select m2.category,count(category) as Count from members m1 inner join movies m2 on  m1.movieid=m2.id
group by category ;



-- Q.7. Display members who watched 18+ movies
-- common people - who watched movie (18+) 

select * from members m1 inner join movies m2 on  m1.movieid=m2.id where category = "18+";

-- ***************************************************************************************

select * from authors;
select * from books;

-- Display authorid of authors and title of books
-- common records

select authors.AuthorId,books.Title from authors inner join books
on authors.AuthorId= books.AuthorId;

-- *********************************************************************
-- SELF JOIN: Connection with same table


-- Refer myemp table
-- Q.8. Find empid, firstname, lastname, mgrid from myemp table 
-- and disply top 20 records.
select * from myemp;

select EMP_ID ,FIRST_NAME,LAST_NAME,MGR_ID from myemp limit 20 ;




-- Who is the manager of Neena? Values in mgr_id are coming from emp_id
-- For self join we assume there are 2 tables called myemp.

-- Q.9. Find manager of every person use self join i.e. connection on single table only
-- Consider 1st myemp table as emp table and 2nd myemp table as mgr table.
-- we can write inner join here.

select a.FIRST_NAME,a.LAST_NAME, b.FIRST_NAME,b.LAST_NAME,b.DEP_ID,b.JOB_ID from myemp a inner join myemp b 
on a.EMP_ID=b.MGR_ID;