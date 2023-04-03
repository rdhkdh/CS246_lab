-- Active: 1675674094978@@127.0.0.1@3306@week10
create database week10;

--task 2
create table student18(
    name char(100),
    roll_number char(10) primary key,
    cpi float default 0.0
);
create table course18(
    semester int,
    cid char(7) primary key,
    name char(100),
    l int,
    t int,
    p int,
    c int
);
create table grade18(
    roll_number char(10),
    cid char(7),
    letter_grade char(2), 
    primary key(roll_number,cid)
);
create table curriculum(
    dept char(4),
    number int,
    cid char(7)
);
create table grade_point(
    letter_grade char(2) PRIMARY KEY,
    value int
);
create table trigger_log(
    my_action char(10),
    roll_number char(10),
    semester int,
    SPI numeric(4,2),
    CPI numeric(4,2),
    constraint check( my_action in ('INSERT','UPDATE','DELETE'))
); --ignored foreign key part as semester in course18 is not primary key
create table transcript(
    roll_number char(10),
    semester int,
    SPI numeric(4,2),
    CPI numeric(4,2)
);
create table u_grade18(
    roll_number char(10),
    cid char(7),
    letter_grade char(2), 
    primary key(roll_number,cid)
);

--task 3
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab10/student18.csv"
into table student18
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab10/course18.csv"
into table course18
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab10/curriculum.csv"
into table curriculum
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab10/u_grade18.csv"
into table u_grade18
fields terminated by ','
lines terminated by '\n';
insert into grade_point(letter_grade,value)
values('AS',10);
insert into grade_point(letter_grade,value)
values('AA',10);
insert into grade_point(letter_grade,value)
values('AB',9);
insert into grade_point(letter_grade,value)
values('BB',8);
insert into grade_point(letter_grade,value)
values('BC',7);
insert into grade_point(letter_grade,value)
values('CC',6);
insert into grade_point(letter_grade,value)
values('CD',5);
insert into grade_point(letter_grade,value)
values('DD',4);
insert into grade_point(letter_grade,value)
values('FP',0);
insert into grade_point(letter_grade,value)
values('FA',0);
insert into grade_point(letter_grade,value)
values('I',0);
insert into grade_point(letter_grade,value)
values('X',0);
insert into grade_point(letter_grade,value)
values('PP',0);
insert into grade_point(letter_grade,value)
values('NP',0);
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab10/transcript.csv"
into table transcript
fields terminated by ','
lines terminated by '\n';

--task 4
--a(i)
drop trigger 4a;
create trigger 4a 
before insert on grade18
for each row
begin
    IF new.letter_grade not in ('AS', 'AA', 'AB', 'BB', 'BC', 'CC', 'CD', 'DD', 'FP', 'FA', 'PP', 'NP', 'I', 'X')
    THEN SIGNAL SQLSTATE '50001' set MESSAGE_TEXT='Letter grade trying to be inserted is not valid.';
    END IF;
end; 
--a(ii) 
drop trigger 4a_ii_i;
create trigger 4a_ii_i 
after insert on grade18
for each row
begin
    -- update transcript
    -- set SPI= SPI+ (SELECT SUM(c * value) AS total_grade_points 
    --     FROM grade18 Natural JOIN course18 natural join grade_point 
    --     WHERE transcript.roll_number = new.roll_number and semester=1);
    -- set SPI=SPI/ (select sum(c) as tot_sem_credits 
    -- from course18 natural join grade18
    -- where course18.cid=new.cid and course18.semester=grade18.semester);

        -- a(ii) (i)
        SET @semester = (SELECT semester
        FROM course18
        WHERE cid = NEW.cid );
        

        update transcript --setting spi 
        SET SPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester = @semester AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = @semester ;

        update transcript --setting cpi for sem 1
        SET CPI = 0 + (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=1 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 1 ;

        update transcript --setting cpi for sem 2
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=2 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 2 ;

        update transcript --setting cpi for sem 3
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=3 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 3 ;

        update transcript --setting cpi for sem 4
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=4 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 4 ;

        update transcript --setting cpi for sem 5
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=5 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 5 ;

        update transcript --setting cpi for sem 6
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=6 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 6 ;

        update transcript --setting cpi for sem 7
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=7 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 7 ;

        update transcript --setting cpi for sem 8
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=8 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 8 ;

        update transcript set SPI=0.0 where SPI is null;
        update transcript set CPI=0.0 where CPI is null;

        -- a(ii) (ii)
        SET @SPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester = @semester AND roll_number = NEW.roll_number and c!=0) ;

        SET @CPI = (SELECT (sum( value*c )/sum(c))
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <= @semester AND roll_number = NEW.roll_number and c!=0) ;

        INSERT INTO trigger_log VALUES("INSERT" , NEW.roll_number, @semester ,@SPI , @CPI );

