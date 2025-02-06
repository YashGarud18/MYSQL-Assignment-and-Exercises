-- create new databse named 'demojoins'
create database demojoins;

-- use the mewly created database
use demojoins;

-- cretae table named 'student' with ID and name
create table student(
id int primary key,
student_name varchar(50)
);

-- insert records into 'students'
insert into student(id, student_name)
values
(101,'Kriti'),
(102,'om'),
(103,'Lavish'),
(104,'Trisha');

-- Retrive all records from student table
select * from student;


-- create 2nd table and named 'course'
create table course(
id int primary key,
course_name varchar(80)
);

-- insert values in table
insert into course(id,course_name)
values
(107,'English'),
(102,'Python'),
(104,'Hindi'),
(108,'Maths');

-- Retrive the data we use
select * from course;



-- Inner Join (also known as simple join/equi join):
-- retrive records that have matching values in both tables involved in join.
-- retrive records with matching IDs from both tables
select student.id, student_name, course_name
from student
inner join course on student.id = course.id;

select * from student;

-- Left join (Also known as left outer join)
-- retrive all records from the left table and the matched records from right table. 
-- retrive all records from 'student' and matching from 'course'
select student.id, student_name, course_name
from course
left join student on student.id = course.id;

-- Right join (Also known as right outer join)
-- retrive all records from the right table and the matched records from left table. 
-- retrive all records from 'course' and matching from 'student'
select student.id, student_name, course_name
from student
right join course on student.id = course.id;

-- Full join (also known as full outer join)
-- It retrive all records from both tables, matching
select student.id, student_name, course_name
from student
right join course on student.id = course.id
union
select student.id, student_name, course_name
from student
left join course on student.id = course.id;


-- Left Exclusive join (also known as left anti join)
-- retrive rows from left table that do not have matching rows in the rigth table
-- retrive records from student that do not have matches in 'course'
select student.id, student_name, course_name
from student
left join course on student.id = course.id
where course.id is null;

-- Right exculsive join
select student.id, student_name, course_name
from student
right join course on student.id = course.id
where student.id is null;

-- self Join (Inner self join/ outer self join/self-reference join)
-- self join is special case of join that allows a table to be joined with itself
-- join the student table with itself based on matching IDs
select student.id, student_name, course_name
from student, course
where student.id = course.id;

-- Cross Join: (also known as a Cartesian Join or Cartesian Product Join)
-- A Cross Join retrieves the Cartesian product of two tables, meaning every row from the
-- combined with every row from the second table.
-- Retrieve the Cartesian product of 'student' and 'course' tables
select student.id, student_name, course_name
from student
cross join course;



-- Table-1
-- Create the faculty table to store information about faculty members
CREATE TABLE faculty (
  faculty_id INT PRIMARY KEY, -- Unique identifier for each faculty
  faculty_name VARCHAR(255), -- Name of the faculty
  faculty_description TEXT, -- Description of the faculty
  dean VARCHAR(255), -- Dean of the faculty
  faculty_location VARCHAR(255), -- Location of the faculty
  faculty_contact_info VARCHAR(255) -- Contact information for the faculty
);

-- Insert sample data into the faculty table
INSERT INTO faculty (faculty_id, faculty_name, faculty_description, dean, faculty_location, faculty_contact_info) VALUES
(1, 'Faculty of Science', 'Covers various scientific disciplines', 'Dr. Alice Smith', 'Building A', 'alice.smith@example.com'),
(2, 'Faculty of Engineering', 'Focuses on engineering and technology', 'Dr. Bob Johnson', 'Building B', 'bob.johnson@example.com'),
(3, 'Faculty of Arts', 'Includes humanities and social sciences', 'Dr. Carol Williams', 'Building C', 'carol.williams@example.com'),
(4, 'Faculty of Business', 'Offers business and management courses', 'Dr. David Brown', 'Building D', 'david.brown@example.com'),
(5, 'Faculty of Education', 'Dedicated to teacher training and education studies', 'Dr. Eva Davis', 'Building E', 'eva.davis@example.com');


