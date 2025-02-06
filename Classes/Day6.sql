-- create the airline database if not exist
create  database if not exists airline;
use airline;    

-- Functions

/*
Function in MySql are predefined operations that can be used to perform calculations, manipulate data, and 
retrive specific information, These function make it easier to work with strings, numbers, date and more.

Functions---- 1.Bulid-in functions (sum(), avg(), count(), min max()...)
			  2.user defined functions.
              
They are categorized as follow based on their functionality

1.string function
These functions are used to manipulate and process string data. 
LENGTH(str): return the length of string.

CONCAT(str1, str2, ...): concatenates two or more string.

UPPER(str):converts a string to uppercase.

LOWER(str): converts a string to lowercase.

SUBSTRING(str,start,length): return a substring from string. 


2. Numeric functions
These function perform operation on numeric data. 
ROUND(number, decimal): rounds a number to specific number of decimal places. 

FLOOR(number): return the largest integer less than or equal to number. 

CEIL(number): return the smallest integer greater than or equal to number. 

ABS(Number): return the absolute value of number. 


3. Date and time functions
These functions are used to manipulate and format date and time values
NOW(): return the current date and time. 

CURDATE(): return the current date. 

DATE_FORMAT(date, format): formats a date according to specified format. 

DATEDIFF(date1, date2): return the difference in days between two date. 


4. Aggregate functions
Thses function perform calulatio on set of values and return a single values. 

COUNT(expression): return the number of rows that match a specified condition.

SUM(column): return the sum of numeric value.

AVG(column): return the average values.

MAX(column): return the maximum values. 

MIN(column): return the minimum values.


5. Control flow function
These function allow for conditional logic in sql queries.
If(condition, true_value, false_value): return one value if condition is true and another valuesif it is false. 

CASE: Provides a way to perform conditional logic in more complex manner. 


6. Conversion function
These function converts data from one type to another.
CAST(expression AS type): converts an expression to specified data type. 

CONVERT(expression, type); similar to CAST, but with different syntax. 


7. JSON functioon
These function are used to work with JSON doc. 
JSON_EXTRACT(json_doc, path): extracts data from JSON doc. 

JSON_ARRAYAGG(values): aggregates values into JSON array. 


8. User-Defined function
MySQL allows user to create their own function for specific tasks. 

*/




-- ---------------------------------------Talble Queries-----------------------------------------------
-- Table-1 Create Flights table
CREATE TABLE Flights (
  Flight_ID INT PRIMARY KEY, -- Unique identifier for each flight (Primary Key)
  Flight_Number VARCHAR(10) NOT NULL, -- Flight number (e.g., AA123) (Not Null)
  Departure_Airport VARCHAR(100) NOT NULL, -- Name of the departure airport (Not Null)
  Arrival_Airport VARCHAR(100) NOT NULL, -- Name of the arrival airport (Not Null)
  Departure_Time DATETIME NOT NULL, -- Scheduled departure time (Not Null)
  Arrival_Time DATETIME NOT NULL, -- Scheduled arrival time (Not Null)
  Flight_Duration INT NOT NULL, -- Duration of the flight in minutes (Not Null)
  Seats_Available INT NOT NULL CHECK (Seats_Available >= 0),
  -- Number of available seats (Not Null, must be non-negative)
  Aircraft_Type VARCHAR(50) NOT NULL, -- Type of aircraft used for the flight (Not Null)
  Status ENUM('On Time', 'Delayed', 'Cancelled') NOT NULL DEFAULT 'On Time'
  -- Current status of the flight (Not Null, default is 'On Time')
);


-- Insert Records into Flights Table

INSERT INTO Flights (Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport, Departure_Time, Arrival_Time, Flight_Duration, Seats_Available, Aircraft_Type, Status)
VALUES
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Bangalore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 'Boeing 737', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)', 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 'Boeing 737', 'On Time');

select *from Flights;


-- MySql Alias
/*
In mysql, an alias is temporary name assigned to table or a column for the duration of query 
(within the scope of a query). Alias are primarily used to enhance the readability and clarity of SQL statement,
making it easier for user to understand the purpose of the data being retrived or manipulated. 

Key points about mysql alias:
1. temporary nature:
alias exist only for the duration of query. Once the query execution is complete, the alias 
ceases to exist. 

2. Improved readability:
By using alias, you can simplify complex column name or provide more meaningful names that
better describe the data. This is particularly useful when dealing with long or complicated
column names.

syntax:
For column aliases, the syntax is:

SELECT column_name AS alias_name
FROM table_name;

For table aliases, 
the syntax is:
SELECT column_name
FROM table_name AS alias_name;

3. Usage in queries:
Aliases can be used in various SQL statement, including SELECT, UPDATE, and delete.
They can also be used in conjunction with aggregate function, joins and subqueries.


4. No impact on database structure:
Using an alias does not change the actual table or column names in database,
it only affects how they are referenced in query
*/

