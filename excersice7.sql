use demojoins;

# Table 1
CREATE TABLE Employee (
    EmpID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    HireDate DATE
);

-- insert values
INSERT INTO Employee (EmpID, FirstName, LastName, Email, HireDate) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2020-05-10'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2019-08-15'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '2021-03-22'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '2018-11-30'),
(1, 'Chris', 'Davis', 'chris.davis@example.com', '2017-07-14'),
(6, 'Sarah', 'Wilson', 'sarah.wilson@example.com', '2022-01-25'),
(2, 'David', 'Martinez', 'david.martinez@example.com', '2016-04-18'),
(6, 'Anna', 'Garcia', 'anna.garcia@example.com', '2020-09-09'),
(9, 'James', 'Lopez', 'james.lopez@example.com', '2015-12-05'),
(10, 'Laura', 'Hernandez', 'laura.hernandez@example.com', '2023-06-20');
drop table departments;
select * from employee;
# Table 2
CREATE TABLE Departments (
    DepartID INT,
    DepartName VARCHAR(100) UNIQUE,
    ManagerID INT,
    Location VARCHAR(100),
    Budget DECIMAL(10,2)
);

-- insert values
INSERT INTO Departments (DepartID, DepartName, ManagerID, Location, Budget) VALUES
(1, 'HR', 2, 'New York', 50000.00),
(2, 'Finance', 4, 'Chicago', 80000.00),
(3, 'Engineering', 6, 'San Francisco', 120000.00),
(5, 'Marketing', 8, 'Los Angeles', 70000.00),
(5, 'Sales', 10, 'Houston', 90000.00),
(6, 'IT', 1, 'Seattle', 100000.00),
(3, 'Customer Support', 3, 'Miami', 60000.00),
(8, 'Legal', 5, 'Washington', 110000.00),
(9, 'Operations', 7, 'Boston', 95000.00),
(10, 'Research', 9, 'Denver', 105000.00);
select * from departments;

# Table 3
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmpID INT,
    BaseSalary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    PayDate DATE
);

-- insert values
INSERT INTO Salaries (SalaryID, EmpID, BaseSalary, Bonus, PayDate) VALUES
(1, 1, 60000.00, 5000.00, '2024-01-31'),
(2, 2, 65000.00, 6000.00, '2024-01-31'),
(3, 3, 70000.00, 7000.00, '2024-01-31'),
(4, 4, 75000.00, 5500.00, '2024-01-31'),
(5, 5, 80000.00, 7500.00, '2024-01-31'),
(6, 1, 85000.00, 8000.00, '2024-01-31'),
(7, 7, 90000.00, 8500.00, '2024-01-31'),
(8, 8, 95000.00, 9000.00, '2024-01-31'),
(9, 9, 100000.00, 9500.00, '2024-01-31'),
(10, 10, 105000.00, 10000.00, '2024-01-31');
select * from salaries;

# Table 4
CREATE TABLE JobTitle (
    JobID INT PRIMARY KEY,
    EmpID INT,
    JobTitle VARCHAR(100),
    DepartID INT,
    StartDate DATE
);

-- insert values
INSERT INTO JobTitle (JobID, EmpID, JobTitle, DepartID, StartDate) VALUES
(1, 1, 'HR Manager', 1, '2021-01-01'),
(2, 2, 'Finance Analyst', 2, '2020-06-15'),
(3, 3, 'Software Engineer', 3, '2021-07-20'),
(4, 4, 'Marketing Coordinator', 4, '2019-09-10'),
(5, 1, 'Sales Executive', 5, '2018-05-05'),
(6, 6, 'IT Administrator', 6, '2022-02-01'),
(7, 6, 'Customer Support Lead', 7, '2017-03-12'),
(8, 8, 'Legal Advisor', 8, '2020-11-25'),
(9, 9, 'Operations Manager', 9, '2016-12-30'),
(10, 10, 'Research Scientist', 10, '2023-07-10');
select * from employees;


-- 10 join Queries
-- 1.Inner Join
select salaries.empID, bonus
from salaries
inner join jobtitle on salaries.empID = jobtitle.empID;

-- 

-- yhagthd