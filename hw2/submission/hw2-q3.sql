/*
(10 points) Find the day of the week with the longest average arrival delay. Return the name of the day and the average delay.
Name the output columns day_of_week and delay, in that order. (Hint: consider using LIMIT. Look up what it does!)
[Output relation cardinality: 1 row]


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



select W.day_of_week as day_of_week, avg(F.arrival_delay) as delay

from FLIGHTS as F, WEEKDAYS as W

WHERE F.day_of_week_id = W.did

group by F.day_of_week_id

order by avg(F.arrival_delay) desc

limit 1 ;

