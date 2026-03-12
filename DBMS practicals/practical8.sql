-- Database Triggers
-- Implement and test triggers to maintain data integrity in database.

-- use same students table as used in practical 7
-- 1. CREATE TABLE students
CREATE TABLE students (
rollno INT PRIMARY KEY ,
name VARCHAR(20) ,
designation ENUM('CR' , 'sportshead' , 'cultural_head' , 'president' , 'none'),
address VARCHAR(20),
marks INT CHECK (marks BETWEEN 0 AND 100),
result ENUM('pass' , 'fail')
);
INSERT INTO students VALUES
(1, 'Onkar', 'CR', 'Pune', 85, 'pass'),
(2, 'Shubham', 'cultural_head', 'Mumbai', 72, 'pass'),
(3, 'Vipul', 'cultural_head', 'Delhi', 77, 'pass'),
(4, 'Vishal', 'none', 'Pune', 48, 'fail'),
(5, 'Rahul', 'president', 'Beed', 91, 'pass'),
(6, 'Soham', 'none', 'Mumbai', 55, 'pass'),
(7, 'Ashish', 'none', 'Delhi', 39, 'fail'),
(8, 'Rohit', 'sportshead', 'Pune', 77, 'pass'),
(9, 'Vikas', 'none', 'Beed', 44, 'fail'),
(10, 'Rohan', 'cultural_head', 'Mumbai', 62, 'pass');


-- Add this after your table creation.
-- Trigger 1: Automatically set result based on marks
DELIMITER $$

CREATE TRIGGER check_result
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.marks >= 50 THEN
        SET NEW.result = 'pass';
    ELSE
        SET NEW.result = 'fail';
    END IF;
END$$

DELIMITER ;

-- Trigger 2: Prevent deletion of president
DELIMITER $$

CREATE TRIGGER prevent_president_delete
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
    IF OLD.designation = 'president' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'President record cannot be deleted';
    END IF;
END$$

DELIMITER ;

-- ---------------------------------------------------------------------------------------

-- Testing the Trigger 1 
-- trying to insert values with wrong result state
INSERT INTO students VALUES
(11, 'Amay', 'none', 'Pune', 42, 'pass');


-- Testing the Trigger 2 by trying to delete president
DELETE FROM students
WHERE designation = 'president';

-- A trigger is a special type of stored procedure that automatically executes
-- when a specific event (INSERT, UPDATE, DELETE) occurs on a table.