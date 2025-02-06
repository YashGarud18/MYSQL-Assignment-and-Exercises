create database xyzcollege;

use xyzcollege;

-- Foreigen key
# Delete and update cascade

/*What are foreign keys?
A foregin key is field in one table that links to the primary key of another table.
It create a relationship between two tables*/

/*Delete Cascade
A delete cascade means that when a record in parent table
(the table with primary key) is deleted, all corresponding records in
child table (the table with foreign key) will also be deleted automatically */

/*Update cascade
An update cascade means that when the primary key of records in the 
parent table is updated, all corresponding foreign keys in child table
will also be updated automatoically*/

-- Create 5 table (Department, Faculty, Student, Marks and Salary)

-- table-1
create table Department(
DepartmentID int primary key,
DepartmentName varchar(100) not null,
DepartmentHead varchar(100),
CreationDate date not null,
Budget decimal(15, 2) check (Budget >=0),
Location varchar(100),
phoneNo varchar(15),
Email varchar(50) unique,
status enum('Active', 'Inactive') default 'Active'
);

-- Insert values into table
insert into Department (DepartmentID, DepartmentName, DepartmentHead, CreationDate, Budget, Location, phoneNo, Email, Status) 
values
(1, 'Computer Science', 'Dr. Aditi Joshi', '2015-08-01', 600000.00, 'Main Campus', '022-12345678', 'cs@mumbaiuniversity.edu', 'Active'),
(2, 'Mechanical Engineering', 'Dr. Rohan Mehta', '2016-07-15', 550000.00, 'Engineering Block', '022-23456789', 'mech@mumbaiuniversity.edu', 'Active'),
(3, 'Civil Engineering', 'Dr. Priya Sharma', '2017-09-10', 500000.00, 'Engineering Block', '022-34567890', 'civil@mumbaiuniversity.edu', 'Active'),
(4, 'Electrical Engineering', 'Dr. Vikram Singh', '2018-01-20', 520000.00, 'Engineering Block', '022-45678901', 'electrical@mumbaiuniversity.edu', 'Inactive'),
(5, 'Information Technology', 'Dr. Neha Gupta', '2019-03-05', 480000.00, 'IT Building', '022-56789012', 'it@mumbaiuniversity.edu', 'Active'),
(6, 'Business Administration', 'Dr. Sanjay Rao', '2014-11-11', 700000.00, 'Management Building', '022-67890123', 'business@mumbaiuniversity.edu', 'Active'),
(7, 'Psychology', 'Dr. Anjali Verma', '2020-02-25', 300000.00, 'Arts Block', '022-78901234', 'psychology@mumbaiuniversity.edu', 'Active'),
(8, 'Economics', 'Dr. Karan Desai', '2018-06-30', 350000.00, 'Social Sciences Building', '022-89012345', 'economics@mumbaiuniversity.edu', 'Inactive'),
(9, 'Mathematics', 'Dr. Sneha Patil', '2016-04-15', 400000.00, 'Science Block', '022-90123456', 'maths@mumbaiuniversity.edu', 'Active'),
(10, 'History', 'Dr. Amit Bhatia', '2015-12-01', 250000.00, 'Arts Block', '022-01234567', 'history@mumbaiuniversity.edu', 'Active');

select * from department;


-- Table-2
create table faculty(
faculty_id int primary key,
facultyName varchar(100),
DepartmentID int,
HireDate date not null,
Email varchar(100) unique not null,
PhoneNo varchar(15),

-- Here enum is string doject
Position enum('Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer')not null,      -- position of faculty member
foreign key (DepartmentID) references Department(DepartmentID) 
on delete set null                          -- if department is deleted, set faculty departmentID to null
on update cascade                         -- if departmentID is updated, update it in faculty    
);

