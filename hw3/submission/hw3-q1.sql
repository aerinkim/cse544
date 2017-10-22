/*
<attempt 1>
select F1.origin_city as origin_city, F1.dest_city,  max(F1.actual_time) as time
from dbo.FLIGHTS as F1 
group by F1.origin_city, F1.dest_city
order by F1.origin_city, F1.dest_city;

--select origin_city, max(isnull(actual_time,0)) as max_time 
--from dbo.flights group by origin_city;
*/


SELECT distinct x.origin_city as origin_city, 
y.dest_city as dest_city, 
x.max_time as time
from
(
	SELECT f.origin_city, max(actual_time) as max_time from
	dbo.flights as f
	group by f.origin_city
) x
join 
(select f2.origin_city as orig, f2.dest_city, f2.actual_time
 from dbo.flights as f2) y
on x.origin_city = y.orig and x.max_time = y.actual_time
order by origin_city, dest_city;


/*
329 rows
11 sec
Aberdeen SD	Minneapolis MN	106
Abilene TX	Dallas/Fort Worth TX	111
Adak Island AK	Anchorage AK	471.37
Aguadilla PR	New York NY	368.76
Akron OH	Atlanta GA	408.69
Albany GA	Atlanta GA	243.45
Albany NY	Atlanta GA	390.31
Albuquerque NM	Houston TX	492.81
Alexandria LA	Atlanta GA	391.05
Allentown/Bethlehem/Easton PA	Atlanta GA	456.95
Alpena MI	Detroit MI	80
Amarillo TX	Houston TX	390.73
Anchorage AK	Barrow AK	490.01
Appleton WI	Atlanta GA	405.07
Arcata/Eureka CA	San Francisco CA	476.89
Asheville NC	Chicago IL	279.81
Ashland WV	Cincinnati OH	84
Aspen CO	Los Angeles CA	304.59
Atlanta GA	Honolulu HI	649
Atlantic City NJ	Fort Lauderdale FL	212
*/


