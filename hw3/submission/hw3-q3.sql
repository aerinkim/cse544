
Select y.orig as origin_city, 
CAST(x.num AS float)/y.total as percentage

from
	 (Select f1.origin_city, Count(*) as num 
	  from dbo.FLIGHTS as f1
	  where isnull(f1.actual_time, 181) < 180 -- instead of having! 
	  group by f1.origin_city
	  ) x
	  right outer join
	 (Select f2.origin_city as orig, ISNULL(count(*),0) as total 
	  from dbo.flights as f2
	  group by f2.origin_city) y
	 on x.origin_city = y.orig 
order by percentage
;

/*
327
12 sec
Guam TT	NULL
Pago Pago TT	NULL
Aguadilla PR	0.286792452830189
Anchorage AK	0.316562778272484
San Juan PR	0.335439168534746
Charlotte Amalie VI	0.392700729927007
Ponce PR	0.403225806451613
Fairbanks AK	0.495391705069124
Kahului HI	0.533411833971151
Honolulu HI	0.545336955115768
San Francisco CA	0.552237084870849
Los Angeles CA	0.554127883447997
Seattle WA	0.574109328256731
New York NY	0.605324373223055
Long Beach CA	0.61719979024646
Kona HI	0.629527991218441
Newark NJ	0.633675652545999
Plattsburgh NY	0.64
Las Vegas NV	0.644710061799208
Christiansted VI	0.646666666666667
*/