-- table alias
SELECT f.Flight_ID, f.Flight_number, f.Departure_Airport, f.Arrival_Airport
from flights f;

-- column alias
select f.flight_id AS ID, f.flight_number AS Num, f.Departure_Airport AS Departure,
f.arrival_airport AS Arrival from flights f; 



-- 1. WHERE clause queries
-- select flight where flight_id is 2,
select * from flights where flight_ID = '2';

-- select flight where 


-- 2.DISTINCT clause queries
-- select distinct aircraft type used in flights
select distinct aircraft_type from flights;

-- select distinct departure airports
select distinct departure_airport from flights;

-- select distinct flights status 
select distinct status from flights;

-- select distinct flights numbers
select distinct flight_number from flights;



-- 3.FROM clause queries
-- select flight number and statues from flights table
select flight_number, status from flights;

-- select departure and arrival airport from flight table
select departure_airport, arrival_airport from flights;

-- select all column from flights table where status is "on time"
select * from flights where status = 'on time';

-- select flight_id and duration from flight table
select flight_id, flight_duration from flights;



-- 4.ORDER BY clause queries
-- select all flight ordered by departure_time
select * from flights order by departure_time;

-- slect all flights ordered by flights_duration in desc order
select * from flights order by flight_duration desc;

-- select all flights ordered by seats_available
select * from flights order by seats_available;

-- select all flights ordered by status and then by departure_time
select * from flights order by status, departure_time;

-- select all flights ordered by arrival_time
select * from flights order by arrival_time;



-- 5.GROUP BY clause queries
-- group flights grouped by status
select status, count(*) as numberofFlights from flights group by status;

-- group flights by departure_airport and count them
select departure_airport, count(*) as numberofFlights from flights group by departure_airport;

-- group flights by arrival_airport and count them
select arrival_airport, count(*) as numberOFflights from flights group by arrival_airport;

-- group flights by aircraft_type and calculate average duration
select aircraft_type, avg(flight_duration) as averageDuration from flights group by aircraft_type;

-- group flights by departure_airport and calculate total available seats
 select departure_airport, sum(seats_available) as totalseats from flights group by departure_airport;
 
 -- group flights by status and calcualte maximum duration
 select status, max(flight_duration) as MaxDuration from flights group by status;
 
 -- group flights by arrival_airport and calculate minimum duration
 select arrival_airport, min(flight_duration) as minDuration from flights group by arrival_airport;
 
 -- group flights by aircraft_type and count distinct statuses
 select aircraft_type, count(distinct status) as DistinctStatusCount from flights group by aircraft_type;
 
 
 
 -- 6.HAVING clause queries
 -- select statuses with more than 5 flights
 select status, count(*) as numberofFlights from flights group by status having count(*) > 5;
 
 -- select departure airport with more than 3 flights
 select arrival_airport, count(*) as numberofFlights from flights group by arrival_airport having count(*) > 3;
 
 -- selct aircraft type with average flight duration greater than 120 min
 select aircraft_type, avg(flight_duration) as averageDuration from flights group by aircraft_type 
 having avg(flight_duration) > 120;
 
 -- select arrival _airport with less than 2 flights
 select arrival_airport, count(*) as numberOFflights from flights group by arrival_airport having count(*)< 2;
 
 -- select statuses with total of available seats greater than 200
 select status, sum(seats_available) as totalseats from flights group by status having sum(seats_available) > 200;

-- select flight number with more tahn 1 occurrence
select flight_number, count(*) as occurrence from flights group by flight_number having count(*) < 1; 



-- 7.LIMIT (or FETCH or TOP) clause
/*
In MySQL, the LIMIT clause is used to restrict the number of rows returned by a query. 
Unlike some other SQL databases (e.g., SQL Server or PostgreSQL) that use TOP or FETCH, 
MySQL exclusively supports LIMIT. 

Syntax for LIMIT

SELECT column1, column2, ...
FROM table_name
LIMIT [offset,] row_count;

Key Components:
1. row_count: Specifies the number of rows to return.
2. offset (optional): Specifies the starting point from which rows are returned. If omitted, 
the default is 0 (start from the first row).
3. LIMIT: Used to specify the maximum number of records to return.
4. Using LIMIT with a comma: An alternative way to specify both the offset and the limit in a single clause.
5. ROW_COUNT(): While not directly applicable, you can use SQL_CALC_FOUND_ROWS and FOUND_ROWS() to get the 
total count of rows.
*/

