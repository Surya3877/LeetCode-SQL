# 1280. Students and Examinations

/*
Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the 
school.

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this
table.
Each row of this table contains the name of one subject in the school.

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It
may contain duplicates.
Each student from the Students table takes every course from the subjects
table.
Each row of this table indicates that a student with ID student_id
attended the exam of the subject_name.

Write a solution to find the number of times each students attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.

Example 1:

Input: 
Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+
Output: 
+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
+------------+--------------+--------------+----------------+
The result table should contain all students and all subjects.
Alice attended the Math exam 3 times, the Physics exam 2 times, and the
programming exam 1 time.
Bob attended the Math exam 1 time, the Programming exam 1 time, and did
not attend the Physics exam.
Alex did not atten any exams.
John attended the Math exam 1 time, the Physics exam 1 time, and the 
Programming exam 1 time.
*/

CREATE DATABASE IF NOT EXISTS 1280_Students_and_Examinations;
USE 1280_Students_and_Examinations;

CREATE TABLE IF NOT EXISTS Students (
    student_id INT,
    student_name VARCHAR(20)
);

INSERT INTO Students (student_id, student_name) VALUES ('1', 'Alice');
INSERT INTO Students (student_id, student_name) VALUES ('2', 'Bob');
INSERT INTO Students (student_id, student_name) VALUES ('13', 'John');
INSERT INTO Students (student_id, student_name) VALUES ('6', 'Alex');

CREATE TABLE IF NOT EXISTS Subjects (
    subject_name VARCHAR(20)
);

INSERT INTO Subjects (subject_name) VALUES ('Math');
INSERT INTO Subjects (subject_name) VALUES ('Physics');
INSERT INTO Subjects (subject_name) VALUES ('Programming');

SELECT * FROM Subjects;

CREATE TABLE IF NOT EXISTS Examinations (
    student_id INT,
    subject_name VARCHAR(20)
);

INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('2', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('2', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');

SELECT * FROM Examinations;

/*
Write a solution to find the number of times each student attended each exam.
*/

SELECT
    Students.student_id,
    Students.student_name,
    Subjects.subject_name,
    count(Examinations.student_id) as attended_exams
FROM
    Students
CROSS JOIN
    Subjects
LEFT JOIN
    Examinations
ON
	Students.student_id = Examinations.student_id
AND
    Subjects.subject_name = Examinations.Subject_name
GROUP BY
    Students.student_id,
    Students.student_name,
    Subjects.subject_name
ORDER BY
    Students.student_id,
    Students.student_name;
    


