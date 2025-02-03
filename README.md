# 1757. Recyclable and Low Fat Products

Approach: Selecting rows based on conditions
Algorithm
The keyword SELECT is used to specify the columns that we want to retrieve 
from the table Products. In this scenario, we want to retrieve the product_id column.

The keyword WHERE is used to filter the rows in the table Products based on specific conditions, 
which the low_fats column has the value "Y" (indicating low-fat products) and the recyclable 
column has the value "Y" (indicating recyclable products). We use the logical operator AND to 
combine both conditions, ensuring that the final result includes only product IDs for products
that are both low fat and recyclable.



Create table If Not Exists Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))
Truncate table Products
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N')
