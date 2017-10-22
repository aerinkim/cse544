/* without subquery
select distinct c.name as carrier
from dbo.CARRIERS as c, dbo.FLIGHTS as f
where
f.origin_city = 'Seattle WA'
and f.dest_city = 'San Francisco CA'
and c.cid = f.carrier_id
;*/

select distinct c.name as carrier
from dbo.CARRIERS as c
where c.cid In (select f.carrier_id 
from dbo.FLIGHTS as f
where
f.origin_city = 'Seattle WA'
and f.dest_city = 'San Francisco CA'
);

/*
4
2sec
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/