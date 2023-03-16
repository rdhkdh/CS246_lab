-- Active: 1675674094978@@127.0.0.1@3306@week05
/* task 1 */
create DATABASE week05;
use week05;

/* task 2 */
create table student(
    cid char(7),
    roll_number char(10),
    name char(100) NOT NULL,
    approval_status char(20),
    credit_status char(10),
    primary key (cid,roll_number)
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

/* task 3 */
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/students-credits.csv"
into table student
fields terminated by ','
lines terminated by '\n'
; /* copying data from csv file into specified table using load statement */
select * from student limit 5; /* displaying the first 5 rows of table*/
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/courses.csv"
into table course
fields terminated by ','
lines terminated by '\n'
;
select * from course limit 5; /* displaying the first 5 rows of table*/
LOAD DATA local INFILE "/home/ridhiman/Desktop/rkd_iitg/CS246lab/credits.csv"
into table credit
fields terminated by ','
lines terminated by '\n'
;
select * from credit limit 5; /* displaying the first 5 rows of table*/

/* task 4 */
select * from student /* selecting all columns in a record with name as specified */
where name = "Adarsh Kumar Udai";
select cid,name,credit_status
from student
where cid= "EE 390"; 
select cid, roll_number, credit_status, approval_status
from student
where approval_status= "Pending" and credit_status="Credit";
select cid, l, t, p, c
from credit
where c!=6;
select roll_number, name, cid, credit_status, approval_status
from student
where approval_status= "Approved" and credit_status="Audit";

/* task 5 */
select course.name, l,t,p,c /* table name to be used for referencing when column name is ambiguous */
from course, credit
where credit.c=8 and credit.cid=course.cid;
select course.name, l,t,p,c
from course, credit
where credit.t!=0 and credit.cid=course.cid;
select course.cid,course.name,l,t,p,c
from course, credit
where credit.c=6 and credit.cid=course.cid and !(l=3 and t=0 and p=0); /* l-t-p not equal to 3-0-0*/
select student.name,student.cid,course.name, l, t, p, c
from course, credit, student
where student.name="Pasch Paul Ole" and student.cid=course.cid and course.cid=credit.cid; /* cid should correspond in all 3 tables */
select student.name,roll_number,student.cid,course.name, l, t, p, c
from course, credit, student
where student.cid=course.cid and course.cid=credit.cid and course.cid like "EE%" and l=3 and t=1 and p=0 and c=8;
/* EE courses with l-t-p-c = 3-1-0-8 */

/* task 6 */
select name,cid
from student
where upper(name) like "%ATUL%";
select roll_number, credit_status, course.name
from course, student
where lower(course.name) like "%introduction to%" and student.cid=course.cid;
select count(student.name)
from student
where student.cid like "%EE 3%"; 
select cid, name
from course
where cid like "__ _2_M";
select student.name, student.cid, course.name,credit_status
from course, credit, student
where student.cid=course.cid and course.cid=credit.cid and upper(student.name) like "A%TA" and credit_status="Credit";