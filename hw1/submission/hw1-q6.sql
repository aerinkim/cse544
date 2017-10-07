select * from MyRestaurants
where LastVisit <= date('now', '-3 month') and LikeOrNot = 1; 
