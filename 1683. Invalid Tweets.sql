# 1683. Invalid Tweets

/*
Table: Tweets

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
tweet_id is the primary key (column with unique values) for this table.
conent consists of alphanumeric characters, '!', or ' ' and no other
special characters.
This table contains all tweets in a social media app.

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of
characters used in the conent of the tweet is strictly greater than 15.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Tweets table:
+----------+-----------------------------------+
| tweet_id | content                           |
+----------+-----------------------------------+
| 1        | Let us Code                       |
| 2        | More than fifteen chars are here! |
+----------+-----------------------------------+
Output: 
+----------+
| tweet_id |
+----------+
| 2        |
+----------+
Exaplanation:
Tweet 1 has length = 11. It is a valid tweet.
Tweet 2 has length = 33. It is an invalid tweet.
*/

CREATE DATABASE IF NOT EXISTS 1683_Invalid_Tweets;
USE 1683_Invalid_Tweets;

CREATE TABLE IF NOT EXISTS Tweets (
    tweet_id INT,
    content VARCHAR(50)
);

INSERT INTO Tweets (tweet_id, content) VALUES ('1', 'Let us Code');
INSERT INTO Tweets (tweet_id, content) VALUES ('2', 'More than fifteen chars are here!');

SELECT 
    tweet_id
FROM
    Tweets
WHERE
    length(content) > 15;