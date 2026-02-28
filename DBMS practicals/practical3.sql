-- SQL Queries for Data Manipulation, Access Control, and Transactions
-- Design and run SQL queries to demonstrate the following:
-- a) Data Manipulation (DML): Use SQL statements to INSERT, UPDATE, and DELETE
-- records. Apply arithmetic, logical, set operators, pattern matching, and string functions.
-- b) Access Control (DCL): Use GRANT, REVOKE, and ROLE commands to manage user
-- access.
-- c) Transaction Control (TCL): Apply START TRANSACTION, COMMIT, ROLLBACK, and
-- SAVEPOINT commands to manage transactions.

-- Solution

-- SQL Queries for DML, DCL, and TCL
-- We use an EMPLOYEE table for demonstration.

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Dept VARCHAR(30),
    City VARCHAR(30)
);
-- A) Data Manipulation Language (DML)
-- insert records
INSERT INTO Employee VALUES (1, 'Rohit', 40000, 'IT', 'Pune');
INSERT INTO Employee VALUES (2, 'Amit', 35000, 'HR', 'Mumbai');
INSERT INTO Employee VALUES (3, 'Sneha', 45000, 'IT', 'Pune');

-- UPDATE Records = Increase salary by 10% for IT department
UPDATE Employee
SET Salary = Salary + (Salary * 0.10)
WHERE Dept = 'IT';

-- delete records
DELETE FROM Employee
WHERE City = 'Mumbai';

-- logical operators
SELECT * FROM Employee
WHERE Salary > 40000 AND Dept = 'IT';

-- set operators (UNION)
SELECT Emp_Name FROM Employee WHERE Dept = 'IT'
UNION
SELECT Emp_Name FROM Employee WHERE City = 'Pune';

-- pattern matching (LIKE)
SELECT * FROM Employee
WHERE Emp_Name LIKE 'R%';

-- string functions
SELECT 
    UPPER(Emp_Name) AS Name_Upper,
    LENGTH(Emp_Name) AS Name_Length
FROM Employee;

-- A) Data Manipulation Language (DML)

-- create user
CREATE USER user1 IDENTIFIED BY password123;

-- grant privileges
GRANT SELECT, INSERT ON Employee TO user1;

-- revoke privileges
REVOKE INSERT ON Employee FROM user1;

-- role creation and assignment
CREATE ROLE manager;
GRANT SELECT, UPDATE ON Employee TO manager;
GRANT manager TO user1;


-- C) Transaction Control Language (TCL)

-- start transaction
START TRANSACTION;

-- save point
SAVEPOINT sp1;

-- update with savepoint
UPDATE Employee
SET Salary = Salary - 5000
WHERE Emp_ID = 1;

-- rollback to savepoint
ROLLBACK TO sp1;

-- commit transaction
COMMIT;

-- (optional) full rollback syntax
START TRANSACTION;
DELETE FROM Employee;
ROLLBACK;

-- viva answer = “DML manipulates data, DCL controls user access, and TCL manages database transactions to ensure data consistency.”