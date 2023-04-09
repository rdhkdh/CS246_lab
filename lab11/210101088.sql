-- Active: 1675674094978@@127.0.0.1@3306@week11
create database week11;
--task 2
create table emp_boss_small(
    ename char(50),
    bname char(50),
    PRIMARY KEY(ename,bname)
);
create table emp_boss_large(
    ename char(50),
    bname char(50),
    PRIMARY KEY(ename,bname)
);
--task 3
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab11/week-11-emp_small.csv"
into table emp_boss_small
fields terminated by ','
lines terminated by '\n'
IGNORE 1 rows;

load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab11/week-11-emp_large.csv"
into table emp_boss_large
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

--task 4
create procedure sp2(in ename_ip char(50),in data_size char(20))
begin

if (data_size="emp_boss_large")
THEN 
    create table IF NOT EXISTS output_large(emp_name char(50),boss_name char(50));

    insert into output_large
    with recursive boss_rec(ename, bname) as (
    select ename, bname
    from emp_boss_large
    where bname!='NA'
    union
    select boss_rec.ename,emp_boss_large.bname
    from emp_boss_large, boss_rec
    where emp_boss_large.ename = boss_rec.bname and emp_boss_large.bname!='NA' -- exchanged
    )
    select * from boss_rec where boss_rec.ename=ename_ip;

end if;

if (data_size="emp_boss_small")
THEN
    create table if not EXISTS output_small(emp_name char(50),boss_name char(50)) ;
    
    insert into output_small
    with recursive boss_rec(ename, bname) as (
    select ename, bname
    from emp_boss_small
    where bname!='NA' 
    union
    select boss_rec.ename,emp_boss_small.bname
    from emp_boss_small, boss_rec
    where emp_boss_small.ename = boss_rec.bname and emp_boss_small.bname!='NA' -- exchanged
    )
    select * from boss_rec where boss_rec.ename=ename_ip;

end if;

end;

-- task 5
call sp2("Employee 01", "emp_boss_small");
call sp2("Employee 02", "emp_boss_small");
call sp2("Employee 03", "emp_boss_small");
call sp2("Employee 04", "emp_boss_small");
call sp2("Employee 05", "emp_boss_small");
call sp2("Employee 06", "emp_boss_small");
call sp2("Employee 07", "emp_boss_small");
call sp2("Employee 08", "emp_boss_small");
call sp2("Employee 09", "emp_boss_small");
call sp2("Employee 10", "emp_boss_small");
call sp2("Employee 11", "emp_boss_small");
call sp2("Employee 12", "emp_boss_small");
call sp2("Employee 13", "emp_boss_small");

--task 6
call sp2("Employee 01", "emp_boss_large");
call sp2("Employee 02", "emp_boss_large");
call sp2("Employee 03", "emp_boss_large");
call sp2("Employee 04", "emp_boss_large");
call sp2("Employee 05", "emp_boss_large");
call sp2("Employee 06", "emp_boss_large");
call sp2("Employee 07", "emp_boss_large");
call sp2("Employee 08", "emp_boss_large");
call sp2("Employee 09", "emp_boss_large");
call sp2("Employee 10", "emp_boss_large");
call sp2("Employee 11", "emp_boss_large");
call sp2("Employee 12", "emp_boss_large");
call sp2("Employee 13", "emp_boss_large");
call sp2("Employee 14", "emp_boss_large");
call sp2("Employee 15", "emp_boss_large");
call sp2("Employee 16", "emp_boss_large");
call sp2("Employee 17", "emp_boss_large");
call sp2("Employee 18", "emp_boss_large");
call sp2("Employee 19", "emp_boss_large");
call sp2("Employee 20", "emp_boss_large");
call sp2("Employee 21", "emp_boss_large");
call sp2("Employee 22", "emp_boss_large");
call sp2("Employee 23", "emp_boss_large");
call sp2("Employee 24", "emp_boss_large");
call sp2("Employee 25", "emp_boss_large");
call sp2("Employee 26", "emp_boss_large");
call sp2("Employee 27", "emp_boss_large");
call sp2("Employee 28", "emp_boss_large");
call sp2("Employee 29", "emp_boss_large");
call sp2("Employee 30", "emp_boss_large");
call sp2("Employee 31", "emp_boss_large");
call sp2("Employee 32", "emp_boss_large");
call sp2("Employee 33", "emp_boss_large");
call sp2("Employee 34", "emp_boss_large");
call sp2("Employee 35", "emp_boss_large");
call sp2("Employee 36", "emp_boss_large");
call sp2("Employee 37", "emp_boss_large");
call sp2("Employee 38", "emp_boss_large");
call sp2("Employee 39", "emp_boss_large");
call sp2("Employee 40", "emp_boss_large");
call sp2("Employee 41", "emp_boss_large");
call sp2("Employee 42", "emp_boss_large");
call sp2("Employee 43", "emp_boss_large");
call sp2("Employee 44", "emp_boss_large");
call sp2("Employee 45", "emp_boss_large");
call sp2("Employee 46", "emp_boss_large");
call sp2("Employee 47", "emp_boss_large");
call sp2("Employee 48", "emp_boss_large");
call sp2("Employee 49", "emp_boss_large");