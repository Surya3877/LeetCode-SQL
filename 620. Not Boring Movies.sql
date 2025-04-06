# 620. Not Boring Movies

/*
Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and
its rating.
rating is a 2 decimal places float in the range [0,10]

Write a solution to report the movies with an odd-number ID and a description that is not
"boring".

Return the result table ordered by rating in descending order.

The result format is in the following example.

Example 1:

Input: 
Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation:
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with
ID = 3 is boring so we do not include it in the answer.
*/

CREATE DATABASE IF NOT EXISTS 620_NOT_Boring_Movies;
USE 620_NOT_Boring_Movies;

CREATE TABLE IF NOT EXISTS Cinema(
    id INT,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating FLOAT
);

INSERT INTO Cinema (id, movie, description, rating) VALUES ("1", "War", "great 3D", "8.9");
INSERT INTO Cinema (id, movie, description, rating) VALUES ("2", "Science", "fiction", "8.5");
INSERT INTO Cinema (id, movie, description, rating) VALUES ("3", "irish", "borinh", "6.2");
INSERT INTO Cinema (id, movie, description, rating) VALUES ("4", "Ice song", "Fantacy", "8.6");
INSERT INTO Cinema (id, movie, description, rating) VALUES ("5", "House card", "Interesting", "9.1");

/*
Write a solution to report the movies with an odd-numbered ID and a description that is not
"boring".
*/

# SQL Query

SELECT
    id,
    movie,
    description,
    rating
FROM
    Cinema
WHERE
    id % 2 = 1
AND
    description != "boring"
ORDER BY
    rating DESC;