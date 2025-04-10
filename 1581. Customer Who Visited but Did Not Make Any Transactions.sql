# 1581. Customer Who Visited but Did Not Make Any Transactions

/*
Table: Visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.

Table: Transactions
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.

Write a solution to find the IDs of the users who visited without making any transactions and the 
number of times they made these types of visits.

Return the result table sorted in any order.

The result format is in the following example.

Example 1:

Input: 
Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+
Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+
Output: 
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+
Explanation:
Customer with id = 23 visited the mall once and made one transaction
during the visit with id = 12.
Customer with id = 9 visited the mall once and made one transaction
during the visit with id = 13.
Customer with id = 30 visited the mall once and did not make any
transactions.
Customer with id = 54 visited the mall three times. During 2 visits they
did not make any transactions, and during one visit they made 3
transactions.
Cusrtomer with id = 96 visited the mall once and did not make any
transactions.
As we can see, users with IDs 30 and 96 visited the mall one time without
making any transactions. Also, user 54 visited the mall twice and did not
make any transactions.
*/

CREATE DATABASE IF NOT EXISTS 1581_Customer_Who_Visited_but_Did_Not_Make_Any_Transactions;
USE 1581_Customer_Who_Visited_but_Did_Not_Make_Any_Transactions;

CREATE TABLE IF NOT EXISTS Visits (
    visit_id INT,
    customer_id INT
);

INSERT INTO Visits (visit_id, customer_id) VALUES ('1', '23');
INSERT INTO Visits (visit_id, customer_id) VALUES ('2', '9');
INSERT INTO Visits (visit_id, customer_id) VALUES ('4', '30');
INSERT INTO Visits (visit_id, customer_id) VALUES ('5', '54');
INSERT INTO Visits (visit_id, customer_id) VALUES ('6', '96');
INSERT INTO VIsits (visit_id, customer_id) VALUES ('7', '54');
INSERT INTO Visits (visit_id, customer_id) VALUES ('8', '54');

SELECT * FROM Visits;

CREATE TABLE IF NOT EXISTS Transactions (
    transaction_id INT,
    visit_id INT,
    amount INT
);

INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('2', '5', '310');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('3', '5', '300');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('9', '5', '200');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('12', '1', '910');
INSERT INTO TRansactions (transaction_id, visit_id, amount) VALUES ('13', '2', '970');

/*
Write a solution to find the IDs of the users who visited without making any transactions and the 
number of the times they made types of visits.
*/

# SQL Query

SELECT
     Visits.customer_id,
     count(*) AS count_no_trans
FROM
    visits
LEFT JOIN
    Transactions
ON
    visits.visit_id = Transactions.visit_id
WHERE
    Transactions.visit_id IS NULL
GROUP BY 
    Visits.Customer_id;