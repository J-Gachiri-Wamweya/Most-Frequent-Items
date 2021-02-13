-- MOST FREQUENT ITEMS

-- From the following table containing a list of dates and items ordered, 
-- write a query to return the most frequent item ordered on each date. 
-- Return multiple items in the case of a tie

create database if not exists practicedb;
use practicedb;

create table if not exists items(
date date,
item varchar(50)
);
/*
insert into items (date, item) 
VALUES 
(CAST('20-01-01' AS date),'orange'), 
(CAST('20-02-01' AS date),'apple'), 
(CAST('20-02-01' AS date),'apple');
*/
with t1 as( 
select date, item, count(*) as fruit from items group by date,item),
t2 as (
select date, item, fruit, rank () over ( partition by date order by fruit desc) fruit_rank from t1)
select date, item from t2 where fruit_rank = 1;
