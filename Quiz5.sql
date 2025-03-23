-- MySql Quiz-5 

/*
1. create a database - Travel Agency
2. create 3 tables using min 5 attribute, 10 records and use all possible datatype and constraint
3. Do proper documentation and avoid internet, discussion or any reference
4. write complex and misleneous queries using-
   a. DDL, DML, DQL, DCL & TCL, operaters, indexing, clauses & commands, Cascades
   b. functions (build_in & user-define)
   c. views & CTE {5}
   d. stored procedure {5}
   e. joins & alias {5}
   f. subqueries {10}
   g. Triggers {5}
   h. windows function {5}
*/

-- 1. creating a database
CREATE DATABASE IF NOT EXISTS TravelAg;

-- use the created database
USE TravelAg;


-- 2. Create 3 tables with 10 values 
-- Customer Table
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
PhoneNumber VARCHAR(15)
);

-- Insert values
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber) VALUES
('Yash', 'D', 'yash@email.com', '123-456-7890'),
('Om', 'S', 'om.s@email.com', '987-654-3210'),
('Payal', 'J', 'payal.j@email.com', '555-123-4567'),
('Anagha', 'D', 'anagha.d@email.com', '444-987-6543'),
('Max', 'W', 'max.w@email.com', '222-333-4444'),
('Ayush', 'B', 'ayush.b@email.com', '111-222-3333'),
('Jitesh', 'T', 'jitesh.t@email.com', '666-777-8888'),
('Laura', 'A', 'laura.a@email.com', '999-000-1111'),
('Robert', 'M', 'robert.m@email.com', '123-987-6540'),
('via', 'G', 'via.g@email.com', '555-666-7777');
    

-- Trips table
CREATE TABLE Trips (
TripID INT PRIMARY KEY AUTO_INCREMENT,
Destination VARCHAR(100),
StartDate DATE,
EndDate DATE,
Price DECIMAL(10, 2)
);    

-- Insert values
INSERT INTO Trips (Destination, StartDate, EndDate, Price) VALUES
('Paris, France', '2024-06-01', '2024-06-10', 1500.00),
('Tokyo, Japan', '2024-07-05', '2024-07-15', 2000.00),
('New York, USA', '2024-08-10', '2024-08-20', 1800.00),
('Sydney, Australia', '2024-09-01', '2024-09-10', 2200.00),
('Cairo, Egypt', '2024-10-15', '2024-10-25', 1600.00),
('Rome, Italy', '2024-11-05', '2024-11-15', 1700.00),
('Bali, Indonesia', '2024-12-01', '2024-12-10', 1400.00),
('Cape Town, South Africa', '2025-01-15', '2025-01-25', 1900.00),
('Rio de Janeiro, Brazil', '2025-02-10', '2025-02-20', 2100.00),
('Barcelona, Spain', '2025-03-05', '2025-03-15', 1750.00);


-- Bookings table
CREATE TABLE Bookings (
BookingID INT PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
TripID INT,
BookingDate DATE,
Status ENUM('Confirmed', 'Pending', 'Cancelled'),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (TripID) REFERENCES Trips(TripID)
);

-- Insert values
INSERT INTO Bookings (CustomerID, TripID, BookingDate, Status) VALUES
(1, 1, '2024-04-01', 'Confirmed'),
(2, 2, '2024-04-05', 'Confirmed'),
(3, 3, '2024-04-10', 'Pending'),
(4, 4, '2024-04-15', 'Cancelled'),
(5, 5, '2024-04-20', 'Confirmed'),
(6, 6, '2024-04-25', 'Pending'),
(7, 7, '2024-05-01', 'Confirmed'),
(8, 8, '2024-05-05', 'Confirmed'),
(9, 9, '2024-05-10', 'Cancelled'),
(10, 10, '2024-05-15', 'Pending');