-- insert values into table
insert into faculty (faculty_id, facultyName, DepartmentID, HireDate, Email, PhoneNo, Position) 
values
(1, 'Dr. Aditi Sharma', 1, '2015-08-01', 'aditi.sharma@mumbaiuniversity.edu.in', '9876543210', 'Professor'),
(2, 'Prof. Rajesh Mehta', 2, '2016-09-15', 'rajesh.mehta@mumbaiuniversity.edu.in', '8765432109', 'Associate Professor'),
(3, 'Dr. Neha Patil', 3, '2018-01-10', 'neha.patil@mumbaiuniversity.edu.in', '7654321098', 'Assistant Professor'),
(4, 'Mr. Amit Desai', 1, '2020-07-20', 'amit.desai@mumbaiuniversity.edu.in', '6543210987', 'Lecturer'),
(5, 'Dr. Kavita Joshi', 2, '2017-05-25', 'kavita.joshi@mumbaiuniversity.edu.in', '5432109876', 'Professor'),
(6, 'Prof. Sanjay Kulkarni', 3, '2019-11-11', 'sanjay.kulkarni@mumbaiuniversity.edu.in', '4321098765', 'Associate Professor'),
(7, 'Ms. Pooja Nair', 4, '2021-06-30', 'pooja.nair@mumbaiuniversity.edu.in', '3210987654', 'Assistant Professor'),
(8, 'Dr. Ramesh Bhat', 5, '2014-03-15', 'ramesh.bhat@mumbaiuniversity.edu.in', '2109876543', 'Professor'),
(9, 'Mr. Vikram Singh', 4, '2022-02-01', 'vikram.singh@mumbaiuniversity.edu.in', '1098765432', 'Lecturer'),
(10, 'Dr. Sneha Iyer', 5, '2020-12-12', 'sneha.iyer@mumbaiuniversity.edu.in', '0987654321', 'Associate Professor');

select * from faculty;


-- Table-3
-- Table:students
create table students(
studentID int primary key,
studentName varchar(100) not null,
DepartmentID int,                        -- This field links to the depatment table to indicate the student dapartment
EnrollmentDate date not null,             -- This field records the date the student enrolled in university
Email varchar(100) unique not null,        -- email is unique of every stud so we use "unique"
PhoneNo varchar(15),
DateOfBirth date,
Address varchar(255),

-- Check constraint for validating email format (basic validation)
constraint chk_EmailFormat check (Email like '%_@__%.__%'),   
/*This ensure that the email address contain at least one character before the " @ "
  at least two character after "@", nad at least one "." after the "@"*/
  
foreign key (DepartmentID) references Department(DepartmentID)
on delete set null                       -- if department is deleted, set faculty departmentID to null
on update cascade                           -- if departmentID is updated, update it in students    
);

-- insert values
INSERT INTO students (studentID, studentName, DepartmentID, EnrollmentDate, Email, PhoneNo, DateOfBirth, Address) 
VALUES
(1, 'Aditi Sharma', 1, '2023-08-01', 'aditi.sharma@example.com', '9876543210', '2005-06-15', '123, Marine Drive, Mumbai'),
(2, 'Rahul Desai', 2, '2023-08-01', 'rahul.desai@example.com', '9876543211', '2004-05-20', '456, Juhu Beach, Mumbai'),
(3, 'Sneha Patil', 1, '2023-08-01', 'sneha.patil@example.com', '9876543212', '2005-07-30', '789, Bandra, Mumbai'),
(4, 'Vikram Joshi', 3, '2023-08-01', 'vikram.joshi@example.com', '9876543213', '2004-02-10', '321, Andheri, Mumbai'),
(5, 'Priya Iyer', 2, '2023-08-01', 'priya.iyer@example.com', '9876543214', '2005-04-25', '654, Powai, Mumbai'),
(6, 'Rohit Mehta', 3, '2023-08-01', 'rohit.mehta@example.com', '9876543215', '2004-11-11', '987, Thane, Mumbai'),
(7, 'Neha Gupta', 1, '2023-08-01', 'neha.gupta@example.com', '9876543216', '2005-12-01', '159, Dadar, Mumbai'),
(8, 'Karan Singh', 2, '2023-08-01', 'karan.singh@example.com', '9876543217', '2004-09-15', '753, Malad, Mumbai'),
(9, 'Anjali Verma', 3, '2023-08-01', 'anjali.verma@example.com', '9876543218', '2005-03-05', '852, Borivali, Mumbai'),
(10, 'Siddharth Rao', 1, '2023-08-01', 'siddharth.rao@example.com', '9876543219', '2004-01-20', '963, Ghatkopar, Mumbai');

select * from students;


-- Table-4
-- table:marks
create table marks(
MarkID int primary key,
StudentID int,
FacultyID int,               -- This field links to faculty table to indicate which faculty member graded the marks
subject varchar(100) not null,
MarksObtained int check (MarksObtained >=0 and MarksObtained <=100),
ExamDate date,
foreign key (StudentID) references students(studentID)
on delete set null                       -- if student is deleted, their marks will aslo be deleted
on update cascade,                           -- if studentID is updated, update it in marks

foreign key (FacultyID) references faculty(faculty_id)
on delete set null                       -- if faculty member is deleted, set faculty faultyID to null
on update cascade                           -- if facultyID is updated, update it in marks
);

