-- Active: 1675674094978@@127.0.0.1@3306@week09
CREATE DATABASE week09;
create table student18(
    name char(100),
    roll_number char(10) PRIMARY KEY
);
create table course18(
    semester int,
    cid char(7) PRIMARY KEY,
    name char(100),
    l int,
    t int,
    p int,
    c int
);
create table grade18(
    roll_number char(10),
    cid char(7),
    letter_grade CHAR(2),
    PRIMARY KEY(roll_number,cid)
);
create table curriculum(
    dept char(3),
    number int,
    cid char(7)
);

-- task3
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab9/student18.csv"
into table student18
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab9/course18.csv"
into table course18
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab9/grade18.csv"
into table grade18
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab9/curriculum.csv"
into table curriculum
fields terminated by ','
lines terminated by '\n';

--task4 in python file