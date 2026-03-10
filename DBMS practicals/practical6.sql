-- Subqueries
-- Write and execute subqueries to retrieve data from one table based on results from
-- another.

-- step 1 = creating Students and Teachers table for our demonstration
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50),
    subject VARCHAR(50),
    salary INT
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    teacher_id INT,
    marks INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- inserting values in table
INSERT INTO Teachers VALUES
(1, 'Mr. Sharma', 'Maths', 50000),
(2, 'Mrs. Patil', 'Science', 55000),
(3, 'Mr. Kulkarni', 'English', 48000),
(4, 'Mrs. Joshi', 'History', 52000);

INSERT INTO Students VALUES
(101, 'Amit', 1, 85),
(102, 'Sneha', 2, 90),
(103, 'Rahul', 1, 70),
(104, 'Priya', 3, 88),
(105, 'Rohan', 2, 65);

-- step 2 =  Subquery Examples ----------------

-- Query 1: Students taught by teacher Mr. Sharma
SELECT student_name
FROM Students
WHERE teacher_id = (SELECT teacher_id FROM Teachers WHERE teacher_name = 'Mr. Sharma');

-- Query 2: Students whose marks are greater than average marks
SELECT student_name, marks
FROM Students
WHERE marks > (SELECT AVG(marks) FROM Students);

-- Query 3: Teachers who teach students scoring more than 80 marks
SELECT teacher_name
FROM Teachers
WHERE teacher_id IN (SELECT teacher_id FROM Students WHERE marks > 80);

-- Query 4: Teacher with maximum salary
SELECT teacher_name, salary
FROM Teachers
WHERE salary = (SELECT MAX(salary) FROM Teachers);

-- Conclusion:
-- Subqueries allow us to retrieve data from one table based on results obtained from another query. They help perform complex data retrieval efficiently by embedding one query inside another.