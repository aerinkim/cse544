.mode csv 
select * from MyRestaurants;

.mode list
.separator "|" 
select * from MyRestaurants;

.mode column
.width 15 15 15 15 15 
select * from MyRestaurants;

.headers off 
select * from MyRestaurants;