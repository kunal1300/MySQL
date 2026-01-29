use classess;
select * from books;
select * from authors;
describe books;
drop tables books;

CREATE TABLE Authors(AuthorId INTEGER primary key, 
                                Name VARCHAR(70));

insert into Authors values(1,'J K Rowling');
insert into Authors values(2,'Thomas Hardy');
insert into Authors values(3,'Oscar Wilde');
insert into Authors values(4,'Sidney Sheldon');
insert into Authors values(5,'Alistair MacLean');
insert into Authors values(6,'Jane Austen');
insert into Authors values(7,'Chetan Bhagat');
insert into Authors values(8,'Oscar Wilde');

select * from books;

CREATE TABLE Books(
             BookId INTEGER primary key, 
             Title VARCHAR(50),
             AuthorId INTEGER, foreign key (authorid) references authors(authorid)
             on delete cascade
             on update cascade);


insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);

insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(14,'The Happy Prince',8);




DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

CREATE TABLE Authors(
    AuthorId INT PRIMARY KEY,
    Name VARCHAR(70)
);

CREATE TABLE Books(
    BookId INT PRIMARY KEY,
    Title VARCHAR(50),
    AuthorId INT,
    FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO Authors VALUES
(1,'J K Rowling'),
(2,'Thomas Hardy'),
(3,'Oscar Wilde'),
(4,'Sidney Sheldon'),
(5,'Alistair MacLean'),
(6,'Jane Austen'),
(7,'Chetan Bhagat'),
(8,'Oscar Wilde');

INSERT INTO Books VALUES
(1,'Harry Potter and the Philosopher''s Stone',1),
(2,'Harry Potter and the Chamber of Secrets',1),
(3,'Harry Potter and the Half-Blood Prince',1),
(4,'Harry Potter and the Goblet of Fire',1),
(5,'Night Without End',5),
(6,'Fear is the Key',5),
(7,'Where Eagles Dare',5),
(8,'Sense and Sensibility',6),
(9,'Pride and Prejudice',6),
(10,'Emma',6),
(11,'Five Point Someone',7),
(12,'Two States',7),
(13,'Salome',8),
(14,'The Happy Prince',8);

delete  from Authors where AuthorId=1;

select * from Authors;
select * from books;

update authors 
set AuthorId =88 where AuthorId =8;

use classess;

create table test(
id int primary key auto_increment,
name varchar(10),
age int
);

insert into test (name,age)values("Tomm",22);
select * from test;

alter table test 
auto_increment=100; 

insert into test (name,age)values("tim",24);
insert into test (name,age)values("jim",25);
select * from test;


