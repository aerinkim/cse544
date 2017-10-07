-- Making sure SQL Lite shows us the data in a nicer format

.header on
.mode column
.nullvalue NULL


--Create a table Edges(Source, Destination) where both Source and Destination are integers.

create table Edges
  (Source int,
   Destination int);


--Insert the tuples (10,5), (6,25), (1,3), and (4,4)

insert into Edges  values (10,5);
insert into Edges  values (6,25);
insert into Edges  values (1,3);
insert into Edges  values (4,4);


--Write a SQL statement that returns all tuples.

select * from Edges;


--Write a SQL statement that returns only column Source for all tuples.

select Source from Edges;


--Write a SQL statement that returns all tuples where Source > Destination.

select * from Edges where Source > Destination;


--Now insert the tuple ('-1','2000'). Do you get an error? Why?

insert into Edges  values ('-1','2000');

/*
I didn't get error.
Why?
SQLite uses dynamic typing. It does not enforce data type constraints. 
Data of any type can (usually) be inserted into any column. 
Every column is able to hold an arbitrary length string. (There is one exception: Columns of type INTEGER PRIMARY KEY may only hold a 64-bit signed integer.)
*/