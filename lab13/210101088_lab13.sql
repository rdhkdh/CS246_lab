-- Active: 1675674094978@@127.0.0.1@3306@week13
create database week13;
use week13;
create table location(
    location_id int PRIMARY KEY,
    city char(10),
    state char(2),
    country char(20)
);
create table product(
    product_id int PRIMARY KEY,
    product_name char(10),
    category char(2),
    price int
);
create table sale(
    product_id int,
    time_id int,
    location_id int,
    sales int,
    PRIMARY KEY(product_id, time_id, location_id)
);
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab13/location.csv"
into table location
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab13/product.csv"
into table product
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;
load data local infile "/home/ridhiman/Desktop/rkd_iitg/CS246_lab/lab13/sale.csv"
into table sale
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

-- task 4a
create table year_state_01(
    year varchar(5),
    WI int,
    CA int,
    total int
);
-- i,ii.iii
insert into year_state_01
values('1995',
(select sum(sales)
from sale natural join location
where state='WI' and time_id=1995),
(select sum(sales)
from sale natural join location
where state='CA' and time_id=1995),
(select sum(sales)
from sale natural join location
where state in ('WI','CA') and time_id=1995)
);
-- iv,v,vi
insert into year_state_01
values('1996',
(select sum(sales)
from sale natural join location
where state='WI' and time_id=1996),
(select sum(sales)
from sale natural join location
where state='CA' and time_id=1996),
(select sum(sales)
from sale natural join location
where state in ('WI','CA') and time_id=1996)
);
-- vii,viii,ix
insert into year_state_01
values('1997',
(select sum(sales)
from sale natural join location
where state='WI' and time_id=1997),
(select sum(sales)
from sale natural join location
where state='CA' and time_id=1997),
(select sum(sales)
from sale natural join location
where state in ('WI','CA') and time_id=1997)
);
-- x,xi,xii
insert into year_state_01
values('Total',
(select sum(sales)
from sale natural join location
where state='WI' ),
(select sum(sales)
from sale natural join location
where state='CA' ),
(select sum(sales)
from sale natural join location
where state in ('WI','CA') )
);

-- task 4b
-- i
create view WI as
select time_id,sum(sales) as WI 
from sale natural join location
where state='WI'
group by time_id;
create view CA as
select time_id,sum(sales) as CA 
from sale natural join location
where state='CA'
group by time_id;
create table year_state_02_01 as
(select *
from WI natural join CA);

-- ii
create table year_state_02_02 as
(select time_id,(WI+CA) as Total 
from year_state_02_01);

-- iii
create table year_state_02_03 as
(select sum(WI) as WI,sum(CA) as CA
FROM year_state_02_01);

-- iv
create table year_state_02_04 as
(select sum(Total) from year_state_02_02);

-- task 4c
create table year_state_03 as
(select Sum(case state 
when 'WI' then sales else 0 end) as WI, 
Sum(case state 
when 'CA' then sales else 0 end) as CA, Sum(case state 
when 'WI' then sales else 0 end)+Sum(case state 
when 'CA' then sales else 0 end) as total
from sale natural join location
group by time_id
union
select Sum(case state 
when 'WI' then sales else 0 end) as WI, 
Sum(case state 
when 'CA' then sales else 0 end) as CA, Sum(case state 
when 'WI' then sales else 0 end)+Sum(case state 
when 'CA' then sales else 0 end) as total
from sale natural join location
);

-- task 4d
create table year_state_04 as
(select Sum(case state 
when 'WI' then sales else 0 end) as WI, 
Sum(case state 
when 'CA' then sales else 0 end) as CA, Sum(case state 
when 'WI' then sales else 0 end)+Sum(case state 
when 'CA' then sales else 0 end) as total
from sale natural join location
group by time_id with rollup
);