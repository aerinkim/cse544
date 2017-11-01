# CSEP 544 Reading Assignments

Add a `readingHW` folder to your gitlab repo and write your responses in 
`readingHW/ra1.txt` (for the first reading assignment), `readingHW/ra2.txt` 
(for the second assignment), etc. 
Submit your response using `turnInHw.sh ra1`, `turnInHw.sh ra2`, etc before
the deadline.

Since we will be discussing the papers in class, students will not be allowed
to use late days on them.

### Assignment 1 (Due on Oct 10, before class)
<a name="ra1"></a>

Please read Sections 1-4 of "What goes around comes around" 
([csenetid](https://courses.cs.washington.edu/courses/csep544/17au/csenetid/goes-around.pdf), 
[uwnetid](https://courses.cs.washington.edu/courses/csep544/17au/uwnetid/goes-around.pdf)) and answer the 
following questions (a brief answer suffices):

1. Why did CODASYL not provide physical data independence?
2. What led to Ted Codd designing the relational data model? What were the issues with previous data models
at the time?


### Assignment 2 (Due on Oct 17, before class)

Please read Sections 1.3, 1.4, 2.1 of "A Relational Model of Data for Large Shared Data Banks"
(feel free to skim the rest)
([csenetid](https://courses.cs.washington.edu/courses/csep544/17au/csenetid/codd.pdf), 
[uwnetid](https://courses.cs.washington.edu/courses/csep544/17au/uwnetid/codd.pdf)) and answer the 
following questions (one paragraph per question suffices):

This paper is the original work that proposes the relational data model, hence some of the terms
might be different from what we call them today.

1. Describe briefly what "normal form" means as presented in the paper. 
What are the advantages of this normal form?
2. What is "composition" and why is it important for the relational operations presented in the paper? What would happen if the relational operators don't "compose"?


### Assignment 3 (Due on Oct 24, before class)

Please read this [survey](https://medium.baqend.com/nosql-databases-a-survey-and-decision-guidance-ea7823a822d) on NoSQL systems. You can skip sections 3.3 and 3.4 as we have not covered recovery and query processing. Answer the following questions (one paragraph per question suffices):

1. Compare the relational data model with any of the NoSQL data models discussed in Section 2.1. What are the advantages and disadvantages of each?
2. Do you agree with the categorization of the different systems shown in Figure 6? Why or why not?


### Assignment 4 (Due on Oct 31, before class)

Please read "Access Path Selection in a Relational Database Management System" ([csenetid](https://courses.cs.washington.edu/courses/csep544/17au/csenetid/selinger79.pdf), [uwnetid](https://courses.cs.washington.edu/courses/csep544/17au/uwnetid/selinger79.pdf)). This is *the* classical paper on join optimization. You can skip sections 1-3 as they describe the system where their algorithm was deployed. Answer the following questions (one paragraph per question suffices):

1. Join optimization, as presented in the paper, is highly dependent on the effectiveness of cost estimation. How does the paper propose to compute the cost of a single relation access path? What statistics are used to estimate the cost of query plans? What are the benefits and limitations of this approach?

2. In addition to computing the cost of a query plan, a query optimizer also needs (1) to define the space of possible plans that it will search and (2) it needs an algorithm to enumerate possible query plans within that space. What query plans does the paper consider? What algorithm does the paper propose to find the best plan in that space? What are the benefits and limitations of this approach?


### Assignment 5 (Due on Nov 7, before class)

We will be covering parallel databases, MapReduce, and Spark over two classes next week. Please read  "Parallel Database Systems: The Future of High Performance Database Systems," Sections 1 and 2 only ([csenetid](https://courses.cs.washington.edu/courses/csep544/17au/csenetid/dewitt-cacm92.pdf), [uwnetid](https://courses.cs.washington.edu/courses/csep544/17au/csenetid/dewitt-cacm92.pdf)). 
Then read "Resilient distributed datasets: a fault-tolerant abstraction for in-memory cluster computing," Sections 2, 3, and 4 only. 
([csenetid](https://courses.cs.washington.edu/courses/csep544/17au/csenetid/nsdi_spark.pdf), [uwnetid](https://courses.cs.washington.edu/courses/csep544/17au/csenetid/nsdi_spark.pdf)). 
These two are foundational papers in parallel data processing and Spark. 
Answer the following questions (one paragraph per question suffices):

1. What are parallel databases good for?
2. How do parallel databases compare to a distributed key-value store that we discussed in class earlier?
3. Is Spark just another MapReduce in terms of being a programming model for data analytics? How do they differ? How would you compare Spark/MapReduce with parallel databases?

Optional: for those of you who might be interested feel free to skim through this [online article](http://homes.cs.washington.edu/~billhowe/mapreduce_a_major_step_backwards.html)
 (make sure you read through the comments).