-- ------------------------------------ E-commerce System --------------------------------
/* 
1.create database - E-commerce system
 2.create 5 table using min 5 attributes, including various types of database and multiple constraint
 3.insert 5 records in each table and do proper documentation
 4.write basic queries for each table including -- show data, truncate, drop, alter, update, delete, rename
 5.Do proper analysis about each tables, generate real world based situation and write misleneous queries-
   -> functions, operators, alias, clauses
*/

-- create database
create database if not exists E_commerce;

-- after creating database use database 
use e_commerce;


-- create 5 tables

#Table-1
CREATE TABLE Products (
    ProductID INT PRIMARY KEY auto_increment,
    ProductName varchar(255) NOT null,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    stocks INT NOT NULL
);

-- insert values into tables
insert into products (productName,Description,price,stocks)
values
('Smartphone', 'Latest model with advanced features', 699.99, 10),
('Laptop', 'High-performance laptop for work and play', 999.99, 44),
('Wireless Earbuds', 'Noise-cancelling wireless earbuds', 149.99, 50),
('Smartwatch', 'Stylish smartwatch with health tracking', 199.99, 60),
('Tablet', 'Compact tablet with high-resolution display', 299.99, 80);


#table-2
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    City VARCHAR(50)
);

-- insert values into tables
INSERT INTO Customers (FirstName, LastName, Email, City)
VALUES 
('John', 'Doe', 'john.doe@gmail.com', 'New York'),
('Jane', 'Smith', 'janesmith@gmail.com', 'Los Angeles'),
('om', 'Johnson', 'om.johnson@gmail.com','Kalyan'),
('sai', 'Brown', 'sai.brown@gmail.com', 'Mumbai'),
('Eve', 'Davis', 'eve.davis@gmail.com', 'San Francisco');


#Table-3
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status ENUM('Paided', 'Unpaied'),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- insert values into tables
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES 
(1, '2025-01-20', 849.98, 'Paided'),
(2, '2025-01-21', 1199.99, 'Unpaied'),
(3, '2025-01-22', 149.99, 'Paided'),
(4, '2025-01-23', 199.99, 'Paided'),
(5, '2025-01-24', 299.99, 'Unpaied');


#Table-4
CREATE TABLE OrderDetail (
    DetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- insert into table
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 699.99),
(1, 3, 1, 149.99),
(2, 2, 2, 999.99),
(3, 3, 8, 149.99),
(4, 4, 3, 199.99);


#Table-5
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    CustomerID INT,
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- insert values into atble
INSERT INTO Reviews (ProductID, CustomerID, Comment, ReviewDate)
VALUES 
(1, 5, 'Excellent product, highly recommend!', '2025-01-25'),
(2, 4, 'Great performance, but battery life could be better.', '2025-01-26'),
(3, 3, 'Good value for the price.', '2025-01-27'),
(4, 2, 'Not as durable as expected.', '2025-01-28'),
(5, 1, 'Disappointed with the overall quality.', '2025-01-29');


-- show data for each table
-- table1
select * from Products;

-- table2
select * from customers;

-- table3
select * from orders;

-- table4
select * from orderDetail;

-- table5
select * from reviews;


-- Truncate querie
truncate products;

-- drop querie
drop table reviews;          -- table5
drop table orderDetail;      -- table4
drop table orders;           -- table3
drop table customers;         -- table2
drop table Products;         -- table1


-- Alter queries
-- add a specific column
alter table customers
add column country varchar(50) default 'Europe';

-- change the datatype of column
alter table reviews
modify column ReviewDate datetime;

-- update queries
-- update a specific column 
update orders
set status = 'Unpaied'
where customerID in ('2','5');

-- update comment in review table
update reviews
set comment = 'poor quality and too costly'
where productID = 2;

-- delete querie
-- delete quantity that is greater than 2
delete from OrderDetail
where Quantity > 2; 

-- delete specific row                  
delete from products
where productName not like 'smart%';

set sql_safe_updates=0;

-- rename querie
-- rename the orderDetail table
alter table OrderDetail rename to 
Details;

-- rename the price table
alter table OrderDetail 
rename column price to Amount;



-- Alias
-- table alias
select o.CustomerID, o.OrderDate from orders o;

-- column alias
select r.productID as ID, r.CustomerID as ID, r.comment as Reviews from reviews r;



-- clauses queries
-- select clause
select productID, customerID from reviews;

-- from clause
select * from reviews;

-- where clause
select * from customers where email like '%@%';

-- order by clause
select * from products order by price desc;

-- group by clause
select CustomerID, sum(TotalAmount) as totalP from Orders group by customerID;

-- having clause
select CustomerID, sum(TotalAmount) as totalP from Orders group by customerID having count(*) > 2;

-- limit clause
select * from customers limit 3 offset 2;



-- functions
select count(quantity) as total from orderDetail;