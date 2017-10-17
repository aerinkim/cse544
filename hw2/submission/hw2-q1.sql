/*
(10 points) List the distinct flight numbers of all flights from Seattle 
to Boston by Alaska Airlines Inc. on Mondays. 

Name the output column flight_num.
[Hint: Output relation cardinality: 3 rows]

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

select DISTINCT F.flight_num as flight_num 
from FLIGHTS as F, CARRIERS as C, WEEKDAYS as W
where F.origin_city = "Seattle WA"
and F.dest_city = "Boston MA"
and C.name = "Alaska Airlines Inc."
 
and W.day_of_week = "Monday"
and F.carrier_id = C.cid
and F.day_of_week_id = W.did;
 
