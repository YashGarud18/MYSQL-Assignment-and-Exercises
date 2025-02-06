-- -------------------------------------create table MNC(multi national company) database-------------------------------------
create database MNC;

-- Switch to MNC database
use MNC;

-- table-1-company table
create table company(
company_id int primary key auto_increment,
company_name varchar(100),
headquaters_location varchar(100),
established_date date,
industry varchar(50),
revenue decimal(15, 2) check (revenue >=0),   -- revenue must be non-negative
emp_count int default 0 check (emp_count >=0),  -- employee count must be non_negative
website varchar(255) unique,                   -- unique website URL for company
created_at timestamp default current_timestamp,  -- timestamp for record creation
update_at timestamp default current_timestamp on update current_timestamp,  -- timestamp for record update
unique (company_name)
);

drop table company;

-- insert 10 records
insert into Company (company_name, location, established_date, industry, revenue, 
emp_count, website)
value
('Tata Consultancy Services', 'Mumbai, Maharashtra', '1968-04-01', 'Information Technology', 20000000000.00, 500000, 'https://www.tcs.com'),
('Reliance Industries Limited', 'Mumbai, Maharashtra', '1960-05-08', 'Conglomerate', 80000000000.00, 200000, 'https://www.ril.com'),
('Infosys', 'Bengaluru, Karnataka', '1981-07-02', 'Information Technology', 13000000000.00, 250000, 'https://www.infosys.com'),
('Wipro', 'Bengaluru, Karnataka', '1945-12-29', 'Information Technology', 8000000000.00, 200000, 'https://www.wipro.com'),
('HDFC Bank', 'Mumbai, Maharashtra', '1994-08-01', 'Banking', 15000000000.00, 120000, 'https://www.hdfcbank.com'),
('ICICI Bank', 'Mumbai, Maharashtra', '1994-01-05', 'Banking', 12000000000.00, 100000, 'https://www.icicibank.com'),
('Bharti Airtel', 'New Delhi', '1995-07-07', 'Telecommunications', 15000000000.00, 30000, 'https://www.airtel.in'),
('State Bank of India', 'Mumbai, Maharashtra', '1955-01-01', 'Banking', 20000000000.00, 250000, 'https://www.sbi.co.in'),
('Hindustan Unilever Limited', 'Mumbai, Maharashtra', '1933-10-17', 'Consumer Goods', 6000000000.00, 40000, 'https://www.hul.co.in'),
('Larsen & Toubro', 'Mumbai, Maharashtra', '1938-02-07', 'Engineering & Construction', 15000000000.00, 50000, 'https://www.larsentoubro.com');

-- select queries
-- 1. select ALL table
select *from company;

-- 2.select specific column
select company_name, revenue from company;

-- 3.select company in specific industry as 'banking'
select * from company where industry = 'Banking';

-- 4.select company with revenue greater than a certain amount
select * from company where revenue > 10000000000.00;

-- 5.select company established in specific year
select * from company where year(established_date)= 1994;

-- 6.select comapany ordered by revenue in decending order
select * from company order by revenue desc;

-- 7.select company with a specific headquater location
select * from company where headquaters_location = 'New Delhi';

-- 8.select company with employee count greater than certain number
select * from company where emp_count > 100000;

-- 9.select company established after a certain date
select * from company where established_date < '1950-01-01';

-- 10.select company with revenue between two values
select * from company where revenue between 5000000000.00 and 20000000000.00;

-- 11. count no. of companies in industry column
select industry, count(*) as company_no from company group by industry;


/*
The error message you are encountering indicates that Mysql "safe update mode" is enable. 
This mode prevents you from executing UPDATE or DELETE statement that do not include a WHERE 
clauses that uses a key column (like primary key), This is safety feature to prevent accidental 
update or delection of all rows in table.
*/

-- Disable safe update mode temporarily
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;  -- re-enable safe update

-- -------Alter queries
-- 1.Add a new column
alter table company
add column stock_symbol varchar(10);
 
-- 2. Modify an exciting column
alter table company
modify column revenue decimal(20, 2) check (revenue>=0);

-- 3.drop column
alter table company
drop column stock_symbol;

-- 4.rename a column 
alter table company
change column headquaters_location location varchar(100);

-- 5. add a default value to an exciting column
alter table company
alter column emp_count set default 1;

-- 6. Add new column with default values
alter table company
add column country varchar(50) default 'India';

-- 7.Drop column if it exists
alter table company
drop column if exists country;
												
-- 8. ADD a unique constraint
alter table company
add constraint unique_website unique (website);

-- 9. change data type of column
ALTER TABLE Company
MODIFY COLUMN established_date DATETIME;

-- 10.Add a foreign key
alter table company
add constraint fk_industry foreign key (industry) references industries (industry_name);


-- --------Delete queries------
-- 1. delete a record
delete from company
where company_name ='Wipro';

