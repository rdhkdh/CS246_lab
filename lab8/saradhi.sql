-- Active: 1678701126366@@127.0.0.1@3306@week08
use week08;
-- task 5b
-- part(iii)
delete from cs246_grade
where roll_number='270101005'; 
/* error: DELETE command denied to user 'saradhi'@'localhost' for table 'cs246_grade'
This error occurs because delete privelege is not granted to saradhi. */

--part(iv)
update cs246_grade
set letter_grade = 'BC'
where roll_number = '270101005';
/* updated successfully */

--part(ix)
update cs245_grade
set letter_grade = 'DD'
where roll_number = '270101053';
/* UPDATE command denied to user 'saradhi'@'localhost' for table 'cs245_grade' */

--task 6b
--part(v)
update cs246_student
set roll_number = '290101051'
where roll_number = '270101051';
/* UPDATE command denied to user 'saradhi'@'localhost' for table 'cs246_student' */

--part(vi)
select email, marks
from cs246_student NATURAL JOIN cs246_marks
WHERE name='Garrison Donovan';
/* SELECT command denied to user 'saradhi'@'localhost' for table 'cs246_marks' */

-- task7a
create view task7a as
(select roll_number, name, email, letter_grade
from cs246_grade NATURAL JOIN cs246_student);
/* CREATE VIEW command denied to user 'saradhi'@'localhost' for table 'task7a' */

--task7d
--part(i)
delete from task7a --deleting from view
where email='quisque.porttitor@google.couk';
/* DELETE command denied to user 'saradhi'@'localhost' for table 'task7a' */