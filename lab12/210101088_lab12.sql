-- Active: 1675674094978@@127.0.0.1@3306@week12
create database week12;
use week12;
create table student(
    name char(50) primary key,
    IQ int,
    gender char(1)
);
create table speak(
    name char(50),
    language char(50),
    primary KEY(name,language)
);
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab12/student.csv"
into table student
fields terminated by ','
lines terminated by '\n';
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab12/speaks.csv"
into table speak
fields terminated by ','
lines terminated by '\n';

-- task 4a
create view counted AS
(
    select language,count(name) as no_of_speakers
    from speak
    group by language
);
select language
from counted 
where no_of_speakers = (select min(no_of_speakers) as min_val
from counted);

-- task 4b
create view lang_rank as
select language,no_of_speakers, rank() over (order by (no_of_speakers)) as lang_rank
from counted;
select language
from lang_rank
where lang_rank=1;

-- task 5a
create view student_lang_count
as (
    select name,count(language) as no_of_languages
    from speak
    group by name 
);
select name
from student_lang_count 
where no_of_languages = (select max(no_of_languages) as max_stud
from student_lang_count);

-- task 5b
create view stud_rank as
select name,no_of_languages, rank() over (order by (no_of_languages) desc) as stud_rank
from student_lang_count;
select name
from stud_rank
where stud_rank=1;

-- task 6a
create view iq_by_gender as
select gender,avg(IQ) as avg_iq
from student
group by gender;
select gender from iq_by_gender
where avg_iq = (select max(avg_iq) from iq_by_gender);

-- task 6b
create view gender_iq_rank as
select gender, rank() over (order by(avg_iq) desc) as iq_rank
from iq_by_gender;
select gender
from gender_iq_rank
where iq_rank=1;

--task 7
create view jap_speakers as
select name, IQ
from student NATURAL JOIN speak
where language='Japanese';
create view iq_rank_jap as
select name,IQ, dense_rank() over (order by(IQ) desc) as IQ_rank
from jap_speakers;
select name from iq_rank_jap where IQ_rank in (1,2);

-- task 8
create view iq_rank_genderwise as
select name, rank() over(partition by gender order by(IQ) desc) as iq_rank_genderwise
from student;
select name from iq_rank_genderwise
where iq_rank_genderwise=1;