-- Table-2
-- Create the department table to store information about departments within faculties
CREATE TABLE department (
  department_id INT PRIMARY KEY, -- Unique identifier for each department
  department_name VARCHAR(255), -- Name of the department
  department_description TEXT, -- Description of the department
  faculty_id INT, -- Foreign key referencing the faculty
  department_head VARCHAR(255), -- Head of the department
  department_location VARCHAR(255), -- Location of the department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the department table
INSERT INTO department (department_id, department_name, department_description, faculty_id, department_head, department_location) VALUES
(1, 'Department of Physics', 'Study of matter and energy', 1, 'Dr. Emily White', 'Room 101'),
(2, 'Department of Computer Science', 'Focus on computing and programming', 1, 'Dr. Frank Green', 'Room 102'),
(3, 'Department of Civil Engineering', 'Deals with infrastructure and construction', 2, 'Dr. Grace Black', 'Room 201'),
(4, 'Department of Mechanical Engineering', 'Focus on machinery and mechanics', 2, 'Dr. Henry Blue', 'Room 202'),
(5, 'Department of History', 'Study of past events and societies', 3, 'Dr. Irene Red', 'Room 301');


-- Table-3
-- Create the students table to store information about students
CREATE TABLE students (
  student_id INT PRIMARY KEY, -- Unique identifier for each student
  student_name VARCHAR(255), -- Name of the student
  student_email VARCHAR(255), -- Email of the student
  department_id INT, -- Foreign key referencing the department
  enrollment_year INT, -- Year of enrollment
  faculty_id INT, -- Foreign key referencing the faculty
  FOREIGN KEY (department_id) REFERENCES department(department_id), -- Establishing relationship with department
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the students table
INSERT INTO students (student_id, student_name, student_email, department_id, enrollment_year, faculty_id) VALUES
(1, 'John Doe', 'john.doe@example.com', 1, 2021, 1),
(2, 'Jane Smith', 'jane.smith@example.com', 2, 2020, 1),
(3, 'Alice Johnson', 'alice.johnson@example.com', 1, 2022, 1),
(4, 'Bob Brown', 'bob.brown@example.com', 3, 2021, 2),
(5, 'Charlie Davis', 'charlie.davis@example.com', 4, 2023, 2);


-- Table-4
-- Create the salary table to store salary information for faculty members
CREATE TABLE salary (
  salary_id INT PRIMARY KEY, -- Unique identifier for each salary record
  faculty_id INT, -- Foreign key referencing the faculty
  amount DECIMAL(10, 2), -- Salary amount
  payment_date DATE, -- Date of salary payment
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) -- Establishing relationship with faculty
);

-- Insert sample data into the salary table
INSERT INTO salary (salary_id, faculty_id, amount, payment_date) VALUES
(1, 1, 75000.00, '2023-01-15'),
(2, 2, 80000.00, '2023-01-15'),
(3, 3, 70000.00, '2023-01-15'),
(4, 4, 72000.00, '2023-01-15'),
(5, 5, 68000.00, '2023-01-15');

-- Table-5
-- Create the marks table to store marks obtained by students
CREATE TABLE marks (
  marks_id INT PRIMARY KEY, -- Unique identifier for each marks record
  student_id INT, -- Foreign key referencing the student
  subject_name VARCHAR(255), -- Name of the subject
  marks_obtained INT, -- Marks obtained by the student
  semester INT, -- Semester in which the marks were obtained
  FOREIGN KEY (student_id) REFERENCES students(student_id) -- Establishing relationship with students
);

-- Insert sample data into the marks table
INSERT INTO marks (marks_id, student_id, subject_name, marks_obtained, semester) VALUES
(1, 1, 'Physics', 85, 1),
(2, 1, 'Mathematics', 90, 1),
(3, 2, 'Computer Science', 88, 2),
(4, 3, 'Physics', 92, 1),
(5, 4, 'Civil Engineering', 75, 2),
(6, 5, 'Business Management', 80, 1);


-- Inner joins (also known as simple join)
-- retrive records that have matching values in both tables involved in join

-- join 2 tables
select faculty.faculty_id, faculty_name, student_name
from students
inner join faculty on students.faculty.id = faculty.faculty_id;

-- join 2 table
select faculty.*, student_name
from students
inner join faculty on students.faculty_id = faculty.faculty_id;

-- join 3 tables
select T1.faculty_id, faculty_name, department_name, student_name
from students as T1
inner join faculty as T2 on T1.faculty_id = T2.faculty_id
inner join department as T3 on T2.faculty_id = T3.faculty_id;

-- join 4 tables
select s.student_name, m.subject_name, m.marks_obtained, d.department_name, f.faculty_name
from marks m
inner join students s on m.student_id = s.student_id
inner join department d on s.department_id = d.department_id
inner join faculty f on d.faculty_id = f.faculty_id;

select f.faculty_name, s.amount, d.department_name, st.student_name
from salary s
inner join faculty f on s.faculty_id = f.faculty_id
inner join department d on f.faculty_id = d.faculty_id
inner join students st on d.department_id = st.department_id;