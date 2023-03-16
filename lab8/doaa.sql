-- Active: 1678702434426@@127.0.0.1@3306@week08
use week08;
-- task 5b
-- part(vii)
insert into cs245_student 
values('270123089','Alex','Approved','Credit','alex@protonmail.edu','960-7830');
/* successfully inserted tuple */

-- part(viii)
insert into cs245_marks
VALUES('270123089',67);
/* INSERT command denied to user 'doaa'@'localhost' for table 'cs245_marks'
This error occurs because priveleges are denied to doaa on cs245_marks */

--task 6b
--part(ix)
insert into cs246_student(roll_number,name,reg_status,phone) 
values('270123436','Anjali','Pending','844-5838'); 
/*successfully executed*/

--part(x)
update cs245_student
set audit_credit = 'Audit'
where email = 'semper.tellus.id@google.net';
/*successfully executed*/