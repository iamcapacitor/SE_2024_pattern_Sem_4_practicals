-- Write and execute SQL Data Definition Language (DDL) commands such as CREATE,
-- ALTER, DROP, RENAME, and TRUNCATE to define and modify tables. Insert data into the
-- tables and apply appropriate integrity constraints such as NOT NULL, UNIQUE, PRIMARY
-- KEY, FOREIGN KEY, and CHECK. (The application may vary as per the subject teacher’s
-- requirement.)


-- step 1 = create table with constraints
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50)
);
-- another table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Email VARCHAR(50) UNIQUE,
    Dept_ID INT,
    CONSTRAINT fk_dept
        FOREIGN KEY (Dept_ID)
        REFERENCES Department(Dept_ID)
);
-- step 2 = insert data into tables
-- into department table
INSERT INTO Department VALUES (1, 'Computer Science', 'Building A');
INSERT INTO Department VALUES (2, 'Mechanical', 'Building B');
-- into student table
INSERT INTO Student VALUES (101, 'Rohit', 20, 'rohit@gmail.com', 1);
INSERT INTO Student VALUES (102, 'Amit', 22, 'amit@gmail.com', 2);

-- step 3 = alter the created table by adding new columns
-- here we are altering student table
ALTER TABLE Student
ADD Phone_No VARCHAR(15);
ALTER TABLE Student
MODIFY Student_Name VARCHAR(100);

-- step 4 = rename the table
RENAME TABLE Student TO Student_Details;

-- step 5 = truncate table (remove all records but keep structure undisturbed)
TRUNCATE TABLE Student_Details;

-- step 6 = drop the table (delete permanently)
DROP TABLE Student_Details;
DROP TABLE Department;
-- for viva answer = “DDL commands are used to define and modify the structure of database objects, while integrity constraints ensure accuracy and consistency of data.”