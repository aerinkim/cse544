/*
(10 points) Find the names of all airlines that ever flew more than 1000 flights in one day (i.e., a specific day/month/year, but not any 24-hour period). Return only the names of the airlines. Do not return any duplicates (i.e., airlines with the exact same name).
Name the output column name.
[Output relation cardinality: 11 rows]


create table FLIGHTS (fid int PRIMARY KEY, year int, month_id int, day_of_month int, 
         day_of_week_id int, carrier_id varchar(3), flight_num int,
         origin_city varchar(34), origin_state varchar(47), 
         dest_city varchar(34), dest_state varchar(46), 
         departure_delay double, taxi_out double, arrival_delay double,
         canceled int, actual_time double, distance double, capacity int, 
         price double);

create table CARRIERS (cid varchar(7) PRIMARY KEY, name varchar(83));

create table MONTHS (mid int PRIMARY KEY, month varchar(9));

create table WEEKDAYS (did int PRIMARY KEY, day_of_week varchar(9));


Flights.carrier_id references Carrier.cid
Flights.month_id references Months.mid
Flights.day_of_week_id references Weekdays.did

*/


.header on
.mode column
.nullvalue NULL
.width 100





select DISTINCT C.name as name

from FLIGHTS as F, CARRIERS as C 

WHERE 
C.cid = F.carrier_id

group by F.year, F.month_id, F.day_of_month, C.cid

having count(fid)>1000;

