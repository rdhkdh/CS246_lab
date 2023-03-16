-- Active: 1678702434426@@127.0.0.1@3306@week08
use week08;
--task 5b
--part(v)
update cs245_marks
set marks = 95
where roll_number = '270101064';
/* error: UPDATE command denied to user 'pbhaduri'@'localhost' for table 'cs245_marks'
This is because  pbhaduri has update privelege on cs245_grade */

--part(vi)
select letter_grade
from cs245_grade
where roll_number='270101064'; -- output= FP

-- part(x)
DELETE from cs246_grade
WHERE roll_number in ('270101004', '270101019', '270101029', '270101039', '270101049', '270101059');
/* DELETE command denied to user 'pbhaduri'@'localhost' for table 'cs246_grade' */

--task 6b
--part(vii)
update cs245_student
set reg_status='Approved', audit_credit = 'Audit'
where email like '%icloud.couk';
/* UPDATE command denied to user 'pbhaduri'@'localhost' for table 'cs245_student' */

--part(viii)
select email, letter_grade
from cs245_grade NATURAL JOIN cs245_student
where name='Benedict Warren';