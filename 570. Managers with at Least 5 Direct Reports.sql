# 570. Managers with at Least 5 Direct Reports

/*
Table: Empployee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their
department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.

Wtrite a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+
*/
CREATE DATABASE IF NOT EXISTS 570_Managers_with_at_Least_5_Direct_Reports;
USE 570_Managers_with_at_Least_5_Direct_Reports;

CREATE TABLE IF NOT EXISTS Employee (
    id INT,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);

INSERT INTO Employee (id, name, department, managerId) VALUES ('101', 'John', 'A', NULL);
INSERT INTO Employee (id, name, department, managerId) VALUES ('102', 'Dan', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('103', 'James', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('104', 'Amy', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('105', 'Anne', 'A', '101');
INSERT INTO Employee (id, name, department, managerId) VALUES ('106', 'Ron', 'B', '101');

SELECT 
    e.name
FROM
    Employee e
JOIN (
    SELECT
        managerId
	FROM
        Employee
	WHERE
        managerId IS NOT NULL
	GROUP BY
        managerId
	HAVING 
        count(id) >= 5
) AS m
ON
    e.id = m.managerId;
