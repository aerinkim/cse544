/*
(10 points) Find all airlines that had more than 0.5 percent of their flights out of Seattle be canceled. Return the name of the airline and the percentage of canceled flight out of Seattle. Order the results by the percentage of canceled flights in ascending order.
Name the output columns name and percent, in that order.
[Output relation cardinality: 6 rows]

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



select DISTINCT C.name as name, avg(CAST(F.canceled AS FLOAT)) as percent

from FLIGHTS as F, CARRIERS as C 

WHERE 
C.cid = F.carrier_id and
F.origin_city = "Seattle WA" 

group by C.cid

having percent > 0.005

order by percent asc
;



