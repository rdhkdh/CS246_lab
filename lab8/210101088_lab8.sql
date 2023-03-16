-- Active: 1675674094978@@127.0.0.1@3306@week08
-- task 1
create database week08;
use week08;
-- task 2
create table cs245_student(
    roll_number char(9) PRIMARY KEY,
    name char(100),
    reg_status char(20),
    audit_credit char(10),
    email char(50),
    phone char(8)
);
create table cs245_marks(
    roll_number char(9) PRIMARY KEY,
    marks int,
    Foreign Key (roll_number) REFERENCES cs245_student(roll_number)
);
create table cs245_grade(
    roll_number char(9) PRIMARY KEY,
    letter_grade char(2),
    Foreign Key (roll_number) REFERENCES cs245_student(roll_number)
);
create table cs246_student(
    roll_number char(9) PRIMARY KEY,
    name char(100),
    reg_status char(20),
    audit_credit char(10),
    email char(50),
    phone char(8)
);
create table cs246_marks(
    roll_number char(9) PRIMARY KEY,
    marks int,
    Foreign Key (roll_number) REFERENCES cs246_student(roll_number)
);
create table cs246_grade(
    roll_number char(9) PRIMARY KEY,
    letter_grade char(2),
    Foreign Key (roll_number) REFERENCES cs246_student(roll_number)
);

-- task 3
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab8/cs245_student.csv"
into table cs245_student
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab8/cs245_marks.csv"
into table cs245_marks
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab8/cs245_grade.csv"
into table cs245_grade
fields terminated by ','
lines terminated by '\n';

load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab8/cs246_student.csv"
into table cs246_student
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab8/cs246_marks.csv"
into table cs246_marks
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246lab/lab8/cs246_grade.csv"
into table cs246_grade
fields terminated by ','
lines terminated by '\n';

--task 4
CREATE user headTA IDENTIFIED BY 'headTA123';
CREATE user saradhi IDENTIFIED BY 'saradhi123';
CREATE user pbhaduri IDENTIFIED BY 'pbhaduri123';
CREATE user doaa IDENTIFIED BY 'doaa123';

-- task 5a
grant select,insert,update
on cs245_marks 
to headTA;
grant select,insert,update
on cs246_marks 
to headTA;
grant select,Update
on cs246_grade
to saradhi;
grant select,Update
on cs245_grade
to pbhaduri;
grant select,insert,update,delete
on cs245_student 
to doaa;
grant select,insert,update,delete
on cs246_student
to doaa;

-- task 5b in separate file

-- task 6a
grant select(roll_number,name,email) on cs245_student to headTA;
grant select(roll_number,name,email) on cs246_student to headTA;
grant select(roll_number,name,email) on cs245_student to pbhaduri;
grant select(roll_number,name,email) on cs246_student to saradhi;
grant select(roll_number, name, reg_status,  audit_credit),
insert(roll_number, name, reg_status,  audit_credit),
update(roll_number, name, reg_status,  audit_credit) 
on cs246_student to doaa;

--task 6b in respective files

--task7 in respective files

--task8a
GRANT GRANT OPTION on cs246_grade to saradhi; /*successfully executed*/
-- 8b
GRANT SELECT on cs246_grade to headTA; /*successfully executed*/
-- 8c
SELECT roll_number, name, email, marks, letter_grade 
from cs246_student NATURAL JOIN cs246_grade NATURAL join cs246_marks;
-- 206 rows ,successfully executed 

--task9a
revoke select 
on cs246_grade 
from headTA; /*successfully executed*/

--task 9b
SELECT roll_number, name, email, marks, letter_grade
from cs246_grade; /* SELECT command denied to user 'headTA'@'localhost' for table 'cs246_grade'*/

--task 9c
revoke select(roll_number, name, reg_status, audit_credit),
insert(roll_number, name, reg_status, audit_credit), 
update(roll_number, name, reg_status, audit_credit)  
on cs246_student
from public; /* GRANT command denied to user 'doaa'@'localhost' for table 'cs246_student' */

--task 9d
revoke select(roll_number,name,email) on cs245_student from headTA;
revoke select(roll_number,name,email) on cs246_student from headTA;
revoke select(roll_number,name,email) on cs245_student from pbhaduri;
revoke select(roll_number,name,email) on cs246_student from saradhi;
revoke select(roll_number, name, reg_status,  audit_credit),
insert(roll_number, name, reg_status,  audit_credit),
update(roll_number, name, reg_status,  audit_credit) 
on cs246_student from doaa;

--task 9e
revoke select,insert,update
on cs245_marks 
from headTA;
revoke select,insert,update
on cs246_marks 
from headTA;
revoke select,Update
on cs246_grade
from saradhi;
revoke select,Update
on cs245_grade
from pbhaduri;
revoke select,insert,update,delete
on cs245_student 
from doaa;
revoke select,insert,update,delete
on cs246_student
from doaa;

-- task10 a,b,c,d
DROP USER headTA;
DROP USER saradhi;
DROP USER pbhaduri;
DROP USER doaa;

-- task 10e
use mysql;
select user from user;
-- Output is the list of users, not having headTA, saradhi, pbhaduri, doaa

