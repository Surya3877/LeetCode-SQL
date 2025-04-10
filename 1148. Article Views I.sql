# 1148. Article Views 1

/*
Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key (column with unique values) for this table, the 
table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article
(written by some author) on some date.
Note that equal author_id and viewer_id indicate the same person.

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.

Example 1:

Input: 
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+
Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+
*/

CREATE DATABASE IF NOT EXISTS 1148_Article_Views_1;
USE 1148_Article_Views_1;

CREATE TABLE IF NOT EXISTS Views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date INT
);

INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('1', '3', '5', 2019-08-01);
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('1', '3', '6', 2019-08-02);
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('2', '7', '7', 2019-08-01);
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('2', '7', '6', 2019-08-02);
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('4', '7', '1', 2019-07-22);
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('3', '4', '4', 2019-07-22);
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES ('3', '4', '4', 2019-07-21);

# SQL Query
SELECT
    DISTINCT author_id as id
FROM
    views
WHERE
    author_id = viewer_id
ORDER BY
    author_id ASC; 	