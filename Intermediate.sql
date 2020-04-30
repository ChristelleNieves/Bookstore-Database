-- Christelle Nieves
-- Intermediate SQL script for Bookstore database

-- Select data from a single table
SELECT * FROM Book;

-- Select data from single table and limit number of columns returned
SELECT firstName, lastName, email
FROM Customer;

-- Select data from a table and limit number of rows returned
SELECT *
FROM Customer
WHERE customer_id = 04;

-- Select data from a table and limit number of rows & cols returned
SELECT firstName, lastName
FROM Author
WHERE author_id = 240;

-- Select data from a table with a where clause that uses a like
SELECT *
FROM Customer
WHERE firstName LIKE 'M%';

-- Select data from a table with a where clauses that uses a between
SELECT *
FROM Orders
WHERE totalPrice BETWEEN 20 AND 32;

-- Select statement that inner joins two tables
SELECT b.book_title, o.orderDate
FROM Book AS b INNER JOIN Orders AS o
ON b.order_id = o.order_id;

-- Select statement that right joins two tables
SELECT *
FROM Customer RIGHT JOIN Orders
ON Customer.customer_id = Orders.customer_id;

-- Select statement that left joins two tables
SELECT *
FROM Customer LEFT JOIN PaymentMethod
ON Customer.customer_id = PaymentMethod.customer_id;

-- Select statement that full joins two tables
SELECT *
FROM Customer LEFT JOIN PaymentMethod
ON Customer.customer_id = PaymentMethod.customer_id
UNION
SELECT *
FROM Customer RIGHT JOIN PaymentMethod
ON Customer.customer_id = PaymentMethod.customer_id;
