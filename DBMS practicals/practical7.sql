-- Stored Procedures or Function with Cursors
-- Create and execute stored procedures / function using cursors

-- 1. CREATE TABLE students
CREATE TABLE students (
rollno INT PRIMARY KEY ,
name VARCHAR(20) ,
designation ENUM('CR' , 'sportshead' , 'cultural_head' , 'president' , 'none'),
address VARCHAR(20),
marks INT CHECK (marks BETWEEN 0 AND 100),
result ENUM('pass' , 'fail')
);

-- 2. INSERT INTO students
INSERT INTO students VALUES
(1, 'Onkar', 'CR', 'Pune', 85, 'pass'),
(2, 'Shubham', 'cultural_head', 'Mumbai', 72, 'pass'),
(3, 'Vipul', 'cultural_head', 'Delhi', 64, 'pass'),
(4, 'Vishal', 'none', 'Pune', 48, 'fail'),
(5, 'Rahul', 'president', 'Beed', 91, 'pass'),
(6, 'Soham', 'none', 'Mumbai', 55, 'pass'),
(7, 'Ashish', 'none', 'Delhi', 39, 'fail'),
(8, 'Rohit', 'sportshead', 'Pune', 77, 'pass'),
(9, 'Vikas', 'none', 'Beed', 44, 'fail'),
(10, 'Rohan', 'cultural_head', 'Mumbai', 62, 'pass');

-- Stored Procedure Using Cursor

-- 3. CREATE PROCEDURE using CURSOR
-- for displaying names of failed students
DELIMITER $$

CREATE PROCEDURE failed_students()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_name VARCHAR(20);
    DECLARE s_result VARCHAR(10);

    -- Cursor declaration
    DECLARE student_cursor CURSOR FOR
        SELECT name, result FROM students;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO s_name, s_result;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        IF s_result = 'fail' THEN
            SELECT s_name AS Failed_Student;
        END IF;

    END LOOP;

    CLOSE student_cursor;

END $$

DELIMITER ;


-- 4. Executing/Calling the Procedure
CALL failed_students();

-- A cursor is a database object used in PL/SQL to retrieve and process query results row by row instead of processing the entire result at once.