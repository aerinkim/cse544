# CSEP 544 Homework 4: Finding the Mitochondrial Eve

**Objectives:**
To understand how queries are translated into the relational algebra. To master writing relational queries in a logic formalism using datalog.

**Assignment tools:**
Part 1: pen and paper; Part 2: LogicQL and Cloud9 

**Assigned date:** Tuesday, October 24, 2017

**Due date:** Tuesday, October 31, 2017. You have 1 week for this assignment.

**What to turn in:** `hw4-q1.txt`, `hw4-q2.txt`, and `g.logic` (see below).

**Resources:** 

- LogicBlox [tutorial](https://developer.logicblox.com/content/docs4/tutorial/repl/section/split.html) with their [REPL](https://developer.logicblox.com/playground/) (read-eval-print-loop). 
**Make sure you go through it!**
    
- LogicQL [language documentation](https://developer.logicblox.com/content/docs4/core-reference/webhelp/part-logiql.html)
    
- Language [grammar](https://developer.logicblox.com/content/docs4/core-reference/webhelp/grammar.html)
    
- [Cloud9](https://c9.io/login), LogicBlox's cloud offering. Start your project [here](https://developer.logicblox.com/using-cloud9-for-logicblox/). 

- [Database and starter code](https://courses.cs.washington.edu/courses/cse344/genealogy.tar.gz) for Part 2.

- General information for Part 2:    
    - The [Mitochondrial Eve](https://en.wikipedia.org/wiki/Mitochondrial_Eve)        
    - List of [women in the Bible](https://en.wikipedia.org/wiki/List_of_women_in_the_Bible)         
    - List of [minor biblical figures](https://en.wikipedia.org/wiki/List_of_minor_biblical_figures,_A%E2%80%93K)        
    - Note that the parent-child relationship is randomly generated and may change.
- **LogicBlox is a new service we're using this quarter, and there have been reported problems of the server occasionally going down. This is something that is out of the staff's control. Please do not start the homework at the last minute. There will be no exceptions for delayed submissions due to server problems.**


## Assignment Details

### Part 1: Warm Up with Relational Algebra

1. (10 points) Write the equivalent SQL query to this [relational algebra plan](ra.pdf "Relational Algebra Plan"). Save your answer in `hw4-q1.txt`. *Remember to follow the same style guide for writing SQL as in HW2 and HW3! (we reserve the right to take off points even if your query returns the correct results)*


2. (10 points) Write a relational algebra plan for the following SQL query:

    ```sql
    select a.p
    from   person_living a, male b
    where  a.p = b.name and 
           not exists (select * 
                       from   parent_child c, female d 
                       where  c.p1=d.name and c.p2=a.p)
   ```

    You do not need to draw the query plan as a tree and can use the linear style instead. To make precedence clear, we ask you to break down your query plan by using *at most one* operator on each line.  For example, given the query in question 1, you could write it as:

    ```sh
    T1(x,p1,p2) = person_living(x) Join[x=p1] parent_child(p1,p2)
    T2(p3,p4) = rename[p3,p4] parent_child(p3,p4)
    T3(x,p1,p2,p3,p4) = T1(x,p1,p2) Join[p2=p3] T2(p3,p4)
    T4(p1,p2,y) = GroupBy[p1,p2,count(*)->y] T3(x,p1,p2,p3,p4)
    T5(p1,z) =  GroupBy[p1,max(y)->z] T4(p1,p2,y)
    ```

    where `T1`, `T2`, etc are temporary relations. Note that each line has at most one relational operator. You do not need to use the Greek symbols if you prefer. You also don't need to distinguish among the different flavors of join (just make sure that you write out the full join predicate). 

    Save your answer in `hw4-q2.txt`. 


### Part 2. Finding the Mitochondrial Eve

Every human has a mother, who had her own mother, who in turn had her own mother.  The matrilineal ancestor of an individual consists of the mother, the mother’s mother, and so on, following only the female lineage.  A matrilinial common ancestor, MCA, is a matrilinial ancestor of all living humans.  An MCA is very, very likely to exist (why?), and in fact there are many MCAs.  The matrilineal most recent ancestor, or MRCA, is the only individual (woman) who is the MCA of all living humans and is the most recent such.  Who is she?  When did she live?  In the 1980s three researchers, Cann, Stoneking and Wilson, analyzed the mitocondrial DNA of living humans and determined that the MRCA lived about 200,000 years ago.  The researchers called her the [Mithcondrial Eve](https://en.wikipedia.org/wiki/Mitochondrial_Eve).

In this homework, you will analyze a database of 800 individuals, compute several things, culminating with the the computation of the Mithocondrial Eve.  The genealogy database consists of over 800 biblical names, obtained from Wikipedia, with a randomly generated parent-child relationship.

### Getting Started

1. Sign up for a free account on [Cloud9](https://c9.io/login).  You will be asked for a credit card, but that will not be charged.  Login to Cloud9.
2. Next, [create a workspace through Logicbox website](https://developer.logicblox.com/using-cloud9-for-logicblox/) for your project.  Give a name to your workspace, e.g., `CSEP544-HW4`.
3. You will see three panes: a file directory (left), open files (right), and the console of shell terminals (bottom). 
4. In the file directory, under `CSEP544-HW4` create your homework subdirectory (right click on `CSEP544-HW4` and select "New Folder"), call it something (say MyFiles)
5. Select your folder (MyFiles), then Go to File → “upload local files” (they should go under MyFiles). Drag-and-drop also works.
6. Select all files/directory in your `hw4/starter-code` directory, and upload (`g.sh`, `g.logic`, and the `DATA` directory)
7. Once uploaded, click on the file `g.sh`; it will open in the files pane on the right.
8. Click on the green Run button of the files pane: you should see activity in one of the consoles (bottom pane); in a few seconds the genealogy database is loaded into LogicBlox.
9. Go to the “bash” terminal in the console pane
    - If you closed the consoles pane by mistake: click on View -> Console
    - If you closed the “bash” console by mistake: click on the green + button, select “New Terminal”
10. In the console, start logicblox (`lb`), open the workspace g (`open g`), then run the query below:
    ```
    user:~/workspace $ lb
    lb>  open g
    lb g> query '_(y) <- parent_child("Jezebel",y).'
    ```
  
    Congratulations! You just ran your first datalog query.

### Questions
For each question below, write in the file g.logic a program that computes the answer to that question. See the Example section below.

1. (10 points) Find all descendants of Priscilla and their descriptions.  Name your predicate `p1(x,d)`. (123 rows)


2. (10 points) Find the woman/women with the largest number of children and the man/men with the largest number of children. For each individual, you should return the name of that individual, his/her description, and the number of children. Name your predicate `p2(x,d,n)`. (2 rows)


3. (20 points) For each person x, we call a "complete lineage" any sequence x0=x, x1, x2, … , xn where each person is the parent of the previous person, and the last person has no parents; the length of the sequence is n.  If x has a complete lineage of length n, then we also say that "x is in generation n".  Compute the minimum and maximum generation of each living person x. 

    Name your predicate `p3(x,m1,m2)`, where x is a living person, and `m1`, `m2` are the minimal/maximal generation. (Hint: You may want to first compute all generations for all x: think about when can you say that x is in generation 0, and when can you say that x is in generation n+1.  Of course x can be in multiple generations, e.g., x's mother is in generation 0 and x's father is in generation 2.   Once you know everybody's generations, you can answer the problem easily.) (22 rows)

4. (20 points) Compute all matrilineal common ancestors, MCA. Name your predicate `p4(x)`. (6 rows)

5. (20 points) Find the mitochondrial Eve.  Name your predicate `p5(x)`. Remember that you can utilize your predicates defined earlier. (1 row)


#### Example

For example, suppose the question were: find all children of Priscilla; return their names and their descriptions. Then you write this in g.logic (it’s already there):

```sh
p0(x,d) <- parent_child("Priscilla",x), person(x,d).
```

You can test it by running this in logicblox:

```sh
query '_(x,d) <- p0(x,d).'
```
	
## Submission Instructions

For Part 1, write your answers in a file `hw4-q1.txt`, and `hw4-q2.txt`.

For part 2, write your answers in the file `g.logic`, by adding the programs `p1`, ..., `p5`: you can first copy `g.logic` from `starter-code` to the `submission` directory, and then edit it by adding your solutions to `p1`, ..., `p5` afterwards.

**Important**: To remind you, in order for your answers to be added to the git repo, 
you need to explicitly add each file:

```sh
$ git add g.logic ...
```

**Again, just because your code has been committed on your local machine does not mean that it has been 
submitted -- it needs to be on GitLab!**

Use the same bash script `turnInHw.sh` in the root level directory of your repository that 
commits your changes, deletes any prior tag for the current lab, tags the current commit,
and pushes the branch and tag to GitLab. 

If you are using Linux or Mac OSX, you should be able to run the following:

```sh
$ ./turnInHw.sh hw4
```

Like previous assignments, make sure you check the results afterwards to make sure that your file(s)
have been committed.