-- 4. Write complex and misleneous queries..
-- 1.
select * from Bookings;     -- DQL querie
-- 2. 
select * from Trips;         -- DQL querie
select * from customers;

-- 3. Add a column  
ALTER TABLE Trips                 -- DDL Querie
ADD COLUMN Description text;

-- 4. modify the PhoneNumber
ALTER TABLE Customers                -- DDL querie
MODIFY PhoneNumber VARCHAR(20);

-- 3. Delete a customer by ID          --DML querie
DELETE FROM Customers
WHERE CustomerID = 10;

-- 6. update the booking column
UPDATE Bookings                        -- DML querie
SET Status = 'Confirmed'
WHERE BookingID = 3;

-- 7. Start a transaction, insert a booking, then commit        
START TRANSACTION;                                                       -- TCL querie
INSERT INTO Bookings (CustomerID, TripID, BookingDate, Status)
VALUES (1, 2, '2024-06-01', 'Pending');
COMMIT;

-- 8. Start a transaction, delete a booking, then rollback           -- TCL querie
START TRANSACTION;
DELETE FROM Bookings WHERE BookingID = 5;
ROLLBACK;

-- 9. Grant SELECT and INSERT permissions to a user                     -- DCL querie
GRANT SELECT, INSERT ON TravelAgency.* TO 'agent_user'@'localhost';

-- 10. Revoke DELETE permission from a user                               -- DCL querie
REVOKE DELETE ON TravelAgency.* FROM 'agent_user'@'localhost';

-- 11. Find trips that cost more than 2000                            -- operators
SELECT Destination, Price, (EndDate - StartDate) AS TripDuration 
FROM Trips WHERE Price > 2000.00;

-- 12. Find trips with prices between 1500 and 2000
SELECT Destination, Price FROM Trips
WHERE Price BETWEEN 1500 AND 2000;

-- 13. Count the number of bookings for each trip            -- Group By clause
SELECT TripID, COUNT(BookingID) AS TotalBookings
FROM Bookings GROUP BY TripID;

-- 14. Show trips that have more than 2 bookings            -- Having clause
SELECT TripID, COUNT(BookingID) AS TotalBookings
FROM Bookings GROUP BY TripID
HAVING COUNT(BookingID) > 2;

-- 15. Create an index on the Customers                    -- Index
CREATE INDEX idx_email ON Customers (Email);

-- 16. Create a index on Bookings for CustomerID and TripID         -- Index
CREATE INDEX idx_customer_trip ON Bookings (CustomerID, TripID);

-- 17. drop & truncate the table
DROP TABLE Trips;
TRUNCATE bookings;

-- 18. show the created table
SHOW tables;



-- Functions (Build-In & User-defined)
-- 1. Get the total number of bookings 
SELECT COUNT(*) AS TotalBookings FROM Bookings;

-- 2. Find the average trip price 
SELECT MAX(Price) AS MaximinPrice FROM Trips;

-- 3. Convert customer names to uppercase
SELECT UPPER(FirstName) AS UpperFirstName, UPPER(LastName) AS UpperLastName FROM Customers;

-- 4. Calculate the trip duration in day
SELECT Destination, DATEDIFF(EndDate, StartDate) AS TripDuration FROM Trips;

-- 5. Get the current date and time 
SELECT NOW() AS CurrentDateTime;

-- 6. Create a function to get full name of a customer
DELIMITER //
CREATE FUNCTION GetFullName(custID INT)
RETURNS VARCHAR(100)
BEGIN
    DECLARE fullName VARCHAR(100);
    SELECT CONCAT(FirstName, ' ', LastName) INTO fullName
    FROM Customers WHERE CustomerID = custID;
    RETURN fullName;
END //
DELIMITER ;

-- 7. Create a function to get trip duration
DELIMITER //
CREATE FUNCTION TripDuration(tripID INT)
RETURNS INT
BEGIN
    SELECT DATEDIFF(EndDate, StartDate) INTO duration FROM Trips WHERE TripID = tripID;
    RETURN duration;
