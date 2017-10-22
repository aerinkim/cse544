
select distinct F3.dest_city as city
from FLIGHTS as F2, FLIGHTS as F3 
where F2.origin_city = 'Seattle WA'
and F2.dest_city != 'Seattle WA'
and F3.origin_city != 'Seattle WA'
and F3.dest_city != 'Seattle WA'
and F2.dest_city = F3.origin_city
and F3.dest_city NOT IN 
       (select distinct F1.dest_city from FLIGHTS as F1
        where F1.origin_city = 'Seattle WA')
;

/*
256
18 sec
Dothan AL
Toledo OH
Peoria IL
Yuma AZ
Bakersfield CA
Daytona Beach FL
Laramie WY
North Bend/Coos Bay OR
Erie PA
Guam TT
Columbus GA
Wichita Falls TX
Hartford CT
Myrtle Beach SC
Arcata/Eureka CA
Kotzebue AK
Medford OR
Providence RI
Green Bay WI
Santa Maria CA

*/