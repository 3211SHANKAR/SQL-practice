
-- STUDENT PERFORMANCE TRACKER DATABASE SCHEMA --

-- Drop tables if they exist 
DROP TABLE IF EXISTS Marks;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Subjects;
DROP TABLE IF EXISTS Classes;

-- 1. Classes Table
CREATE TABLE Classes (
    ClassID INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(20),
    Section VARCHAR(5)
);

-- 2. Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    DOB DATE,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- 3. Subjects Table
CREATE TABLE Subjects (
    SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    SubjectName VARCHAR(50)
);

-- 4. Marks Table
CREATE TABLE Marks (
    MarkID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    ExamType VARCHAR(20),
    MarksObtained INT,
    MaxMarks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- Insert sample data into Classes
INSERT INTO Classes (ClassName, Section) VALUES
('10th Grade', 'A');

-- Insert sample data into Students
INSERT INTO Students (Name, Gender, DOB, ClassID) VALUES
('Ankit Sharma', 'Male', '2006-03-12', 1),
('Priya Das', 'Female', '2005-07-22', 1);

-- Insert sample data into Subjects
INSERT INTO Subjects (SubjectName) VALUES
('Math'),
('Science'),
('English');

-- Insert sample data into Marks
INSERT INTO Marks (StudentID, SubjectID, ExamType, MarksObtained, MaxMarks) VALUES
(1, 1, 'Midterm', 78, 100),
(1, 2, 'Midterm', 65, 100),
(2, 1, 'Midterm', 88, 100),
(2, 3, 'Midterm', 92, 100);

-- Examples Querries

-- 1. List all students and their classes
SELECT s.Name, c.ClassName, c.Section
FROM Students s
JOIN Classes c ON s.ClassID = c.ClassID;

-- 2. Get marks of a student
SELECT s.Name, sub.SubjectName, m.ExamType, m.MarksObtained, m.MaxMarks
FROM Marks m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Subjects sub ON m.SubjectID = sub.SubjectID
WHERE s.Name = 'Ankit Sharma';

-- 3. Average marks per student
SELECT s.Name, AVG(m.MarksObtained) AS AvgMarks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.Name;
