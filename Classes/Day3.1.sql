-- ------------------------------Travel Agent-----------------------------------
create database travelagent;
show databases;

-- database related queries --
CREATE DATABASE IF NOT EXISTS travelagent;
drop database travelagent;
DROP DATABASE IF EXISTS travelagent;

use travelagent;

/*
clauses are components of a sql statement that specify the action to be performed on the data
in a database. Each clause server a specific pupose and helps to define the structure and behaviour 
of the sql query. clauses can be combined to create complex queries that retrive, manpulate, or manage data.

The main clause in MySQL include:
SELECT: Retrives data from a database table.
FROM: Specifies the table(s) to retrieve data from.
WHERE: Fliters data based on conditions. 
GROUP BY: Groups data based on one or more columns. 
HAVING: Fliters grouped data based on condition. 
ORDER BY: sorts data in ascending or descending order.
LIMIT: limits the no. of rows returned. 
*/

/*
Different Clauses:
1. WHERE
The WHERE clause is used to fliter records in a table based on specific condition. 
It is used with SELECT,delete,update statements. 

syntax:
SELECT col1, col2
FROM Table_name
WHERE condition;

2. DISTINCT
The DISTINCT clause is used to return valuess from a column by resolving duplicates in result set. 

syntax:
SELECT DISTINCT col1
FROM Table_name;

3. FROM
The FROM clause specifies the table or table from which the data is retrieved.
It is mandatory part of the SELECT statement and can also be used with joins for combining data from multiple tables. 

syntax:
SELECT col1,col2
FROM Table_name;

4. ORDER BY 
The ORDER BY caluse is used to sort the result set in ascending(ASC) or descending (DESC) order based on one or more columns.

syntax:
SELECT col1,col2
FROM Table_name
ORDER BY column_name [ASC|DESC];

5. GROUP BY
The GROUP BY clause grp rows with same values into summary rows, often used with aggregate function (e.g.: COUNT, SUM, AVG). 

syntax:
SELECT col1,aggregate_function(col2)
From table_name
GROUP BY col1; 
*/

/*
SELECT query:
The SELET statement is used to retrieve data from a database table. It allows
you to specify the columns you want to fetch and apply condition to fliter the result. 

syntax:
SELECT col1, col2,...
FROM table_name
WHERE condition;
*/

-- -------------------------------------------------Table Queries------------------------------------------------- 
-- Data Definition language (DDL) {create, alter, drop, truncate, rename, comment}
-- Data Manipulation language (DML) {Insert, update, delete}
-- Data Query Language (DQL) {select query}

-- ---------Table-1-----------
-- create countries table

create table countries(
-- unique identifier for each country
id int primary key auto_increment,

-- name of country
name varchar(50) not null unique,

-- description of country
description text,

-- capital city of country
capital_city varchar(50),

-- currency of country
currency varchar(50) not null
);

-- Insert records into the countries table
INSERT INTO countries (name, description, capital_city, currency) VALUES
('United States', 'A country in North America known for its diverse culture and economy.', 'Washington, D.C.', 'USD'),
('Canada', 'A country in North America known for its natural beauty and multicultural society.', 'Ottawa', 'CAD'),
('United Kingdom', 'A country in Europe consisting of England, Scotland, Wales, and Northern Ireland.', 'London', 'GBP'),
('Australia', 'A country and continent surrounded by the Indian and Pacific oceans.', 'Canberra', 'AUD'),
('Germany', 'A country in Central Europe known for its history, culture, and engineering.', 'Berlin', 'EUR'),
('France', 'A country in Western Europe known for its art, fashion, and cuisine.', 'Paris', 'EUR'),
('Japan', 'An island country in East Asia known for its technology and traditional culture.', 'Tokyo', 'JPY'),
('India', 'A country in South Asia known for its rich history and diverse culture.', 'New Delhi', 'INR'),
('Brazil', 'The largest country in South America known for its Amazon rainforest and carnival festival.', 'Brasília', 'BRL'),
('South Africa', 'A country at the southern tip of Africa known for its varied topography and cultural diversity.', 'Pretoria', 'ZAR');

-- select Querie
-- 1. select All column from the countries Table
select*from countries;

-- 2. select specific column
select name, capital_city from countries;

-- 3. select a country by name
select*from countries where name = 'India';

-- 4. select countries with a specific currency
select * from countries where currency = 'EUR';

-- 5. count the number of countries
select count(*) as total_countries from countries;

-- 6. select countries with a Description containing a specific word ------data madhun ek specific word haava tar he use karecha
select * from countries where description like '%culture%';

-- 7. select countries ordered by name
select * from countries order by name;

-- 8. select countries with a capital city starting with 'B'
select * from countries where capital_city like 'B%';

-- 9. select countries with more than 50 character in description
select * from countries where char_length(description) > 50;

-- 10. select the first 5 countries
select * from countries limit 5;

-- 11. select countries with currency name longer than 3 charaters
select * from countries where char_length(currency) > 3;

-- 12. select countries with a descrpition that does not contain 'country'
select * from countries where description not like '%country%';

-- 13. select the countries with longest name
select * from countries order by char_length(name) desc limit 1;

-- 14. select countrieswith description containing "known"
select * from countries where description like '%known%';

-- 15. select countries with capital city that is not 'ottawa'
select * from countries where capital_city != 'Ottawa';

-- 16. select the total number of unique currencies
select count(distinct currency) as unique_currencies from countries;

-- 17. Select Countries with Names that Have More than 6 Characters
SELECT * FROM countries WHERE CHAR_LENGTH(name) > 6;

-- 18. Select Countries Ordered by Currency
SELECT * FROM countries ORDER BY currency;

-- 19. Select Countries with a Description that is Not NULL
SELECT * FROM countries WHERE description IS NOT NULL;

-- 20. Select Countries with a Capital City Containing 'a'
SELECT * FROM countries WHERE capital_city LIKE '%a%';



