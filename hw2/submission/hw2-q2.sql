/*
(10 points) Find all flights from Seattle to Boston on July 15th 2015. Search only for itineraries that have one stop. Both legs of the flight must have occurred on the same day (same day here means the date of the flight). It’s fine if the landing date is different from the flight date, say in the case of an overnight flight and must be with the same carrier. The total flight time (actual_time) of the entire itinerary should be fewer than 7 hours (but notice that actual_time is in minutes). For each itinerary, the query should return the name of the carrier, the first flight number, the origin and destination of that first flight, the flight time, the second flight number, the origin and destination of the second flight, the second flight time, and finally the total flight time. Only count flight times here; do not include any layover time.
Name the output columns name as the name of the carrier, f1_flight_num, f1_origin_city, f1_dest_city, f1_actual_time, f2_flight_num, f2_origin_city, f2_dest_city, f2_actual_time, and actual_time as the total flight time. List the output columns in this order. Put the first 20 rows of your result right after your query as a comment.
[Output relation cardinality: 488 rows]


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



select 
C.name as name, -- f1.fid as f1fid, f2.fid as f2fid,
f1.flight_num as f1_flight_num, f1.origin_city as f1_origin_city, f1.dest_city as f1_dest_city, f1.actual_time as f1_actual_time, 
f2.flight_num as f2_flight_num, f2.origin_city as f2_origin_city, f2.dest_city as f2_dest_city, f2.actual_time as f2_actual_time, 
f1.actual_time + f2.actual_time as actual_time

from FLIGHTS as F1, FLIGHTS as F2, CARRIERS as C, MONTHS as M

where M.month = "July"
and F1.day_of_month = 15
and F1.year = 2015
and F2.day_of_month = 15
and F2.year = 2015
and F1.origin_city = "Seattle WA"
and F2.dest_city = "Boston MA"
and f1.actual_time + f2.actual_time < 420
and F1.dest_city = F2.origin_city
and F1.carrier_id = F2.carrier_id
and F1.carrier_id = C.cid
and F1.month_id = M.mid
and F2.month_id = M.mid;

/*
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           26             Chicago IL      Boston MA     150.0           378.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           186            Chicago IL      Boston MA     137.0           365.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           288            Chicago IL      Boston MA     137.0           365.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           366            Chicago IL      Boston MA     150.0           378.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           1205           Chicago IL      Boston MA     128.0           356.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           1240           Chicago IL      Boston MA     130.0           358.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           1299           Chicago IL      Boston MA     133.0           361.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           1435           Chicago IL      Boston MA     133.0           361.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           1557           Chicago IL      Boston MA     122.0           350.0      
American Airlines Inc.  42             Seattle WA      Chicago IL    228.0           2503           Chicago IL      Boston MA     127.0           355.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           84             New York NY     Boston MA     74.0            396.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           199            New York NY     Boston MA     80.0            402.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           235            New York NY     Boston MA     91.0            413.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           1443           New York NY     Boston MA     80.0            402.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           2118           New York NY     Boston MA                     322.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           2121           New York NY     Boston MA     74.0            396.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           2122           New York NY     Boston MA     65.0            387.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           2126           New York NY     Boston MA     60.0            382.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           2128           New York NY     Boston MA     83.0            405.0      
American Airlines Inc.  44             Seattle WA      New York NY   322.0           2131           New York NY     Boston MA     70.0            392.0      
*/