-- select the first 5 flights
select * from flights limit 5;

select * from flights limit 5 offset 2;

-- select the first 10 flights ordered by departure_time
select * from flights order by departure_time limit 10;

-- select the last 3 flights based on flight_id
select * from flights order by flight_id desc limit 3;

-- select the first 7 flights that are delayed
select * from flights where status = 'Delayed' limit 7;

-- select the first 5 flights departing from delhi
select * from flights where departure_airport = 'Delhi (DEL)' limit 5;

-- select first 5 flights with available seats greater than 50
select * from flights where seats_available > 50 limit 5;


-- 8.JOIN Clause

/*
Note - to join 2 or more table their 1 attributes must be common.

INNER JOIN: Returns records that have matching values in both tables.

LEFT JOIN: Returns all records from the left table (Flights) and the matched records from the right 
table (Bookings or Airlines). If there is no match, NULL values are returned for columns from the right table.

RIGHT JOIN: Returns all records from the right table (Bookings) and the matched records from the left table 
(Flights). If there is no match, NULL values are returned for columns from the left table.
*/


-- 9.UNION clause
/*
The UNION clause is used to combine the result of two or more select statement. 
Duplicates rows are removed by default
*/

-- 1.select flights from two different departure airport
select flight_id, flight_number, Departure_airport, arrival_airport from flights
where departure_airport = 'Delhi (DEL)'
union
select flight_id, flight_number, Departure_airport, arrival_airport from flights
where departure_airport = 'Mumbai (BOM)';

-- 2.select all delayed and cancelled flights
select flight_id, flight_number, status from flights
where status = 'Delayed'
union
select flight_id, flight_number, status from flights
where status = 'On Time';

-- 3. 


-- 10. INTO clause  (Mysql does not support into clause directly in this way)
-- create a new table to store flights with less than 50 avaliable seats
select flight_number, departure_airport
into new_flights_table from flights
where seats_avaliable < 50;

-- create a new table to store deatils of flights that are delayed
select flights_id, flights_number, arrival_airport
into delayed_flights from flights
where status = 'Delayed';

-- 


-- 11. CASE clause
-- select flights number and provide a description status message
select flight_number,
case 
	when status = 'on time' then 'Flight is on time'
	when status = 'Delayed' then 'Flight is delayed'
	else 'Flight is cancelled'
end as flight_status
from flights;

-- select flight number and categorize the
select flight_id, flight_number,
case
    when seats_available > 50 then 'Plenty of seats'
    when seats_available between 20 and 30 then 'limited seats'
    else 'Full'
end as Seats_status
from flights;

-- 


-- 12. IN clause
-- select all flights arrival at mumbai or delhi
select * from flights
where arrival_airport in ('Mumbai (BOM)', 'Delhi (DEL)');

-- select all flights departing from delhi, chennai, bangaolre
select * from flights
where departure_airport in ('delhi (DEL)', 'Chennai (MAA)', 'bangalore (BLR)');

-- 


-- 13.BETWEEN clause
-- select all flights with duration bet 120 and 150
select * from flights
where flight_duration between 120 and 150;

-- select flight that depart between 8AM and 12PM on oct1, 2023
select * from flights
where departure_time between '2023-10-01 08:00:00' and '2023-10-01 12:00:00';

-- select flight that aaival_time between 10AM and 2PM on oct1, 2023
select * from flights
where arrival_time between '2023-10-01 10:00:00' and '2023-10-01 14:00:00';

-- 


-- 14.LIKE clause
-- select all flight where flight_number starts from 'AI'
select * from flights where flight_number like 'AI%';

--


-- 15.EXISTS clause
-- select all flights where there exists at least one cancelled flight to the same arrival airport
select * from flights f
where exists (
            select 1
            from flights
            where status = 'Cancelled' and arrival_airport = f.arrival_airport
);

-- Select all flights where there exists at least one delayed flight from the same departure airport
select * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = 'Delayed' AND Departure_Airport = f.Departure_Airport
);

-- Select all flights where there exists at least one flight to the same destination with available seats
select * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport AND Seats_Available > 0
);

-- Select all flights where there exists at least one flight departing at the same time
select * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Departure_Time = f.Departure_Time
);

-- Select all flights where there exists at least one flight using the same aircraft type
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Aircraft_Type = f.Aircraft_Type
);

