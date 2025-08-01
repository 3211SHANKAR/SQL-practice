
# 🎓 Student Performance Tracker - SQL Project

This project is a medium-level SQL-based system designed to manage and analyze student performance across various subjects and classes.

## 📌 Project Overview

The **Student Performance Tracker** helps administrators or teachers:
- Maintain student records
- Track marks across subjects and exams
- Generate insights like average scores per student
- Analyze performance trends

---

## 🧩 Database Schema

### 1. `Classes`
Stores class information.

| Column    | Type         | Description      |
|-----------|--------------|------------------|
| ClassID   | INT (PK)     | Unique ID        |
| ClassName | VARCHAR(20)  | e.g. "10th Grade"|
| Section   | VARCHAR(5)   | Class section    |

### 2. `Students`
Stores student details.

| Column   | Type         | Description             |
|----------|--------------|-------------------------|
| StudentID| INT (PK)     | Unique student ID       |
| Name     | VARCHAR(100) | Student name            |
| Gender   | VARCHAR(10)  | Male/Female/Other       |
| DOB      | DATE         | Date of birth           |
| ClassID  | INT (FK)     | Linked to `Classes`     |

### 3. `Subjects`
Stores subjects taught.

| Column     | Type         | Description    |
|------------|--------------|----------------|
| SubjectID  | INT (PK)     | Unique ID      |
| SubjectName| VARCHAR(50)  | e.g. Math, Sci |

### 4. `Marks`
Stores marks of students in exams.

| Column       | Type         | Description                     |
|--------------|--------------|---------------------------------|
| MarkID       | INT (PK)     | Unique ID                       |
| StudentID    | INT (FK)     | Linked to `Students`            |
| SubjectID    | INT (FK)     | Linked to `Subjects`            |
| ExamType     | VARCHAR(20)  | e.g. Midterm, Final             |
| MarksObtained| INT          | Marks scored                    |
| MaxMarks     | INT          | Total marks for the exam        |

---

## 📊 ER Diagram (Text Representation)

```
+----------------+      +----------------+      +---------------+
|    Classes     |      |    Students    |      |   Subjects    |
+----------------+      +----------------+      +---------------+
| ClassID (PK)   |<-----| StudentID (PK) |      | SubjectID (PK)|
| ClassName      |      | Name           |      | SubjectName   |
| Section        |      | Gender         |      +---------------+
+----------------+      | DOB            |
                        | ClassID (FK)   |
                        +----------------+
                                 |
                                 |
                         +----------------+
                         |     Marks      |
                         +----------------+
                         | MarkID (PK)    |
                         | StudentID (FK) |
                         | SubjectID (FK) |
                         | ExamType       |
                         | MarksObtained  |
                         | MaxMarks       |
                         +----------------+
```

---

## 🧪 Sample Data

- 2 students: Ankit Sharma, Priya Das
- 3 subjects: Math, Science, English
- 1 class: 10th Grade - A
- Marks for Midterm Exam

---

## 🔍 Sample Queries & Outputs

### 1. List all students with their class
```sql
SELECT s.Name, c.ClassName, c.Section
FROM Students s
JOIN Classes c ON s.ClassID = c.ClassID;
```
📤 Output:
| Name         | ClassName   | Section |
|--------------|-------------|---------|
| Ankit Sharma | 10th Grade  | A       |
| Priya Das    | 10th Grade  | A       |

---

### 2. Get marks of a student (`Ankit Sharma`)
```sql
SELECT s.Name, sub.SubjectName, m.ExamType, m.MarksObtained, m.MaxMarks
FROM Marks m
JOIN Students s ON m.StudentID = s.StudentID
JOIN Subjects sub ON m.SubjectID = sub.SubjectID
WHERE s.Name = 'Ankit Sharma';
```
📤 Output:
| Name         | SubjectName | ExamType | MarksObtained | MaxMarks |
|--------------|-------------|----------|----------------|----------|
| Ankit Sharma | Math        | Midterm  | 78             | 100      |
| Ankit Sharma | Science     | Midterm  | 65             | 100      |

---

### 3. Average marks per student
```sql
SELECT s.Name, AVG(m.MarksObtained) AS AvgMarks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.Name;
```
📤 Output:
| Name         | AvgMarks |
|--------------|----------|
| Ankit Sharma | 71.5     |
| Priya Das    | 90.0     |

---

## 📂 Files Provided

- `StudentPerformanceTracker.sql`: SQL file with schema + inserts + queries
- `README.md`: Documentation file (this one)

---

## 🚀 Future Enhancements (Optional)

- Add login system for teachers
- Add triggers to prevent marks > max
- Build simple frontend in HTML/PHP or Python

---

## 👨‍💻 Author

**Developed by:** Gouri Shankar (with guidance from ChatGPT)  
**Date:** August 2025  
**Skill Level:** Beginner to Intermediate  