-- insert values 
insert into marks (MarkID, StudentID, FacultyID, subject, MarksObtained, ExamDate) 
values
 (1, 1, 1, 'Mathematics', 85, '2023-05-15'),   -- Student 1
 (2, 2, 2, 'Physics', 78, '2023-05-16'),        -- Student 2
 (3, 3, 3, 'Chemistry', 92, '2023-05-17'),      -- Student 3
 (4, 4, 4, 'Biology', 88, '2023-05-18'),        -- Student 4
 (5, 5, 5, 'Computer Science', 95, '2023-05-19'), -- Student 5
 (6, 6, 6, 'English', 76, '2023-05-20'),        -- Student 6
 (7, 7, 7, 'History', 84, '2023-05-21'),        -- Student 7
 (8, 8, 8, 'Geography', 90, '2023-05-22'),      -- Student 8
 (9, 9, 9, 'Economics', 70, '2023-05-23'),      -- Student 9
 (10, 10, 10, 'Political Science', 82, '2023-05-24'); -- Student 10
 
 select*from marks;
 
 
 -- Table-5
 -- Table:salary
 create table salary(
 SalaryID int primary key,
 FacultyID int,
 SalaryAmount decimal(10,2) check (SalaryAmount >=0),           
 -- This field records the amount of salary paid to faculty member, must be non-negative
 PaymentDate date not null,
 PaymentMethod varchar(50),                     -- method of payment(e.g, bank transfer, cash, etc.)
 foreign key (FacultyID) references faculty(faculty_id)
 on delete set null                         -- if faculty member is deleted, their salary record is delete
 on update cascade                           -- if facultyID is updated, update it in salary
);

-- insert values into table
insert into salary (SalaryID, FacultyID, SalaryAmount, PaymentDate, PaymentMethod) 
VALUES
(1, 1, 50000.00, '2023-06-30', 'Bank Transfer'),    -- Faculty 201
(2, 2, 55000.00, '2023-06-30', 'Cash'),              -- Faculty 202
(3, 3, 60000.00, '2023-06-30', 'Bank Transfer'),    -- Faculty 203
(4, 4, 52000.00, '2023-06-30', 'Cheque'),            -- Faculty 204
(5, 5, 51000.00, '2023-07-30', 'Bank Transfer'),    -- Faculty 201
(6, 2, 53000.00, '2023-07-30', 'Cash'),              -- Faculty 202
(7, 3, 59000.00, '2023-07-30', 'Bank Transfer'),    -- Faculty 203
(8, 4, 54000.00, '2023-07-30', 'Cheque'),            -- Faculty 204
(9, 1, 52000.00, '2023-08-30', 'Bank Transfer'),    -- Faculty 201
(10, 2, 55000.00, '2023-08-30', 'Cash');              -- Faculty 202

 select * from salary;
 
 
 -- perform delete and update opreation 
 -- delete a department   (e.g: department = 1)
 delete from department where departmentID = 1;
 delete from department where departmentID = 4;
 
 -- check the faculty and student table to see the effects
 select * from faculty;      -- departmentID for faculty in department 1 should be null
 select * from students;      -- departmentID for student in department 1 should be null
 
 -- delete a faculty member  (e.g: facultyID = 1)
 delete from faculty where faculty_id = 1;
 
 -- check the salary table to see if the salary record for faculty_id = 1 is deleted
 select * from salary;            -- salary record for faculty_id 1 should be gone
 
 -- check the marks table to see effect
 select * from marks;           -- faculty_id for marks graded by faculty_id 1 should be null
 
 -- update a department Id   (e.g: change departmentID from 2 to 20)
 update department set departmentID = 20
 where departmentID = 2;
 
 -- check the faculty and student table to see the effects
 select * from faculty;      -- departmentID for faculty in department 2 should be 20
 select * from students;      -- departmentID for student in department 2 should be 20
 
 -- update faculty id  (e.g:change facultyID from 3 to 30)
 update faculty set faculty_id = 30
 where faculty_id =3;
 
 -- check the marks and salary table to see the effects
 select * from marks;      -- departmentID for faculty in department 2 should be 20
 select * from salary;      -- departmentID for student in department 2 should be 20
 
 /*
 In MySql you can add and drop constraint on exciting table using the alter table statement
 Adding constraint
 
 1.Adding a forgein key constraint:
 you can add a foregin key constraint to an existing table to enforce reference interity. 
 
 2.Adding a unique constraint:
 You can add a unique constraint to ensure that all values in column are different
 
 3.Adding check constraint
 you can add a check constraint to enforce a condition on value in column
 
 
 Dropping constraint
 
 1.Dropping a foreign key constraint:
 You can drop a foregin key constraint if you no longer need it
 
 2.Dropping a unique constraint
 you can drop unique constarint if you want to allow duplicate values in column
 
 3.Dropping a check constraint
 You can drop check constraint if you want to remove the condition on column
 */
 
 -- 1.Adding a foreign key constraint to marks table
 alter table marks
 add constraint fk_student
 foreign key (studentID) references students(studentID)
 on delete cascade
 on update cascade;
 
 -- 2.Adding a unique constraint to faculty table on email
 alter table faculty
 add constraint uq_faculty_email unique (email);
 
