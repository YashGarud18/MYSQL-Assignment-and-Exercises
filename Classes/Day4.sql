-- -------------------------------------create table MNC(multi national company) database-------------------------------------
create database MNC;

-- Switch to MNC database
use MNC;

-- table-1-company table
create table companies(
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

drop table companies;

-- insert 10 records
insert into Companies (company_name, headquaters_location, established_date, industry, revenue, 
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
select *from companies;

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
alter table companies
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
alter table companies 
rename column company_name to name;

-- 5. Rename the headquarters_location Column
ALTER TABLE Companies RENAME COLUMN headquarters_location TO headquarters;

-- 6. Rename Multiple Columns
ALTER TABLE MultinationalCompanies
RENAME COLUMN industry TO business_sector,
RENAME COLUMN website TO company_website;


-- UPDATE Queries
-- Disable safe update mode temporarily
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;    -- re-enale safe updates

-- 1.update a specific record
update companies 
set revenue = 220000000000.00, emp_count = 520000
where name = 'Tata Consultancy Services';

-- 2.update multiple records
update companies 
set industry = 'Telecom'
where name in ('Bharti Airtel', 'Reliance Industries Limited');
select *from companies;

-- 3.update revenue for all companies in specific industry
update companies
set revenue = revenue * 1.10
where industry = 'Banking';

-- 4.update emp_count for a specific company
update companies
set emp_count = 210000
where name = 'Wipro';

-- 5.update headquaters_location
update companies
set headquaters_location = 'Gurugram, Haryana'
where name ='HDFC Bank';

-- 6.update established date
update companies
set established_date = '1994-01-01'
where name = 'ICICI Bank';
select * from companies;

-- 7.update website URL
update companies
set website = 'http://www.Infosys.co.in'
where name ='Infosys';

-- 8.update revenue for companies with low emp_count 
update companies
set revenue = 0
where emp_count < 50000;

-- 9.update Industry for specific company
update companies
set industry = 'Comsumer Product'
where name = 'Hindustan Unilever Limited';

-- 10.update Multiple fields for specific company
update companies
set revenue = 16000000000.00, industry = 'Construction & Engineering'
where name = 'Larsen & Toubro';