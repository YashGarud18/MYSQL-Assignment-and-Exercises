# ------------------------------------- Pratice Database Gym Management System -------------------------------------------

create database if not exists gym;
use gym;

-- table 1
create table user(
user_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50),
email varchar (50) unique,
phoneNo varchar(15),
gender enum('Male', 'Female', 'Other'),
join_date date
);

-- insert values
insert into user (first_name,last_name,email,phoneNo,gender,join_date)
values
('John', 'Doe', 'johndoe@example.com', '555-1234', 'Male', '2025-01-01'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678', 'Female', '2025-01-10'),
('Michael', 'Johnson', 'michaelj@example.com', '555-8765','Male', '2025-01-12'),
('Emily', 'Davis', 'emilydavis@example.com', '555-3456', 'Female', '2025-01-03'),
('Chris', 'Martinez', 'chrismartinez@example.com', '555-7654', 'Male', '2025-01-09');
select *from user;

-- Select queries
-- 1.select specific column from table
select first_name, phoneNO from user;

-- 2.select user where gender is female
select * from user where gender = 'female';


-- Alter queries
-- 1.Add a new column
alter table user
add column end_date date default '2025-01-23';

-- 2.Drop a specific oclumn
alter table user
drop column end_date;


-- Update queries
-- 1.update phoneNo from user table
update user set phoneNo = '000-1243'
where user_id = 2;

-- 2.update email from table
update user
set email = 'xuxuxu@xyz.com' where user_id = 5;


-- Rename queries
-- 1.Rename a column
alter table user
rename column email to Emails;

-- 2.Rename a column
alter table user
rename column phoneNo to MoblieNo;


-- Delete queries
-- 1.delete a specific row
delete from user
where user_id =2;

/*You can temporarily disable foreign key checks to drop the table. However,
 this is risky because it leaves dangling references in child tables.*/

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE Patients;
SET FOREIGN_KEY_CHECKS = 1;

-- 2.delete column where join_date is gretaer tah 2025-01-01
delete from user 
where join_date > '2025-01-01';
set sql_safe_updates=0;

-- Truncate querie
truncate user;


-- Having clause
-- 1.select user with same gender more than 2
select gender, COUNT(*) as Total 
from user group by gender having COUNT(*) > 2;

-- 2.select payment_status with more than 2
select phoneNo, count(*) as Total 
from user group by phoneNo having count(*) > 2;


-- Group BY clause
-- 1.group user with gender table
select gender, COUNT(*) as Total from user group by gender;

-- 2.group payment by user_id and calculate average amount
select user_id, avg(join_date) as avgragedate from user group by user_id;


-- ORDER BY clause
-- 1.select all user ordered by first_name in desc order
select * from user order by first_name desc;

-- 2.select all user ordered by join_date
select * from user order by join_date;


-- Limit clause
-- 1.select the first 3 users
select * from user limit 3;
select * from user limit 3 offset 2;

-- 2.select the first 3 users where phoneNo is greater than specific date
select * from user where phoneNo > '2025-01-01' limit 3;


-- Distinct clause
-- 1.select distinct last_name
select distinct last_name from user; 

-- 2.select distinct first_name , join_date
select distinct first_name , join_date from payments;




-- table 2
create table Memberships (
    membership_id int primary key auto_increment,
    membership_name varchar(100),
    duration_months INT,
    price DECIMAL(10, 2),
    benefits TEXT
);

-- insert values
insert into memberships(membership_name,duration_months,price,benefits)
values
('Basic Membership', 1, 50.00, 'Access to gym equipment and locker rooms'),
('Premium Membership', 12, 500.00, 'Access to gym equipment, locker rooms, classes, and personal trainer'),
('Family Membership', 6, 300.00, 'Access for 2 adults and 2 children to all facilities'),
('Student Membership', 3, 120.00, 'Discounted rate for students, includes full access to gym'),
('VIP Membership', 24, 1000.00, 'Includes all services, priority booking, and free guest passes');
select * from memberships;

-- Select queries
-- 1.select specific column from table
select membership_name, duration_months from memberships;

-- 2.select user where price is greater tahn 100
select * from memberships where price > 100;


-- Alter queries
-- 1.Add a new column
alter table memberships
add column start_date timestamp default current_timestamp;

-- 2.Drop a specific oclumn
alter table memberships
drop column start_date;


-- Update queries
-- 1.update phoneNo from user table
update memberships set price = 500.00
where membership_id = 1;

-- 2.update email from table
update memberships
set duration_months = 12 where benefits like 'A%';


-- Delete queries
-- 1.delete a specific row
delete from memberships
where benefits not like 'A%';

-- 2.delete column where join_date is gretaer tah 2025-01-01
delete from memberships 
where duration_months > 12;

set sql_safe_updates=0;

-- Rename queries
-- 1.Rename a column
alter table memberships
rename column duration_months to Months;

-- 2.Rename a column
alter table memberships
rename column benefits to Benefits;


-- Having clause
-- 1.select memberships with amount more than 500
select price, COUNT(*) as TotalPrice 
from memberships group by price having COUNT(*) < 500;

-- 2.select duration_month with more than 2
select duration_month, count(*) as Total 
from memberships group by duration_month having count(*) > 2;


-- Group BY clause
-- 1.group memberships with duration_month
select duration_month, count(*) as total from memberships group by duration_month;

-- 2.group memberships by membership_name and calculate average price
select membership_name, avg(price) as avgragePrice from memberships group by membership_name;


-- ORDER BY clause
-- 1.select all memberships ordered by duration_month in desc order
select * from memberships order by duration_month desc;

-- 2.select all memberships ordered by price
select * from memberships order by price;


-- Limit clause
-- 1.select the first 3 users
select * from memberships limit 3;
select * from memberships limit 3 offset 2;

-- 2.select the first 3 users where price is greater than 100
select * from memberships where price > 100 limit 3;


-- Distinct clause
-- 1.select distinct price
select distinct price from memberships; 

-- 2.select distinct membership_name and benefit
select distinct membership_name, benefits from memberships;




-- table 3
create table user_membership(
user_id int,
membership_id int,
start_date date,
end_date date,
foreign key (user_id) references user (user_id),
foreign key (membership_id) references memberships(membership_id)
);

-- insert values
insert into user_membership(user_id,membership_id,start_date,end_date)
values
(1, 1, '2025-01-01', '2025-02-01'),
(2, 2, '2025-01-10', '2026-01-10'),
(3, 2, '2025-01-12', '2025-07-12'),
(4, 4, '2025-01-03', '2025-04-03'),
(5, 3, '2025-01-09', '2027-01-09');
select * from user_membership;

-- Select queries
-- 1.select specific column from table
select user_id, membership_id from user_membership;

-- 2.select user where price is greater tahn 100
select * from user_membership where start_date > '2025-01-03';


-- Alter queries
-- 1.alter 
alter table user_membership
add column start_month timestamp default current_timestamp;

-- 2.Drop a specific oclumn
alter table user_membership
drop column start_month;


-- Update queries
-- 1.update start_date from table
update user_membership set start_date = '2023-01-22'
where user_id = 1;

-- 2.update end date from table
update user_membership
set end_date = '2021-05-22' where membership_id = 5;


-- Delete queries
-- 1.delete a specific row
delete from user_membership
where membership_id= 3;

-- 2.delete column where end_date is gretaer than 2025-02-01
delete from user_membership 
where end_date > '2025-02-01';


-- Rename queries
-- 1.Rename a column
alter table user_membership
rename column end_date to EndDate;

-- 2.Rename a column
alter table user_membership
rename column membership_id to Membership_ID;



-- table 4
CREATE TABLE Trainers (
    trainer_id int primary key auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100) UNIQUE,
    phone varchar(15),
    certification varchar(100),
    hire_date DATE,
    status ENUM('Active', 'Inactive')
);

