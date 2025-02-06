-- --------------------Employee database Managemnet---------------------
create database company;
use company;

-- ----------Employee table-----------
create table employee(
emp_id int primary key,
emp_name varchar(50),
phoneNo int,
depart_id int
);

insert into employee
values
(10,'yash',8947,81),
(11,'om',5467,21),
(12,'anagha',5542,11);

select*from employee;

-- -----------Department Table------------
create table depart(
dept_id int primary key,
dept_name varchar(50),
No_of_emps int,
floor varchar(10)
);

insert into depart
values
(01,'HR',15,81),
(02,'Marketing',20,21),
(03,'backend',55,11),
(04,'Coding',89,81)
;
select * from depart;

-- -------------salary Table---------------
create table salary(
salary_id int primary key,
emp_name varchar(50),
total_salary int,
Inhand_amount int
);

insert into salary
values
(102,'om',100000,7000),
(103,'anagha',1000000,70000),
(104,'payal',600000,35000),
(105,'ayush',100000,7000)
;
select*from salary;

-- -------------position Table--------------
create table position10(
position_id int primary key,
posit_name varchar(50),
emp_name varchar(20),
age int,
dept_name varchar(20)
);

insert into position10
values
(100,'employee','yash',20,'coding'),
(200,'manager','anagha',24,'marketing'),
(300,'assistant','om',31,'backend'),
(400,'employee','ayush',33,'coding');
select * from position10;

-- ------------experience Table-----------------
create table experience(
emp_name varchar(20),
age int,
years_of_experi varchar(20),
past_experience varchar(50)
);

insert into experience
values
('yash',22,'2years','worked in zomato'),
('om',23,'1.5years','worked in lenovo for 1.5years'),
('anagha',21,'1years','worked in zepto'),
('ayush',23,'2.5years','worked in amazon');
select *from experience;