end;


--task 4b (i)
drop trigger 4b_i;
create trigger 4b_i
before update on grade18
for each row
begin
    IF new.letter_grade not in ('AS', 'AA', 'AB', 'BB', 'BC', 'CC', 'CD', 'DD', 'FP', 'FA', 'PP', 'NP', 'I', 'X')
    THEN SIGNAL SQLSTATE '50001' set MESSAGE_TEXT='Letter grade trying to be updated is not valid.';
    END IF;
end; 

--task 4b(ii)
drop trigger 4b_ii;
create trigger 4b_ii
after update on grade18
for each row
begin

        -- b(ii) (i)
        SET @semester = (SELECT semester
        FROM course18
        WHERE cid = NEW.cid );

        update transcript --setting spi 
        SET SPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester = @semester AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = @semester ;

        update transcript --setting cpi for sem 1
        SET CPI = 0 + (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=1 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 1 ;

        update transcript --setting cpi for sem 2
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=2 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 2 ;

        update transcript --setting cpi for sem 3
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=3 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 3 ;

        update transcript --setting cpi for sem 4
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=4 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 4 ;

        update transcript --setting cpi for sem 5
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=5 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 5 ;

        update transcript --setting cpi for sem 6
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=6 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 6 ;

        update transcript --setting cpi for sem 7
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=7 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 7 ;

        update transcript --setting cpi for sem 8
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=8 AND roll_number = NEW.roll_number and c!=0)
        WHERE roll_number = NEW.roll_number AND semester = 8 ;

        update transcript set SPI=0.0 where SPI is null;
        update transcript set CPI=0.0 where CPI is null;

        -- b(ii) (ii)
        SET @SPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester = @semester AND roll_number = NEW.roll_number and c!=0) ;

        SET @CPI = (SELECT (sum( value*c )/sum(c))
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <= @semester AND roll_number = NEW.roll_number and c!=0) ;

        INSERT INTO trigger_log VALUES("UPDATE" , NEW.roll_number, @semester ,@SPI , @CPI );

end;

-- task 4c
drop trigger 4c_i;
create trigger 4c_i
after delete on grade18
for each row
begin

        -- c(i) (i)
        SET @semester = (SELECT semester
        FROM course18
        WHERE cid = OLD.cid );

        update transcript --setting spi 
        SET SPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester = @semester AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = @semester ;

        update transcript --setting cpi for sem 1
        SET CPI = 0 + (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=1 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 1 ;

        update transcript --setting cpi for sem 2
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=2 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 2 ;

        update transcript --setting cpi for sem 3
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=3 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 3 ;

        update transcript --setting cpi for sem 4
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=4 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 4 ;

        update transcript --setting cpi for sem 5
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=5 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 5 ;

        update transcript --setting cpi for sem 6
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=6 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 6 ;

        update transcript --setting cpi for sem 7
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=7 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 7 ;

        update transcript --setting cpi for sem 8
        SET CPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <=8 AND roll_number = OLD.roll_number and c!=0)
        WHERE roll_number = OLD.roll_number AND semester = 8 ;

        update transcript set SPI=0.0 where SPI is null;
        update transcript set CPI=0.0 where CPI is null;

        -- c(i) (ii)
        SET @SPI = (SELECT sum( value*c )/sum(c)
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester = @semester AND roll_number = OLD.roll_number and c!=0) ;

        SET @CPI = (SELECT (sum( value*c )/sum(c))
        FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
        WHERE semester <= @semester AND roll_number = OLD.roll_number and c!=0) ;

        INSERT INTO trigger_log VALUES("DELETE" , OLD.roll_number, @semester ,@SPI , @CPI );

end;

-- task 5
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab10/grade18.csv"
into table grade18
fields terminated by ','
lines terminated by '\n';

--task 6
update 
grade18 join u_grade18 on grade18.roll_number=u_grade18.roll_number and grade18.cid=u_grade18.cid
set grade18.letter_grade= u_grade18.letter_grade;

--task 7
DELETE from grade18;