-- 3.Adding a check constraint to salary table to ensure salaryAmount is position
alter table salary
add constraint chk_salary_amount check (salaryAmount>0);

-- 4.dropping a foreign key constraint from marks table
alter table marks
drop foreign key fk_student;

-- 5.dropping a unique constraint from faculty table
alter table faculty
drop index uq_faculty_email;

-- 6.dropping a check constraint from salary table
alter table salary
drop check chk_salary_amount;

-- 7.adding a new check constraint to student table to ensure age is valid
alter table students
add constraint chk_age check (year(curdate()) - year(DateOfBirth) >= 0);

-- 8.dropping the check constraint from the student table
alter table students
drop  check chk_age;



/*
What the OPERATERS IN sql?

operators in mysql are special symbols or keywords used to perform opertions on one or more operands
(values, expression, fields) in mysql.It helps in computation, comparision, logical evaluations, string concatenation
and many more. 

1.Arithematic operators-

+ : addition
- : subtraction
* : multiplication
/ : division
% : modulus (remainder after division)
DIV : interger division (return integer part of division)
MOD : modulus (same as %)

2.Comparison operators

= : equal to
<> or != : not equal to
> : greater than
< : less than
>= : greater than equal to
<= : less than equal to
LIKE : pattern matching using wildcard (% and _)
NOT LIKE : pattern not matching 
REGEXP : regualr expression matching
NOT REGEXP : regualr exprssion not matching

3.Logical operators

AND : logical AND (true if both condition are true)
OR : logical OR (true if at least one condition is true)
NOT : logical NOT (negates the condition)
XOR : logical exclusive OR (true if only one condition is true)

4. Assignment Operators

=: Assign a value to a variable or column
:=: Assign a value to a user-defined variable
+=: Addition assignment (not standard in MySQL but used in some cases)
-=: Subtraction assignment
*=: Multiplication assignment
/=: Division assignment
%=: Modulus assignment
DIV=: Integer division assignment
MOD=: Modulus assignment


5. Bitwise Operators

&: Bitwise AND
|: Bitwise OR
^: Bitwise XOR
~: Bitwise NOT (inverts the bits)
<<: Left shift
>>: Right shift


6. String Operators

CONCAT(): Concatenate strings (e.g., CONCAT('Hello', ' World'))
||: String concatenation (alternative to CONCAT in some MySQL versions)


7. Other Operators

IN: Membership test (checks if a value exists in a list or subquery)
NOT IN: Membership test (checks if a value does not exist in a list or subquery)
BETWEEN: Range test (checks if a value is within a range)
NOT BETWEEN: Range test (checks if a value is outside a range)
IS NULL: Null test (checks if a value is NULL)
IS NOT NULL: Null test (checks if a value is not NULL)
EXISTS: Subquery test (true if subquery returns any rows)
NOT EXISTS: Subquery test (true if subquery returns no rows)


Why Are Operators Important in MySQL?
Simplify Query Logic: Operators make it easy to specify conditions and manipulate data directly in SQL statements.
Dynamic Data Retrieval: Help fetch specific records based on comparisons and logical conditions.
Data Manipulation: Arithmetic and string operators allow dynamic computation and formatting of data.
Efficient Filtering: Operators like LIKE and BETWEEN enable precise filtering for large datasets.


These operators cover a wide range of functionality, from basic arithmetic to advanced logical and 
string manipulations, enabling efficient data handling and querying in MySQL.
*/