-- Active: 1675674094978@@127.0.0.1@3306@week06
create database week06;
use week06;

/* task 2*/
create table student
(
    cid char(7),
    roll_number char(10),
    name char(100) not null,
    approval_status char(20),
    credit_status char(10),
    primary key(cid,roll_number)
);
create table course(
    cid char(7),
    name char(100) not null,
    primary key(cid)
);
create table credit(
    cid char(7),
    l int NOT NULL, 
    t INT NOT NULL,
    p INT NOT NULL,
    c FLOAT NOT NULL,
    PRIMARY KEY(cid)
);
CREATE TABLE faculty
(
    cid char(7),
    name char(50)
);
CREATE TABLE semester
(
    dept char(4),
    number char(4),
    cid char(7)
);

/* task 3 */
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab6/students-credits.csv"
into table student
fields terminated by ','
lines terminated by '\n';
select * from student limit 5;
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab6/courses.csv"
into table course
fields terminated by ','
lines terminated by '\n';
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab6/credits.csv"
into table credit
fields terminated by ','
lines terminated by '\n';
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab6/faculty-course.csv"
into table faculty
fields terminated by ','
lines terminated by '\n';
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab6/semester.csv"
into table semester
fields terminated by ','
lines terminated by '\n';

/* task 4 */
select sum(l)
from credit; /* 816 */
select sum(c)
from credit 
where cid like "EE%"; /* 365 */
select sum(p)
from credit
where cid like "DD%"; /* 54 */

/* task 5 */
select cid, count(roll_number) as no_of_students
from student
where cid like "%M" and credit_status="Audit"
group by cid;
select SUBSTRING(cid, 1, 2) as dept, sum(c) as total_no_of_credits
from credit
group by SUBSTRING(cid, 1, 2);

/* task 6 */
SELECT cid,count(roll_number) as audit_count
from student
where credit_status="Audit"
group by cid
having audit_count>=4;
select course.cid,course.name,count(faculty.name) as no_of_faculty
FROM course,faculty
where course.cid=faculty.cid
group by course.cid
having no_of_faculty>1;
select faculty.name, count(course.cid) as no_of_courses
from faculty,course
where faculty.cid=course.cid
group by faculty.name
having no_of_courses>1;

/* task 7 */
select course.cid,course.name,credit.c
from course natural join credit
where credit.c in 
(select min(c) as min_credit
from credit);
select faculty.cid,faculty.name
from faculty natural join credit
where credit.cid like "CS%" and credit.c in 
(select min(c) as min_credit
from credit
where cid like "CS%");

/* task 8 */
CREATE table tot_cred_by_sem_DD as
(
select semester.number,sum(c) as sum_cred_DD
from semester natural join credit
where dept="DD"
group by semester.number
);
select * from tot_cred_by_sem_DD; --viewing the DoD table

CREATE table tot_cred_by_sem_BSBE as
(
select semester.number,sum(c) as sum_cred_BSBE
from semester natural join credit
where dept="BSBE"
group by semester.number
);
select * from tot_cred_by_sem_BSBE; --viewing the BSBE table

--task 8a
select distinct tot_cred_by_sem_BSBE.number
from tot_cred_by_sem_BSBE, tot_cred_by_sem_DD
where sum_cred_BSBE<sum_cred_DD;

--task 8b
select distinct tot_cred_by_sem_BSBE.number
from tot_cred_by_sem_BSBE
where sum_cred_BSBE>=(select max(sum_cred_DD) from tot_cred_by_sem_DD);