-- Active: 1678702434426@@127.0.0.1@3306@week08
use week08;
-- task 5b
-- part(i)
select marks 
from cs246_marks
where roll_number='270123065'; -- 68
-- part(ii)
delete from cs245_marks
where roll_number='210123065'; 
/* error: DELETE command denied to user 'headTA'@'localhost' for table 'cs245_marks'
This error occurs because delete privelege is not granted to headTA. */

--task 6b
--part(i)
select email, phone
from cs245_student
where name='Craig Salazar';
/* SELECT command denied to user 'headTA'@'localhost' for column 'phone' in table 'cs245_student' */

--part(ii)
select roll_number, email
from cs245_student
where name='Lionel Battle'; --executed successfully

--part(iii)
delete from cs246_student
where name='Jenette Parks';
/* DELETE command denied to user 'headTA'@'localhost' for table 'cs246_student' */

--part(iv)
update cs246_student
set email = 'jparks@aol.ca'
where name = 'Jenette Parks';
/* UPDATE command denied to user 'headTA'@'localhost' for table 'cs246_student' */

--task7b
create view task7b as
(select roll_number, name, email, marks
from cs245_grade NATURAL JOIN cs245_student);
/* CREATE VIEW command denied to user 'headTA'@'localhost' for table 'task7b' */

--task7c
create view task7c as
(select roll_number, name, email, letter_grade
from cs245_grade NATURAL JOIN cs245_student);
/* CREATE VIEW command denied to user 'headTA'@'localhost' for table 'task7c' */

-- task 7d
--part(ii)
update task7c --updating in view
set letter_grade = 'AA'
where name = 'Zenaida Fleming';
/* UPDATE command denied to user 'headTA'@'localhost' for table 'task7c' */