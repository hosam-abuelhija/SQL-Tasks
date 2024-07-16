Create Database School_System;

Create Table Teachers(
TeacherID int PRIMARY KEY,
FirstName varchar(20));

Create Table TeacherDetails(
TeacherDetailID INT PRIMARY KEY,
TeacherID INT,
HireDate DATE,
FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID));

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(20),
TeacherID INT,
FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID));

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(20),);

CREATE TABLE Student_Courses (
StudentID INT,
CourseID INT,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID));

INSERT INTO Teachers VALUES 
(1, 'Hosam'),
(2, 'Yaman'),
(3, 'Deema'),
(4, 'Lujain'),
(5, 'Ahmad');

INSERT INTO TeacherDetails VALUES 
(1, 1, '2020-01-15'),
(2, 2, '2019-03-22'),
(3, 3, '2018-05-30'),
(4, 4, '2021-09-10'),
(5, 5, '2022-11-25');

INSERT INTO Courses VALUES 
(1, 'Math', 1),
(2, 'Arabic', 2),
(3, 'Science', 3),
(4, 'English', 4),
(5, 'Art', 5);

INSERT INTO Students VALUES 
(1, 'Zenjer'),
(2, 'Abuelkhair'),
(3, 'Ibrahimuvic'),
(4, 'Messi'),
(5, 'Hitler');

INSERT INTO Student_Courses VALUES
(1, 5),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(3, 5),
(4, 3),
(4, 4),
(5, 1),
(5, 2);

SELECT * FROM Teachers;
SELECT * FROM TeacherDetails;
SELECT * FROM Courses;
SELECT * FROM Students;
SELECT * FROM Student_Courses;
