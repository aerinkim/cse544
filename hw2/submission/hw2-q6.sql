/*
(10 points) Find the average price of tickets between Seattle and New York, NY in the entire month. Show the average price for each airline separately.
Name the output columns carrier and average_price, in that order.
[Output relation cardinality: 3]


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



select C.name as carrier , avg(price) as average_price

from FLIGHTS as F, CARRIERS as C 

WHERE 
C.cid = F.carrier_id and
(
(F.origin_city = "Seattle WA" and F.dest_city = "New York NY" )
or 
(F.dest_city = "Seattle WA" and F.origin_city = "New York NY")
)

group by C.cid

;



