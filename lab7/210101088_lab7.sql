-- Active: 1675674094978@@127.0.0.1@3306@week07
create database week07;
use week07;
-- task 2
create table student18a(
    name char(100),
    roll_number char(10) primary key
);
create table course18a(
    semester int,
    cid char(7) PRIMARY KEY,
    name char(100),
    l int,
    t int,
    p int,
    c int
);
create table grade18a(
    roll_number char(10),
    cid char(7),
    letter_grade char(2),
    PRIMARY KEY(roll_number,cid)
);
-- task 3
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/student18.csv"
into table student18a
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/course18.csv"
into table course18a
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/grade18.csv"
into table grade18a
fields terminated by ','
lines terminated by '\n';

-- task 4a
create view minor as
select roll_number, cid, letter_grade
from grade18a
where cid like "%M";
insert into grade18a values('180101000','CS101','AB');
select * from minor WHERE roll_number = '180101000';
/* did not materialize as row added is not a minor course */

--task 4b
create view 4b as
select distinct cid,letter_grade
from grade18a;
insert into 4b values('CS101','PM');
/* The target table 4b of the INSERT is not insertable-into. 
The view is not updatable as the row must be added into the original grade18a relation. */

--task 4c
create view 4c as
select cid,letter_grade,count(roll_number) as no_of_students
from grade18a
group by cid,letter_grade;
insert into 4c values('CS101','NP','17');
/* The target table 4c of the INSERT is not insertable-into. 
The view is not updatable as it has a group by clause. */

-- task 5a
create table course18b(
    semester int,
    cid char(7) PRIMARY KEY,
    name char(100),
    l int,
    t int,
    p int,
    c int,
    check (semester in ('1','2','3','4','5','6','7','8'))
);
insert into course18b values('10', 'CS777', 'Introduction to Chat GPT','3', '0', '0', '6');
/* The tuple is not inserted as Check constraint is violated. */

-- task 5b
create table allowable_letter_grade(
    grade char(2),
    value int
); 
insert into allowable_letter_grade values('AS','10');
insert into allowable_letter_grade values('AA','10');
insert into allowable_letter_grade values('AB','9');
insert into allowable_letter_grade values('BB','8');
insert into allowable_letter_grade values('BC','7');
insert into allowable_letter_grade values('CC','6');
insert into allowable_letter_grade values('CD','5');
insert into allowable_letter_grade values('DD','4');
insert into allowable_letter_grade values('FP','0');
insert into allowable_letter_grade values('FA','0');
insert into allowable_letter_grade values('NP','0');
insert into allowable_letter_grade values('PP','0');
insert into allowable_letter_grade values('I','0');
insert into allowable_letter_grade values('X','0');

--task 5c
create table grade18b(
    roll_number char(10),
    cid char(7),
    letter_grade char(2),
    PRIMARY KEY(roll_number,cid),
    check (letter_grade in ('AS','AA','AB','BB','BC','CC','CD','DD','FP','FA','NP','PP','I','X')) 
);
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/grade18.csv"
into table grade18b
fields terminated by ','
lines terminated by '\n';
update grade18b
set letter_grade='MP'
where cid='XX102M' AND letter_grade='DD';
/* Does not update, as the grade MP is not an allowed grade in the CHECK constraint*/

-- task 6a
create table student18c(
    name char(100),
    roll_number char(10),
    constraint roll_18c primary key(roll_number)
);
-- task 6b
create table grade18c(
    roll_number char(10),
    cid char(7),
    letter_grade char(2),
    constraint pr_grade18c PRIMARY KEY(roll_number,cid),
    constraint fgn_grade18c foreign key (roll_number) REFERENCES student18c(roll_number)
);
-- task 6c
alter table grade18c drop FOREIGN KEY fgn_grade18c;
describe grade18c;

-- task 7a
create table student18d(
    name char(100),
    roll_number char(10) primary key
);
-- task 7b
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/student18.csv"
into table student18d
fields terminated by ','
lines terminated by '\n';
-- task 7c
select sum(convert(roll_number,unsigned int)),min(convert(roll_number,unsigned int)),max(convert(roll_number,unsigned int)),AVG(convert(roll_number,unsigned int))
from student18d;
-- task 7d
select convert(roll_number,DATETIME)
from student18d;

-- task 8a
create table course18e like course18a;
-- task 8b
insert into course18e select * from course18a;

-- task 9a
create table student18f(
    name char(100),
    roll_number char(10) primary key,
    redundant01 int default 10
);
create table course18f(
    semester int,
    cid char(7) PRIMARY KEY,
    name char(100),
    l int,
    t int,
    p int,
    c int,
    redundant01 int default 10
);
create table grade18f(
    roll_number char(10),
    cid char(7),
    letter_grade char(2),
    redundant01 int default 10,
    PRIMARY KEY(roll_number,cid)
);

--task 9b
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/student18.csv"
into table student18f
fields terminated by ','
lines terminated by '\n'
(name,roll_number);
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/course18.csv"
into table course18f
fields terminated by ','
lines terminated by '\n'
(semester,cid,name,l,t,p,c);
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/grade18.csv"
into table grade18f
fields terminated by ','
lines terminated by '\n'
(roll_number,cid,letter_grade);

-- task 9c
select student18f.roll_number,student18f.name,grade18f.letter_grade
from student18f join grade18f using(roll_number) join course18f using(cid) 
where course18f.l=3 and course18f.t=1 and course18f.p=0 and course18f.c=8; /* 948 entries*/
-- task 9d
delete from grade18f;
-- task 9e
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab7/cs570.csv"
into table grade18f
fields terminated by ','
lines terminated by '\n'
(roll_number,cid,letter_grade);
-- task 9f
select student18f.roll_number, student18f.name, grade18f.letter_grade
from student18f join grade18f using(roll_number);