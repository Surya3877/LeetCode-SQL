# 1934. Confirmation Rate

/*
Table: Signups

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
user_id is the column of unique values for this table.
Each row contains information about the signup time for the user with ID
user_id.

Table: Confirmations

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+
(user_id, time_stamp) is the primary key (combination of columns with
unique values) for this table.
user_id is a forgein key (reference column) to the Singups, table.
action is an ENUM (category) of the type ('confirmed', 'timeout')
Each row of this table indicates that the user with ID user_id requested
a confirmation message at time_stamp and that confirmatiom message was 
either confirmed ('confirmed') or expired without confirming ('timeout')

The confirmation rate of a user is the number of 'Confirmed' Message divided by the total
number of requested confirmation messages. The confirmation rate of user that did not request
any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write a solution the confirmation rate of each user.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Signups table:
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |
+---------+---------------------+
Confirmations table:
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |
+---------+---------------------+-----------+
Output: 
+---------+-------------------+
| user_id | confirmation_rate |
+---------+-------------------+
| 6       | 0.00              |
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |
+---------+-------------------+
Explaination:
User 6 did not request any confirmation messages. The confirmation rate
is 0.
User 3 made 2 requests and both timed out. The confirmation rate is 0.
User 7 made 3 requests and all were confirmed. The confirmation rate is 1.
User 2 made 2 requests where one confirmed and the other timed out.
The confirmation rate is 1 / 2 = 0.5.
*/

CREATE DATABASE IF NOT EXISTS 1934_Confirmation_Rate;
USE 1934_Confirmation_Rate;

CREATE TABLE IF NOT EXISTS Signups (
    user_id INT,
    time_stamp DATETIME
);

INSERT INTO Signups (user_id, time_stamp) VALUES ("3", "2020-03-21 10:16:13");
INSERT INTO Signups (user_id, time_stamp) VALUES ("7", "2020-01-04 13:57:59");
INSERT INTO Signups (user_id, time_stamp) VALUES ("2", "2020-07-29 23:09:44");
INSERT INTO Signups (user_id, time_stamp) VALUES ("6", "2020-12-09 10:39:37");

CREATE TABLE IF NOT EXISTS Confirmations (
    user_id INT,
    time_stamp DATETIME,
    action ENUM ("timeout", "Confirmed")
);

INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ("3", "2021-01-06 03:30:46", "timeout");
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ("3", "2021-07-14 14:00:00", "timeout");
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ("7", "2021-06-12 11:57:29", "Confirmed");
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ("7", "2021-06-13 12:58:28", "Confirmed");
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ("7", "2021-06-14 13:59:27", "Confirmed");
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ("2", "2021-01-22 00:00:00", "Confirmed");
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES ("2", "2021-02-28 23:59:59", "Confirmed");

/*
Write a solution to find the confirmation rate of each user
*/

select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
from Signups as s left join Confirmations as c on s.user_id= c.user_id group by user_id;




