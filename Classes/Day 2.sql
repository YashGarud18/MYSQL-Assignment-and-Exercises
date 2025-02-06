-- single line comment
# This is also single line comment

/*
multiline
comment
*/

/*
Usage of Comments
1. Documentation: Comments can be used to document the purpose of a SQL query or the logic 
behind complex operations.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, 
which is useful for debugging.
3. Collaboration: When working in teams, comments help communicate the intent and 
functionality of the code to other developers.
*/

#Note :  SQL is not a case-sensitive language. as create & CREATE will be treated as same.

-- create database 
create database schoolxyz;

-- use and work on any database
use schoolxyz;

# delete any database                                (crtl+entr to execute any query)
drop database schoolxyz;

-- ------------------------------------Table Queries (how to create table)---------------------------
create table student(
id int primary key,  -- primary key= unique + not null (primary key use kiya hai because id diffrent asta not same)
name varchar(50) not null,
age int not null,
std int,
gender varchar(10),
division varchar(10)
);

-- show table data use:
select * from student;

-- method 1 to insert data in table
insert	into student (id,name,age,std,gender,division)
values
(8,'yash',2,2,'male','A');

-- method 2 
insert into student
values
(9,'om',3,4,'male','B');

-- remove all values in table:
truncate student;

-- method 3 
insert into student
values
(1,'yash',2,3,'male','A'),
(2,'anagha',2,3,'female','A'),
(3,'om',3,3,'male','C');