END //
DELIMITER ;

-- 8. Create a function to check booking status
DELIMITER //
CREATE FUNCTION CheckBookingStatus(bookingID INT)
RETURNS VARCHAR(20)
BEGIN
    SELECT Status INTO status FROM Bookings WHERE BookingID = bookingID;
    RETURN status;
END //
DELIMITER ;

-- 9. Create a function to calculate discounted trip price
DELIMITER //
CREATE FUNCTION DiscountedPrice(tripID INT, discount DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
BEGIN
    SELECT Price INTO originalPrice FROM Trips WHERE TripID = tripID;
    RETURN originalPrice - (originalPrice * discount / 100);
END //
DELIMITER ;



-- Views & CTE
-- 1. View to show all customers
CREATE VIEW CustomerDetails AS
SELECT FirstName, LastName, Email
FROM Customers;

-- 2. View to list all trips with destination and price
CREATE VIEW TripList AS
SELECT Destination, Price
FROM Trips;

-- 3. View to show confirmed bookings only
CREATE VIEW ConfirmedBookings AS
SELECT BookingID, CustomerID, TripID, BookingDate FROM Bookings
WHERE Status = 'Confirmed';

-- 4. View to show all bookings with customer names
CREATE VIEW BookingWithCustomers AS
SELECT B.BookingID, C.FirstName, C.LastName, B.BookingDate, B.Status
FROM Bookings B
JOIN Customers C ON B.CustomerID = C.CustomerID;

-- 5. View to count total bookings per trip
CREATE VIEW TripBookingCount AS
SELECT TripID, COUNT(BookingID) AS TotalBookings
FROM Bookings
GROUP BY TripID;

-- 6. CTE to find customers who booked more than once
WITH FrequentCustomers AS (
    SELECT CustomerID, COUNT(*) AS BookingCount
    FROM Bookings
    GROUP BY CustomerID
    HAVING COUNT(*) > 1
)
SELECT C.FirstName, C.LastName, FC.BookingCount
FROM FrequentCustomers FC;

-- 7. CTE to get trips with prices above the average
WITH ExpensiveTrips AS (
    SELECT TripID, Destination, Price
    FROM Trips
    WHERE Price > (SELECT AVG(Price) FROM Trips)
)
SELECT * FROM ExpensiveTrips;

-- 8. CTE to list customers with pending bookings
WITH PendingBookings AS (SELECT CustomerID FROM Bookings
WHERE Status = 'Pending'
)
SELECT C.FirstName, C.LastName
FROM Customers C;

-- 9. CTE to calculate total revenue from each trip
WITH TripRevenue AS (SELECT TripID, SUM(T.Price) AS TotalRevenue
FROM Bookings B
JOIN Trips T ON B.TripID = T.TripID
WHERE B.Status = 'Confirmed'
GROUP BY TripID
)
SELECT T.Destination, TR.TotalRevenue
FROM TripRevenue TR;

-- 10. CTE to find the most recent booking for each customer
WITH RecentBooking AS (SELECT CustomerID, MAX(BookingDate) AS LastBooking
FROM Bookings
GROUP BY CustomerID
)
SELECT C.FirstName, C.LastName, RB.LastBooking
FROM RecentBooking RB;



-- Stored Procedure
-- 1. Procedure to get all customers
DELIMITER //
CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM Customers;
END //
DELIMITER ;

-- Call the procedure:
CALL GetAllCustomers();


-- 2. Procedure to add a new customer
DELIMITER //
CREATE PROCEDURE AddCustomer(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_PhoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
    VALUES (p_FirstName, p_LastName, p_Email, p_PhoneNumber);
END //
DELIMITER ;

-- Call the procedure:
CALL AddCustomer('Alice', 'Johnson', 'alice@email.com', '123-456-7890');



## Triggers
-- 1. Trigger to log new bookings into a log table
CREATE TABLE BookingLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    LogMessage TEXT,
    LogDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER AfterBookingInsert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    INSERT INTO BookingLog (BookingID, LogMessage)
    VALUES (NEW.BookingID, CONCAT('New booking added with ID: ', NEW.BookingID));
END;
//DELIMITER ;

-- 2. Trigger to show msg on negative prices
DELIMITER //
CREATE TRIGGER BeforeTripInsert
BEFORE INSERT ON Trips
FOR EACH ROW
BEGIN
    IF NEW.Price < 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Price cannot be negative';
    END IF;
END;
//DELIMITER ; 

-- 3. Trigger to set booking status to 'Pending' on new bookings
DELIMITER //
CREATE TRIGGER BeforeBookingInsert
BEFORE INSERT ON Bookings
FOR EACH ROW
BEGIN
    IF NEW.Status IS NULL THEN
	SET NEW.Status = 'Pending';
    END IF;
END;
//DELIMITER ;



-- Joins & Alias
-- 1. Inner Join:
SELECT C.FirstName, C.LastName, B.BookingID, B.Status
FROM Customers C
INNER JOIN Bookings B ON C.CustomerID = B.CustomerID;

-- 2. Left Join: 
SELECT C.FirstName, C.LastName, B.Status
FROM Customers C
LEFT JOIN Bookings B ON C.CustomerID = B.CustomerID;

-- 3. Right Join:
SELECT T.Destination, B.CustomerID
FROM Trips T
RIGHT JOIN Bookings B ON T.TripID = B.TripID;

-- 4. Join with three tables:
SELECT C.FirstName, C.LastName, T.Destination, B.BookingDate, B.Status
FROM Bookings B
JOIN Customers C ON B.CustomerID = C.CustomerID
JOIN Trips T ON B.TripID = T.TripID;

-- 5. Self Join: 
SELECT A.CustomerID AS Customer1, B.CustomerID AS Customer2, A.PhoneNumber
FROM Customers A
JOIN Customers B ON A.PhoneNumber = B.PhoneNumber AND A.CustomerID <> B.CustomerID;



-- Window Functions
-- 1. using ROW_NUMBER()
SELECT TripID, Destination,
ROW_NUMBER() OVER (PARTITION BY Destination ORDER BY price DESC) AS ranks
FROM Trips;

-- 2. using dense_rank
SELECT TripID, Destination,
dense_rank() OVER (PARTITION BY Destination ORDER BY price DESC) AS dense_ranks
FROM Trips;

-- 3.Using NTILE
SELECT TripID, startDate, price,
NTILE(2) OVER (ORDER BY price) AS price_div
FROM Trips;



-- subqueries
-- 1. Find trips with a price above the average price
SELECT Destination, Price FROM Trips
WHERE Price > (SELECT AVG(Price) FROM Trips);

-- 2. Find trips with price greater than 2000
SELECT Destination, Price FROM Trips
WHERE Price IN (SELECT Price FROM Trips WHERE price > 2000);

-- 3. Show customers who have no bookings
SELECT FirstName, LastName FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Bookings);

-- 4. List all bookings for trips costing more than $2,000:
SELECT BookingID, CustomerID, TripID, BookingDate FROM Bookings
WHERE TripID IN (SELECT TripID FROM Trips WHERE Price > 2000);

-- 5. Find the total number of bookings for each trip:
SELECT Destination, (SELECT COUNT(*)FROM Bookings B WHERE B.TripID = T.TripID) AS TotalBookings
FROM Trips T;

-- 6. Get the most recent booking
SELECT Destination FROM Trips 
WHERE TripID = (SELECT TripID FROM Bookings ORDER BY BookingDate DESC LIMIT 1);

-- 7. Get customers who booked the most expensive trip
SELECT FirstName, LastName FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Bookings WHERE TripID =
(SELECT TripID FROM Trips ORDER BY Price DESC LIMIT 1)
);

