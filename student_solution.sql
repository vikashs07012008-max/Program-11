CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT
);

INSERT INTO Student VALUES
(1001, 'Arun', 101),
(1002, 'Priya', 102),
(1003, 'Kumar', 101);


-- Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Mathematics');


-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

INSERT INTO Course VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');


-- Enrollment Table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT
);

INSERT INTO Enrollment VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 203),
(4, 1003, 201);


-- Create View
CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
INNER JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
INNER JOIN Course
    ON Enrollment.CourseID = Course.CourseID
INNER JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;


-- Display View
SELECT * FROM StudentDetails;
