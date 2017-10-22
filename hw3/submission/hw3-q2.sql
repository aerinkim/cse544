
SELECT distinct x.origin_city as city
from FLIGHTS as x
group by x.origin_city
having  max(isnull(x.actual_time,0)) < 180
order by x.origin_city;


/*
109
5 sec
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/