# 1068. Product Sales Analysis 1

/*
Table: Sales

Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sales, year) is the primary key (combination of columns with unique
values) of this table.
product_id is a foreign key (reference column) to product table.
Each row of this table shows a sale on the product product_id in a
certain year.
Note that the price is per unit.

Table: product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.'
Each row of this table indicates the product name of each product.

Write a solution to report the product_name, year, and price for the each sale_id in the sales
table.

Return the resulting table in any order.

The result format is in the following example.

Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+
Explanation:
From sale_id = 1, we can conclude that Nokia was sold for 5000 in the
year 2008.
From sale_id = 2, we can conclude that Nokia was sold for 500 in the
year 2009.
From sale_id = 7, we can conclude that Apple was sold for 9000 in the
year 2011.
*/

CREATE TABLE IF NOT EXISTS Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);

INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES ('1', '100', '2008', '10', '500');
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES ('2', '100', '2009', '12', '500');
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES ('7', '200', '2011', '15', '9000');

CREATE TABLE IF NOT EXISTS Product (
    product_id INT,
    product_name VARCHAR(10)
);

INSERT INTO Product (product_id, product_name) VALUES ('100', 'Nokia');
INSERT INTO Product (product_id, product_name) VALUES ('200', 'Apple');
INSERT INTO Product (product_id, product_name) VALUES ('300', 'Samsung');

/*
Write a solution to report the product_name, year, and price for each sale_id in the sales
table.
*/

# SQL Query

SELECT
    Product.product_name,
    Sales.year,
    Sales.price
FROM
    Sales
JOIN
    Product
ON
    Sales.product_id = Product.product_id;
    
/*
✅ Explanation:

SELECT – Specifies the columns to display: product_name, year, and price.

FROM Sales – Refers to the Sales table.

JOIN Product – Joins the Product table with the Sales table.

ON Sales.product_id = Product.product_id – Matches the product_id from both tables to combine relevant data.

This will return the required columns with the product name, year, and price for each sale.
*/
