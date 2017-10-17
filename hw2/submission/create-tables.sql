
/*

IMPORTING THE FLIGHTS DATABASE (20 points)

Put all the code for this part (four create table statements and four .import statements) 

Flights.carrier_id references Carrier.cid
Flights.month_id references Months.mid
Flights.day_of_week_id references Weekdays.did
*/



PRAGMA foreign_keys=ON;



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


.mode csv

.import flights-small.csv FLIGHTS
.import carriers.csv CARRIERS
.import months.csv MONTHS
.import weekdays.csv WEEKDAYS



