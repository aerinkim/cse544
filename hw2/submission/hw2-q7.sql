/*
(10 points) Find the total capacity of all direct flights that fly between Seattle and San Francisco, CA on July 10th, 2015.
Name the output column capacity.
[Output relation cardinality: 1]


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



select sum(F.capacity) as capacity

from FLIGHTS as F 

WHERE 

F.month_id= 7
and F.year= 2015
and F.day_of_month=10

and (
(F.origin_city = "San Francisco CA" and F.dest_city = "Seattle WA" )
or 
(F.dest_city = "Seattle WA" and F.origin_city = "San Francisco CA")
)

;



