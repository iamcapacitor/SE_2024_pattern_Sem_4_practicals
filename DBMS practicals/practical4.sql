-- Aggregate Functions and Grouping
-- Use aggregate functions along with GROUP BY and HAVING clauses to retrieve
-- summarized data from the database.

-- creating Student table = 
CREATE TABLE students (
    rollno INT,
    name VARCHAR(50),
    attendance INT,
    age INT,
    cgpa DECIMAL(3,2),
    result VARCHAR(10)
);
INSERT INTO students VALUES
(1, 'Abhishek', 88, 20, 8.4, 'Pass'),
(2, 'Onkar', 92, 21, 9.0, 'Pass'),
(3, 'Shubham', 75, 20, 7.2, 'Pass'),
(4, 'Rohit', 65, 22, 6.4, 'Pass'),
(5, 'Rohan', 45, 21, 5.1, 'Fail'),
(6, 'Sumit', 70, 20, 6.8, 'Pass'),
(7, 'Varad', 80, 19, 7.9, 'Pass'),
(8, 'Kartik', 55, 22, 5.6, 'Fail'),
(9, 'Aryan', 90, 20, 8.9, 'Pass'),
(10, 'Ravinder', 60, 23, 6.0, 'Pass'),
(11, 'Ashutosh', 85, 21, 8.1, 'Pass'),
(12, 'Gaurav', 50, 22, 5.3, 'Fail'),
(13, 'Prasad', 78, 20, 7.5, 'Pass'),
(14, 'Dinesh', 40, 23, 4.6, 'Fail');

-- 1. Aggregate Functions (Without GROUP BY)
SELECT COUNT(*) AS total_students FROM students;
-- Average CGPA
SELECT AVG(cgpa) AS average_cgpa FROM students;
-- Maximum and Minimum CGPA
SELECT MAX(cgpa) AS highest_cgpa,
       MIN(cgpa) AS lowest_cgpa
FROM students;
-- -------------------------------------------------------

-- 2. GROUP BY Clause
-- GROUP BY is used to group rows having same values and apply aggregate functions on each group.
-- Count students based on result (Pass / Fail)
SELECT result, COUNT(*) AS total
FROM students
GROUP BY result;
-- Average CGPA of Pass and Fail students
SELECT result, AVG(cgpa) AS avg_cgpa
FROM students
GROUP BY result;
-- Average attendance by age
SELECT age, AVG(attendance) AS avg_attendance
FROM students
GROUP BY age;
-- --------------------------------------------------------

-- 3. HAVING Clause
-- Show only results where average CGPA > 7
SELECT result, AVG(cgpa) AS avg_cgpa
FROM students
GROUP BY result
HAVING AVG(cgpa) > 7;
-- Show ages having more than 1 student
SELECT age, COUNT(*) AS student_count
FROM students
GROUP BY age
HAVING COUNT(*) > 1;
-- Result groups with average attendance above 70
SELECT result, AVG(attendance) AS avg_attendance
FROM students
GROUP BY result
HAVING AVG(attendance) > 70;
-- --------------------------------------------------------
-- Aggregate functions summarize data, GROUP BY forms groups, HAVING filters grouped results.
