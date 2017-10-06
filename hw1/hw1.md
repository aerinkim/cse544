# CSEP 544 Homework 1: SQLITE and SQL Basics

**Objectives:** To be able to create and manipulate tables in sqlite3, and write simple queries using SQL.

**Assignment tools:** [SQLite 3](https://www.sqlite.org/)

**Assigned date:** October 4, 2017

**Due date:** October 10, 2017

**Questions:** Make sure your post them on [Piazza](https://piazza.com/class/j7o1ieonolt3sv).

**What to turn in:**

One file per each of the question below, containing your SQL and SQLite commands, 
and SQL comments for your responses that are not in SQL (i.e., submit a `.sql` file that 
can be executed directly against the database system). 

No need to include any inputs or outputs. Name each file `hw1-q1.sql`, `hw1-q2.sql`, etc. 
You will need to learn how to write SQL comments if you have not done so before. 

Turn in your solution on [CSE's GitLab](https://gitlab.cs.washington.edu). 
See [submission instructions](#submission) below.


**Motivation:** 
We will use [SQLite](https://www.sqlite.org) for this assignment. 
SQLite is a software library that implements a SQL database engine. 
We will use SQLite in this assignment because it offers an extremely lightweight method to 
create and analyze structured datasets (by structured we mean datasets in the form of tables 
rather than, say, free text). Using SQLite is a minimal hassle approach to realizing the 
benefits of a relational database management system. 

Of course, SQLite does not do 
everything, but we will get to that point in later assignments. In the meantime, 
you can also learn [when to use SQLite and when not to use it](http://www.sqlite.org/whentouse.html).

**Resources:**

- Some important SQLite commands:
  - To view help contents: `.help`
  - To view a list of all your tables: `.tables`
  - To exit: `.exit` 

- [A simple guide](http://www.pantz.org/software/sqlite/sqlite_commands_and_general_usage.html) for commonly used command-line functions in SQLite.

- [More information](http://www.sqlite.org/sqlite.html) on formatting output in SQLite. 

- [An index](http://www.sqlite.org/lang.html) of more detailed information for SQL commands in SQLite.

- A [SQL style guide](http://www.sqlstyle.guide/) in case you are interested (FYI only).


## Assignment Details

To run SQLite do the following:
- Mac OS X or Linux: open a terminal and type `sqlite3` (if installed)
- Windows: there are two reasonable options:
  - Install the stand-alone windows program from the [SQLite web site](https://www.sqlite.org) 
  (precompiled windows command-line shell on the [download](http://www.sqlite.org/download.html) page)
  - (maybe a bit more complicated): Install [cygwin](http://www.cygwin.com/) to get a 
  linux command shell, then open cygwin and type `sqlite3` 
  (you may have to install it by running setup →  database → sqlite3; 
  it is probably already installed in the CSE labs).

Note that the course staff will only support the linux version of sqlite3 
running on CSE machines (e.g., `attu`) and will also use that version for grading purposes. 
*Make sure your submissions runs there*.


### Problems

1. (20 points) First, create a simple table using the following steps:
  - Create a table Edges(Source, Destination) where both Source and Destination are integers.
  - Insert the tuples `(10,5)`, `(6,25)`, `(1,3)`, and `(4,4)`
  - Write a SQL statement that returns all tuples.
  - Write a SQL statement that returns only column Source for all tuples.
  - Write a SQL statement that returns all tuples where Source > Destination.
  - Now insert the tuple `('-1','2000')`. Do you get an error? Why? This is a tricky question, you might want to [check the documentation](http://www.sqlite.org/datatype3.html).


2. (15 points) Next, you will create a table with attributes of types integer, varchar, date, and Boolean. 
However, SQLite does not have date and Boolean: you will use `varchar` and `int` instead. Some notes:
  - 0 (false) and 1 (true) are the values used to interpret Booleans.
  - Date strings in SQLite are in the form: 'YYYY-MM-DD'.  
Examples of valid date strings include: `'1988-01-15'`, `'0000-12-31'`, and `'2011-03-28'`.  
Examples of invalid date strings include: `'11-11-01'`, `'1900-1-20'`, `'2011-03-5'`, and `'2011-03-50'`.
  - Examples of date operations on date strings (feel free to try them):  
`select date('2011-03-28')`;  
`select date('now')`;  
`select date('now', '-5 year')`;  
`select date('now', '-5 year', '+24 hour')`;  
`select case when date('now') < date('2011-12-09') then 'Taking classes' when date('now') < date('2011-12-16') then 'Exams' else 'Vacation' end;` What does this query do? (no need to turn in your answer)  
   Create a table called `MyRestaurants` with the following attributes (you can pick your own names for the attributes, just make sure it is clear which one is for which): 
  - Name of the restaurant: a `varchar` field
  - Type of food they make: a `varchar` field
  - Distance (in minutes) from your house: an `int`
  - Date of your last visit: a `varchar` field, interpreted as date
  - Whether you like it or not: an `int`, interpreted as a Boolean

3. (13 points) 
Insert at least five tuples using the SQL INSERT command five (or more) times. 
You should insert at least one restaurant you liked, at least one restaurant you did not like, 
and at least one restaurant where you leave the “I like” field `NULL`.

4. (13 points) 
Write a SQL query that returns all restaurants in your table. Experiment with a few of SQLite's 
output formats and show the command you use to format the output along with your query:
  - print the results in comma-separated form
  - print the results in list form, delimited by "` | `"
  - print the results in column form, and make each column have width 15
  - for each of the formats above, try printing/not printing the column headers with the results

5. (13 points) 
Write a SQL query that returns only the name and distance of all restaurants within and 
including 20 minutes of your house. The query should list the restaurants in alphabetical order of names.

6. (13 points) 
Write a SQL query that returns all restaurants that you like, but have not visited 
since more than 3 months ago.


7. (13 points) 
Write a SQL query that returns all restaurants that are within and including 10 mins from your house.



## Submission Instructions
<a name="submission"></a>

We will be using `git`, a source code control tool, for distributing and submitting homework assignments in this class.
This will allow you to download the code and instruction for the homework, 
and also submit the labs in a standardized format that will streamline grading.

You will also be able to use `git` to commit your progress on the labs
as you go. This is **important**: Use `git` to back up your work. Back
up regularly by both committing and pushing your code as we describe below.

Course git repositories will be hosted as a 
repository in [gitlab](XXX). 
However, your code will be in a private repository hosted on [CSE's gitlab](https://gitlab.cs.washington.edu)
that is visible only to you and the course staff.

### Getting started with Git

There are numerous guides on using `git` that are available. They range from being interactive to just text-based. 
Find one that works and experiment -- making mistakes and fixing them is a great way to learn. 
Here is a [link to resources](https://help.github.com/articles/what-are-other-good-resources-for-learning-git-and-github) 
that GitHub suggests starting with. If you have no experience with `git`, you may find this 
[web-based tutorial helpful](https://try.github.io/levels/1/challenges/1).

Git may already be installed in your environment; if it's not, you'll need to install it first. 
For `bash`/Linux environments, git should be a simple `apt-get` / `yum` / etc. install. 
More detailed instructions may be [found here](http://git-scm.com/book/en/Getting-Started-Installing-Git).
Git is already installed on the CSE linux machines.

If you are using Eclipse or IntelliJ, many versions come with git already configured. 
The instructions will be slightly different than the command line instructions listed but will work 
for any OS. For Eclipse, detailed instructions can be found at 
[EGit User Guide](http://wiki.eclipse.org/EGit/User_Guide) or the
[EGit Tutorial](http://eclipsesource.com/blogs/tutorials/egit-tutorial).


### Cloning your repository for homework assignments

We have created a git repository that you will use to commit and submit your the homework assignments. 
This repository is hosted on the [CSE's GitLab](https://gitlab.cs.washington.edu) , 
and you can view it by visiting the GitLab website at 
`https://gitlab.cs.washington.edu/csep544-2017au/csep544-2017au-[yourCSEusername]`. 

You'll be using this **same repository** for each of the homework assignments this quarter, 
so if you don't see this repository or are unable to access it, let us know immediately!

The first thing you'll need to do is set up a SSH key to allow communication with GitLab:

1.  If you don't already have one, generate a new SSH key. See [these instructions](http://doc.gitlab.com/ce/ssh/README.html) for details on how to do this.
2.  Visit the [GitLab SSH key management page](https://gitlab.cs.washington.edu/profile/keys). You'll need to log in using your CSE account.
3.  Click "Add SSH Key" and paste in your **public** key into the text area.

While you're logged into the GitLab website, browse around to see which projects you have access to. 
You should have access to `csep544-2017au-[yourCSEusername]`. 
Spend a few minutes getting familiar with the directory layout and file structure. For now nothing will
be there except for the `hw1` directory with these instructions.

We next want to move the code from the GitLab repository onto your local file system. 
To do this, you'll need to clone the 544 repository by issuing the following commands on the command line:

```sh
$ cd [directory that you want to put your 544 assignments]
$ git clone git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au-[yourCSEusername].git
$ cd csep544-2017au-[yourCSEusername].git
```

This will make a complete replica of the repository locally. If you get an error that looks like:

```sh
Cloning into 'csep544-2017au-[yourCSEusername]'...
Permission denied (publickey).
fatal: Could not read from remote repository.
```

... then there is a problem with your GitLab configuration. Check to make sure that your GitLab username matches the repository suffix, that your private key is in your SSH directory (`~/.ssh`) and has the correct permissions, and that you can view the repository through the website.

Cloning will make a complete replica of the homework repository locally. Any time you `commit` and `push` your local changes, they will appear in the GitLab repository.  Since we'll be grading the copy in the GitLab repository, it's important that you remember to push all of your changes!

### Adding an upstream remote

The repository you just cloned is a replica of your own private repository on GitLab. 
The copy on your file system is a local copy, and the copy on GitLab is referred to as the `origin` remote copy.  You can view a list of these remote links as follows:

```sh
$ git remote -v
```

There is one more level of indirection to consider.
When we created your `csep544-2017au-[yourCSEusername]` repository, we forked a copy of it from another 
repository `csep544-2017au`.  In `git` parlance, this "original repository" referred to as an `upstream` repository.
When we release bug fixes and subsequent labs, we will put our changes into the upstream repository, and you will need to be able to pull those changes into your own.  See [the documentation](https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes) for more details on working with remotes -- they can be confusing!

In order to be able to pull the changes from the upstream repository, we'll need to record a link to the `upstream` remote in your own local repository:

```sh
$ # Note that this repository does not have your username as a suffix!
$ git remote add upstream git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au.git
```

For reference, your final remote configuration should read like the following when it's setup correctly:

```sh
$ git remote -v
  origin  git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au-[yourCSEusername].git (fetch)
  origin  git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au-[yourCSEusername].git (push)
  upstream    git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au.git (fetch)
  upstream    git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au.git (push)
```

In this configuration, the `origin` (default) remote links to **your** repository 
where you'll be pushing your individual submission. The `upstream` remote points to **our** 
repository where you'll be pulling subsequent homework and bug fixes (more on this below).

Let's test out the origin remote by doing a push of your master branch to GitLab. Do this by issuing the following commands:

```sh
$ touch empty_file
$ git add empty_file
$ git commit empty_file -m 'Testing git'
$ git push # ... to origin by default
```

The `git push` tells git to push all of your **committed** changes to a remote.  If none is specified, `origin` is assumed by default (you can be explicit about this by executing `git push origin`).  Since the `upstream` remote is read-only, you'll only be able to `pull` from it -- `git push upstream` will fail with a permission error.

After executing these commands, you should see something like the following:

```sh
Counting objects: 4, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 286 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au-[yourCSEusername].git
   cb5be61..9bbce8d  master -> master
```

We pushed a blank file to our origin remote, which isn't very interesting. Let's clean up after ourselves:

```sh
$ # Tell git we want to remove this file from our repository
$ git rm empty_file
$ # Now commit all pending changes (-a) with the specified message (-m)
$ git commit -a -m 'Removed test file'
$ # Now, push this change to GitLab
$ git push
```

If you don't know Git that well, this probably seemed very arcane. Just keep using Git and you'll understand more and more. We'll provide explicit instructions below on how to use these commands to actually indicate your final lab solution.

### Pulling from the upstream remote

If we release additional details or bug fixes for this homework, 
we'll push them to the repository that you just added as an `upstream` remote. You'll need to `pull` and `merge` them into your own repository. (You'll also do this for subsequent labs!) You can do both of these things with the following command:

```sh
$ git pull upstream master
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From gitlab.cs.washington.edu:csep544-2017au/csep544-2017au.git
 * branch            master     -> FETCH_HEAD
   7f81148..b0c4a3e  master     -> upstream/master
Merge made by the 'recursive' strategy.
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```

Here we pulled and merged changes to the `README.md` file. Git may open a text editor to allow you to specify a merge commit message; you may leave this as the default. Note that these changes are merged locally, but we will eventually want to push them to the GitLab repository (`git push`).

Note that it's possible that there aren't any pending changes in the upstream repository for you to pull.  If so, `git` will tell you that everything is up to date.


### Collaboration

All CSE 544 assignments are to be completed **INDIVIDUALLY**! However, you may discuss your high-level approach to solving each lab with other students in the class.

### Submitting your assignment

You may submit your code multiple times; we will use the latest version you submit that arrives 
before the deadline. 
Put your `.sql` files in `hw1/submission`. Your directory structure should 
look like this after you have completed the assignment: 

```sh
csep544-2017au-[your CSE username]
\-- README.md
\-- turnInHW.sh     # script for turning in hw
\-- hw1
    \-- hw1.md      # this is the file that you are currently reading
    \-- submission
        \-- hw1-q1.sql  # your solution to question 1
        \-- hw1-q2.sql  # your solution to question 2
        \-- hw1-q3.sql  # your solution to question 3
        ...
```

**Important**: In order for your write-up to be added to the git repo, you need to explicitly add it:

```sh
$ cd submission
$ git add hw1-q1.sql hw1-q2.sql ...
```

Or if you do
```sh
$ git add submission
```

Then it will add *all* the files inside the `submission` directory to the repo.

The criteria for your homework being submitted on time is that your code must be tagged and 
pushed by the due date and time. This means that if one of the TAs or the instructor were to open up GitLab, they would be able to see your solutions on the GitLab web page.

**Just because your code has been committed on your local machine does not mean that it has been submitted -- it needs to be on GitLab!**

There is a bash script `turnInHw.sh` in the root level directory of your repository that commits your changes, deletes any prior tag for the current lab, tags the current commit, and pushes the branch and tag to GitLab. If you are using Linux or Mac OSX, you should be able to run the following:

```sh
$ ./turnInHw.sh hw1
```

You should see something like the following output:

```sh
$ ./turnInHw.sh hw11
[master b155ba0] Homework 1
 1 file changed, 1 insertion(+)
Deleted tag 'hw1' (was b26abd0)
To git@gitlab.com:csep544-2017au/csep544-2017au-[your CSE username].git
 - [deleted]         hw1
Counting objects: 11, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 448 bytes | 0 bytes/s, done.
Total 6 (delta 3), reused 0 (delta 0)
To git@gitlab.com:csep544-2017au/csep544-2017au-[your CSE username].git
   ae31bce..b155ba0  master -> master
Counting objects: 1, done.
Writing objects: 100% (1/1), 152 bytes | 0 bytes/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To git@gitlab.com:csep544-2017au/csep544-2017au-[your CSE username].git
 * [new tag]         hw1 -> hw1
```


#### Final Word of Caution!

Git is a distributed version control system. This means everything operates offline until you run `git pull` or `git push`. This is a great feature.

The bad thing is that you may **forget to `git push` your changes**. This is why we strongly, strongly suggest that you **check GitLab to be sure that what you want us to see matches up with what you expect**.  As a second sanity check, you can re-clone your repository in a different directory to confirm the changes:

```sh
$ git clone git@gitlab.cs.washington.edu:csep544-2017au/csep544-2017au-[your CSE username].git confirmation_directory
$ cd confirmation_directory
$ # ... make sure everything is as you expect ...
```