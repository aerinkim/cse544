
select distinct F4.dest_city as city
from FLIGHTS as F4
where F4.dest_city  NOT IN (
	--cities can be reached by 1 stop
	select distinct F3.dest_city 
	from FLIGHTS as F2, FLIGHTS as F3 
	where F2.origin_city = 'Seattle WA'
	and F2.dest_city != 'Seattle WA'
	and F3.origin_city != 'Seattle WA'
	and F3.dest_city != 'Seattle WA'
	and F2.dest_city = F3.origin_city
	and F3.dest_city NOT IN 
		   (select distinct F1.dest_city from FLIGHTS as F1
			where F1.origin_city = 'Seattle WA')
	)

and F4.dest_city NOT IN (
	--cities can be reached directly 
	select distinct F1.dest_city from FLIGHTS as F1
			where F1.origin_city = 'Seattle WA' )
;



/*
4
1min 50 sec
Devils Lake ND
Hattiesburg/Laurel MS
Seattle WA
St. Augustine FL
*/
