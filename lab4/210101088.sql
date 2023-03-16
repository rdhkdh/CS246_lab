/* TASK 1 */
show databases;
create database week04;
show databases;
use week04;
/* TASK 2 */
create table hss_table01(
sno int,
roll_number int,
sname char(50),
cid char(10),
cname char(60)
);
describe hss_table01; /*describing table*/
source task2b.sql
select * from hss_table01 limit 5; /* displaying the first 5 records stored */
/* TASK 3 */
create table hss_table02(
sno int,
roll_number int,
sname char(50),
cid char(10),
cname char(60),
primary key (cname)
);
describe hss_table02; /*describing table*/
source task3b.sql
/* 
The following error is encountered:
ERROR 1062 (23000): Duplicate entry 'Economics of Uncertainty and Information' for key 'hss_table02.PRIMARY'
Query OK, 1 row affected (0.09 sec)
ERROR 1062 (23000): Duplicate entry 'History of Contemporary India' for key 'hss_table02.PRIMARY'
Query OK, 1 row affected (0.15 sec)
Query OK, 1 row affected (0.22 sec)
Query OK, 1 row affected (0.09 sec)
*/
/* TASK 4 */
create table hss_table03(
sno int,
roll_number int,
sname char(50),
cid char(10),
cname char(60),
primary key (roll_number,cid)
);
describe hss_table03;
source task4b.sql
/*
Observations:
No error in this task.
*/
/* TASK 5 */
create table hss_table04(
sno int,
roll_number int,
sname char(50),
cid char(10),
cname char(60)
);
describe hss_table04;
ALTER TABLE hss_table04
ADD PRIMARY KEY (sno);
/* No error observed:
Query OK, 0 rows affected (2.04 sec)
Records: 0  Duplicates: 0  Warnings: 0
*/
ALTER TABLE hss_table04
ADD PRIMARY KEY (roll_number);
/* Error observed:
ERROR 1068 (42000): Multiple primary key defined
*/
/* TASK 6 */
create table hss_course01(
cid char(10),
cname char(60),
primary key (cid)
);
describe hss_course01;
create table hss_table05(
sno int,
roll_number int,
sname char(50),
cid char(10),
cname char(60),
primary key (roll_number),
foreign key (cid) references hss_course01(cid)
);
describe hss_table05;
source task6b.sql
/* Observations:
In task6b.sql, first we
inserted hss_courses.csv into hss_course01: no error 
inserted hss_electives.csv into hss_table05: no error
inserted violate_fk.csv into hss_table05: gives error, 
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 

*/
/* TASK 7 */
create table hss_course02(
cid char(10),
cname char(60),
primary key (cname)
);
describe hss_course02;
create table hss_table06(
sno int,
roll_number int,
sname char(50),
cid char(10),
cname char(60),
primary key (roll_number),
foreign key (cid) references hss_course02(cid)
);
/* Observations:
ERROR 1822 (HY000): Failed to add the foreign key constraint. 
Missing index for constraint 'hss_table06_ibfk_1' in the referenced table 'hss_course02'
This is because foreign key reference should be on primary key of database from which it is referenced.
*/
/* TASK 8 */
create table hss_course03(
cid char(10),
cname char(60)
);
describe hss_course03;
create table hss_table07(
sno int,
roll_number int,
sname char(50),
cid char(10),
cname char(60),
primary key (roll_number),
foreign key (cid) references hss_course03(cid)
);
/* Observations:
ERROR 1822 (HY000): Failed to add the foreign key constraint. 
Missing index for constraint 'hss_table07_ibfk_1' in the referenced table 'hss_course03'
This is because foreign key reference should be on primary key of database from which it is referenced, and there is no primary key here.
*/