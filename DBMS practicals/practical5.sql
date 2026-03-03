-- JOIN Operations and Views
-- Perform various types of JOIN operations to extract meaningful relationships between
-- tables. Create and manage different database views.

-- for our demonstration we will make 2 tables = Students , Results 
CREATE TABLE Students (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
CREATE TABLE Results (
    rollno INT,
    cgpa DECIMAL(3,1),
    result VARCHAR(10),
    FOREIGN KEY (rollno) REFERENCES Students(rollno)
);
INSERT INTO Students VALUES
(1, 'Abhishek', 20),
(2, 'Onkar', 21),
(3, 'Shubham', 22),
(4, 'Rohit', 21);
INSERT INTO Results VALUES
(1, 8.5, 'Pass'),
(2, 6.8, 'Pass'),
(4, 4.2, 'Fail');

-- now demonstration
-- 1. JOIN Operations

-- 1.1 INNER JOIN (Only matching rows)
SELECT s.rollno, s.name, s.age, r.cgpa, r.result
FROM Students s
INNER JOIN Results r
ON s.rollno = r.rollno;

-- 1.2 LEFT JOIN (All students, even without results)
SELECT s.rollno, s.name, r.cgpa, r.result
FROM Students s
LEFT JOIN Results r
ON s.rollno = r.rollno;

-- 1.3 RIGHT JOIN (All results, even if student data is missing)
SELECT s.rollno, s.name, r.cgpa, r.result
FROM Students s
RIGHT JOIN Results r
ON s.rollno = r.rollno;

-- 1.4 CROSS JOIN (Cartesian product)
SELECT s.name, r.cgpa
FROM Students s
CROSS JOIN Results r;

-- --------------------------------------------------------
-- 2. Creating a VIEW
CREATE VIEW Student_Result_View AS
SELECT s.rollno, s.name, s.age, r.cgpa, r.result
FROM Students s
INNER JOIN Results r
ON s.rollno = r.rollno;

-- 3. Using the VIEW
SELECT * FROM Student_Result_View;

-- 4. Drop the VIEW
DROP VIEW Student_Result_View;