-- Select all flights where there exists at least one flight arriving at the same airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport
);

-- Select all flights where there exists at least one flight scheduled on the same day
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE DATE(Departure_Time) = DATE(f.Departure_Time)
);

-- Select all flights where there exists at least one flight with the same flight number
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Flight_Number = f.Flight_Number
);

-- Select all flights where there exists at least one flight with a similar duration (within 10 minutes)
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE ABS(Flight_Duration - f.Flight_Duration) <= 10
);

-- Select all flights where there exists at least one flight with the same status
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = f.Status
);




-- 16.AS clause
-- create a new table with flight details
create table flight_summery as
select flight_id, flight_number, departure_airport from flights;
select * from flight_summery;

-- select fight number and give them a custom alias
select flight_number as flightCode from flights;

-- Select flight duration in hours and give it a custom alias
Select Flight_Number, Flight_Duration / 60 AS Duration_Hours 
FROM Flights;

-- Select departure and arrival airports with custom aliases
Select Departure_Airport AS Departure, Arrival_Airport AS Arrival 
FROM Flights;

-- Select flight status and give it a custom alias
Select Flight_Number, Status AS Current_Status 
FROM Flights;

-- Create a new table with average flight duration per departure airport
CREATE TABLE Average_Flight_Duration AS 
Select Departure_Airport, AVG(Flight_Duration) AS Average_Duration 
FROM Flights 
GROUP BY Departure_Airport;

-- Select available seats and give it a custom alias
Select Flight_Number, Seats_Available AS Available_Seats 
FROM Flights;

-- Select flight ID and aircraft type with custom aliases
Select Flight_ID AS ID, Aircraft_Type AS Plane_Type 
FROM Flights;

-- Select flights with custom aliases for departure and arrival times
Select Flight_Number, Departure_Time AS Depart_Time, Arrival_Time AS Arrive_Time 
FROM Flights;

-- Create a new table summarizing flight status counts
CREATE TABLE Flight_Status_Summary AS 
Select Status AS Flight_Status, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Status;



-- -----------------------------------Task can be given ------------------------------
-- Add a column then write query to enter detail in column at a singel time
alter table flights add flight_status varchar(20);
select * from flights;

-- insert same values in table
update flights
set flight_status = 'Scheduled'
where Flight_ID in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

-- insert different values in table
update flights 
set flight_status =
				case
                    when Flight_ID in (1,2,3) then 'scheduled'
                    when Flight_ID in (4,5) then 'Departed'
                    when Flight_ID in (6,11,13) then 'Arrival'
                    when Flight_ID in (7) then 'Delayed'
                    when Flight_ID in (8,15,14) then 'Cancelled'
                    when Flight_ID in (9) then 'Diverted'
                    when Flight_ID in (10) then 'held'
                    else 'unknown'
				end 
                where Flight_ID in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
                
           
           
           
-- Arithmetic operators: +, -, *, /, %

-- calculate the total flight duration for flight AI101, adding 30 min for layover
select flight_number, flight_duration + 30 as total_duration
from flights
where flight_number ='AI101';

-- calculate the remaining seats after booking 10 seats for flight AI102
select flight_number, seats_available - 10 as remaining_seats
from flights
where flight_number='AI102';



-- Comparison operators: =, <, >, <=, >=, != or <> (not equal to)

-- select all detail for flights with flight_number "AI101"
select * from flights
where flight_id = 'AI101';

-- select all flights with duration less than 120 min
select * from flights
where flight_duration < 120;       -- using '<' operator


 
 
 -- logical operator
 -- select flight from delhi to mumbai that are on time and have available seats
 select * from flights
 where departure_airport = 'Delhi (DEL)'
 and arrival_airport = 'Mumbai (BOM)'
 and status = 'On time'
 and seats_available > 0;
 
 -- find flights that either depart from delhi or arrival in delhi
 select * from flights
 where departure_airport = 'Delhi (DEl)'
 or arrival_airport = 'Delhi (DEL)';
 
 
 
 
 -- string operator: LIKE, REGEXP, NOT LIKE
 
 -- find flights with flights number starting with 'AI'
 select * from flights
 where Flight_number like 'AI%';
 
 -- find flights taht have 'DELHI' in either of departure or arrival
 select * from flights
 where departure_airport regexp 'delhi'
 or arrival_airport regexp 'delhi';
 
 -- find flights that do not go to chennai
 select * from flights
 where arrival_airport not like 'Chennai (MAA)';
 
 
 
 
 