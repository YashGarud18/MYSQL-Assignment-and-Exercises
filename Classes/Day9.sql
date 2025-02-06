-- use the newly created database for subsequent operations
use demojoins;

/*
In mysql, joins are used to combine rows from two or more tables based on related col.
between them. Joins allows you to retrive data from multiole tables in single query,
making it easier to work with relational database. 


1. INNER JOIN:
   - Definition: The INNER JOIN keyword selects records that have matching values in both tables.
   - Purpose: To retrieve only the rows where there is a match in both tables, effectively filtering out 
   non-matching rows.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     INNER JOIN Departments b ON a.DepartmentID = b.DepartmentID;

2. LEFT JOIN (or LEFT OUTER JOIN):
   - Definition: The LEFT JOIN keyword returns all records from the left table and the matched records from 
   the right table.
   
   - Purpose: To retrieve all records from the left table regardless of whether there is a match in the right 
   table, allowing for NULL values in the result set for non-matching rows.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     LEFT JOIN Departments b ON a.DepartmentID = b.DepartmentID;

3. RIGHT JOIN (or RIGHT OUTER JOIN):
   - Definition: The RIGHT JOIN keyword returns all records from the right table and the matched records from 
   the left table.
   
   - Purpose: To retrieve all records from the right table regardless of whether there is a match in the left 
   table, allowing for NULL values in the result set for non-matching rows.
   
   - Example:
     SELECT a.EmployeeID, a.Name, b.DepartmentName
     FROM Employees a
     RIGHT JOIN Departments b ON a.DepartmentID = b.DepartmentID;


4.  Full JOIN (or FULL OUTER JOIN):

Definition: The FULL JOIN keyword returns all records when there is a match in either left or right table records.
Purpose: To retrieve all records from both tables, including those that do not have matches in either table. 
MySQL does not support FULL JOIN directly, but it can be simulated using a combination of LEFT JOIN and RIGHT JOIN with a UNION.

Example:
SELECT a. EmployeeID, a. Name, b.Department Name
FROM Employees a
LEFT JOIN Departments b ON a. DepartmentID = b.Department ID
UNION
SELECT a. EmployeeID, a. Name, b. Department Name
FROM Employees a
RIGHT JOIN Departments b ON a. DepartmentID = b. DepartmentID;


5. LEFT EXCLUSIVE JOIN:
Definition: This is not a standard SOL join type, but it can be simulated by using a LEFT 
JOIN and filtering out the matched records fran the right table
Purpose: To retrieve records from the left table that do not corresponding records the right tabis.

Example:
SELECT a.EmployeeID, a.Name
FROM Employees a
LEFT 2018 Departments ON s.Depa trentID 6. Department ID
WHERE.DepartmentID IS NULL

6. RIGHT EXCLUSIVE J0IN
Definition: Similar to the left exclusive join, this is not using a RIGHT JOIN and flitering out
the matched records from  left table
Purpose: To retrieve records from the right table that de mat спггиsponding words in the lefs table.

Example
SELECT b.DepartmentID, b.DepartmentName
FROM Employees a
RIGHT JOIN Dpartments b on a.departmentsId = b.DepartmentID 
WHERE a.EmployessID IS NULL;

7. CROSS JOIN:
Definition: The CROSS 20th kerward returns the Cartesian product of both tables,
meaning it combines етегу лон of the first table with every cow of the second table
Purpose: To generate a compination of all records from both tacies, which can be useful 
in certain scenanias but may result in a large number of rows in the result set

Example:
SELECT a.EmployeeID, b.DepartmentName 
FROM Exployees a
CROSS JOIN Departments b;

8. SELF JOIN:
Definition: A self join is regular join but table is joined with itself. 
Purpose: To compare rous within the sate table, such as finding hierarchical relationships or related
dete within the same dataset 

Example:
SELECT Employee10, tane, bane 25 anagentione
FROM 
*/



/*
Subqueries:

Definition:
A subquery, also known as a nested query or inner query, is a query embedded within another SQL query.
It is enclosed in parentheses and can be used in various clauses such as SELECT, INSERT, UPDATE, or DELETE. 
Subqueries can return a single value, a single row, or a set of rows.

Purpose:
Subqueries are used to perform operations that require multiple steps or to filter results based on the results of another query. 
They can simplify complex queries by breaking them down into smaller, more manageable parts. 
Subqueries can also be used to retrieve data that will be used in the main query, allowing for more dynamic and flexible SQL statements.

Types of Subqueries:
1. Single-row subquery: Returns a single row and can be used with comparison operators.
2. Multiple-row subquery: Returns multiple rows and can be used with operators like IN, ANY, or ALL.
3. Scalar subquery: Returns a single value (one column, one row) and can be used in expressions.

Examples:
1. Single-row subquery
- Purpose: To find employees whose salary is greater than average salary, 

select employeeID, name
from employees
where salary > (select avg(salary) from employees);

2. Multiple-row subquery:
- Purpose: To find employees who work in departments with budget than $100,000

select employeeID, name
from employees
where DepartmentID in (select departmentID from Departments where budgets > 100000);

3. Scalar subquery:
Purpose: To find the name of the employee with the highest salary.

select Name
from Employees
where Salary = (select max(Salary) from Employees);

4. Correlated subquery:
Purpose: To find employees whose salary is above the average salary of their respective departments.

select e.EmployeeID, e.Name
from Employees e
where e.Salary > (select AVG(Salary) from Employees where DepartmentID = e.DepartmentID);

subqueries are a powerful feature in SQL that allow for more complex and dynamic queries by enabling the use 
of the results of one query within another. They can help simplify SQL statements and make them more readable 
and maintainable. 
*/