-- insert values
INSERT INTO Trainers (first_name, last_name, email, phone, certification, hire_date, status)
VALUES
('David', 'Williams', 'davidwilliams@example.com', '555-9999', 'Certified Personal Trainer', '2024-12-01', 'Active'),
('Sarah', 'Brown', 'sarahbrown@example.com', '555-1122', 'Certified Yoga Instructor', '2024-08-15', 'Inactive'),
('James', 'Miller', 'jamesmiller@example.com', '555-3344', 'Certified Strength Coach', '2024-05-20', 'Active'),
('Olivia', 'Taylor', 'oliviataylor@example.com', '555-4455', 'Certified Nutritionist', '2024-11-01', 'Inactive'),
('Daniel', 'Wilson', 'danielwilson@example.com', '555-5566', 'Certified CrossFit Trainer', '2024-09-15', 'Active');
select *from trainers;


-- Select queries
-- 1.select specific column from table
select first_name, certification from trainers;

-- 2.select where certification like 'certified'
select * from trainers where certification like '%Trainer%';


-- Alter queries
-- 1.add a column
alter table trainers
add column age int;

-- 2.Drop a specific oclumn
alter table trainers
drop column age;


-- Update queries
-- 1.update start_date from table
update trainers set phone = '000-1458'
where status ='Inactive';