-- 2.delete records based on condition
delete from company
where industry ='Banking';

-- 3.delete records with revenue below a certain amount
delete from company
where revenue < 5000000000.00;

-- 4.delete records established before certain date
delete from company
where established_date < '2000-01-01';

-- 5.delete records with specific headquater location
delete from company
where location = 'New Delhi';

-- 6.delete records with specific Employee Count
DELETE FROM Company
WHERE emp_count = 0;

-- 7.delete records with specific website
delete from company
where website = 'https://www.hdfcbank.com';

-- 8.delete records based on multiple condition 
delete from company
where industry = 'Telecommunication' and revenue < 10000000000.00;

 -- 9. Delete All Records (Use with Caution)
DELETE FROM Company;
select*from company;

-- 10. Delete Records with a Specific Name Pattern
DELETE FROM Company 
WHERE company_name LIKE 'H%';
select *from companies;


-- Rename queries
-- 1.Rename the database
alter database mnc rename to       -- error ka aala ahe cause database la rename nhi karun shkato
multiNationalcompanies;               

-- 2.rename the company table
alter table company rename to 
companies;

-- 3. Rename the company_id Column
alter table companies rename column
company_id to id;

-- 4. Rename the company_name Column
alter table companies rename column 
company_name to name;

-- 5. Rename the headquarters_location Column
ALTER TABLE Companies RENAME COLUMN headquarters_location TO headquarters;




-- Table-1 
-- create employee Table
create table Employees(
emp_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50),
email varchar(100) unique not null,
phoneNo varchar(10),
job_title varchar(50)
-- department_id int
-- foreign key(department_id) references Departments(department_id)
);

-- insert values into table
insert into Employees (first_name, last_name, email, phoneNo, job_title)
values
('Yash','Garud','yashgarud@gmail.com','9854612345','HR'),
('Sanket','Sable','sanket123@gmail.com','4521589621','HR'),
('Anjali','More','angali23@gmail.com','2574896314','Team leader'),
('om','Desai','omD66@gmail.com','2145630147','Fresher'),
('Ayush','Oswal','ayushO@gmail.com','6321458741','employee'),
('Sameer','Dubey','sameer32@gmail.com','8745961230','Intern'),
('Sachin','Mhatre','sachin56@gmail.com','8745632147','Manager'),
('Abhishek','Bhaleroa','abhi234@gmail.com','913456789','Assi. Manager'),
('Devendra','Patil','devendra@gmail.com','9444785612','employee'),
('Anagha','Patil','anagha23@gmail.com','8999794245','CEO');

-- select Queries
select * from Employees;
-- 1.select specific column
select first_name, phoneNo from employee;

-- 2.select employee in specific job_title
select * from employee where job_title = 'employee';

-- 3.select employee order by phoneNo
select * from employee order by phoneNo desc limit 2;

-- 4.select employee first_name charater is greater than 5
select * from employee where char_length(first_name) > 5;

-- 5.select employee last_name is patil
select * from employee where last_name like '%Patil%';


-- Alter Queries
-- 1.add new column
alter table employee 
add column Age int;

-- 2.modify exciting column
alter table employee
modify column phoneNo varchar(15);

-- 3.drop column
alter table employee
drop column salary;

-- 4.change data type of column
alter table employee
modify column Age varchar(10);

-- 5.add new column with default value
alter table employee
add column salary decimal(7, 2) default '30000.00';



-- Rename Queries
select * from Employees;
-- 1.rename database
alter database mnc 
rename to MNC;             -- We can't rename database. Drop database or create new

-- 2.rename employee table
alter table employee
rename to Employees;

-- 3.rename email column
alter table Employees 
rename column email to EmailAddress;

-- 4.rename emp_id column
alter table Employees
rename column emp_id to Id;

-- 5.rename phoneNo column
alter table Employees
rename column phoneNo to contact_info;



-- Delete Queries
select*from Employees;
-- 1.delete specific records
delete from Employees where first_name = 'om';

set sql_safe_updates = 0;
set sql_safe_updates = 1;

-- 2.delete records where salary is less than 20000.00
delete from Employees where salary > 30000.00;

-- 3.delete records with last_name patil
delete from Employees where last_name ='Patil';

-- 4.delete records with specific GamilAddress
delete from Employees where EmailAddress like '%123%';

-- 5.delete record with first_name yash
delete from Employees where first_name = 'Anjali';


-- Update Queries
-- 1.update a specific record
update Employees
set job_title = 'HR'
where first_name = 'om';
select*from Employees;

-- 2.update emailAddress
update Employees
set email='yashgarud22@gmail.com'
where emp_id= 1; 

-- 3.update multiple records
update Employees
set job_title ='Employee'
where emp_id in ('6','3');

-- 4.update phoneNo
update Employees
set phoneNo = '0'
where emp_id = 9;

-- 5.update last_name
update Employees 
set last_name ='More'
where emp_id in ('5','2');