-- 2.update end date from table
update trainers
set first_name = 'yash'
where last_name in ('James', 'Daniel');


-- Delete queries
-- 1.delete a specific row
delete from trainers
where status = 'Active';

-- 2.delete column where status is inactive and hire_date is gretaer than 2025-02-01
delete from trainers 
where status = 'Inactive' and hire_date > '2025-01-01';


-- Rename queries
-- 1.Rename a column
alter table trainers
rename column hire_date to Hire_Date;

-- 2.Rename a column
alter table trainers
rename column status to Status;




-- table 5
create table Payments (
    payment_id int primary key auto_increment,
    user_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method ENUM('Credit Card', 'Debit Card', 'Cash', 'Bank Transfer'),
    payment_status ENUM('Pending', 'Completed', 'Failed'),
    FOREIGN KEY (user_id) REFERENCES user (user_id)
);

-- insert values
INSERT INTO Payments (user_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 50.00, '2025-01-05', 'Credit Card', 'Completed'),
(2, 120.00, '2025-01-12', 'Debit Card', 'Completed'),
(3, 500.00, '2025-01-11', 'Bank Transfer', 'Pending'),
(4, 60.00, '2025-01-06', 'Cash', 'Completed'),
(5, 300.00, '2025-01-09', 'Credit Card', 'Completed');
select * from payments;

-- Select queries
-- 1.count total no. of users
select count(user_id) as total_users from payments; 

-- 2.select where payment_status like 'Pending'
select * from payments where payment_status like '%Pending%';


-- Alter queries
-- 1.add a column
alter table payments
change column payment_method PaymentMethod varchar(50);

-- 2.Add a default value in existing column
alter table payments
alter column payment_status set default 'Pending';


-- Update queries
-- 1.update start_date from table
update payments set payment_status = 'Pending'
where user_id in ('1','3');

-- 2.update end date from table
update payments
set amount = '200'
where user_id in ('1','3');


-- Delete queries
-- 1.delete a specific row
delete from payments
where payment_status = 'Pending';

-- 2.delete column where status is inactive and hire_date is gretaer than 2025-02-01
delete from payments 
where amount = 50.00 and payment_date > '2025-01-01';


-- Rename queries
-- 1.Rename a column
alter table payments
rename column payment_status to status;

-- 2.Rename a column
alter table payments
rename column amount to Amount; 


-- Having clause
-- 1.select users with amount more than 120
select amount, COUNT(*) as users 
from payments group by amount having COUNT(*) < 120;

-- 2.select payment_status with more than 2
select payment_status, count(*) as TotalPayment 
from payments group by payment_status having count(*) > 2;


-- Group BY clause
-- 1.group payemts with payment_status
select payment_status, count(*) as PayedStatus from payments group by payment_status;

-- 2.group payment by user_id and calculate average amount
select user_id, avg(amount) as avgrageAmount from payments group by user_id;


-- ORDER BY clause
-- 1.select all payments ordered by amount in desc order
select * from payments order by amount desc;

-- 2.select all payments ordered by payment_date
select * from payments order by payment_date;


-- Limit clause
-- 1.select the first 3 users
select * from payments limit 3;
select * from payments limit 3 offset 2;

-- 2.select the first 3 users where amount is greater than 100
select * from payments where amount > 100 limit 3;


-- Distinct clause
-- 1.select distinct payment_status
select distinct payment_status from payments; 

-- 2.select distinct payment_method
select distinct PaymentMethod , Amount from payments;