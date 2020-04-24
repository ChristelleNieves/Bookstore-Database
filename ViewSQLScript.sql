-- Christelle Nieves
-- View SQL Script for Bookstore Database

-- Drop the views
DROP VIEW IF EXISTS combineTwoTablesView;
DROP VIEW IF EXISTS combineThreeTablesView;
DROP VIEW IF EXISTS aggregateFunctionView;

-- Create the first view
CREATE VIEW combineTwoTablesView AS (
SELECT Author.firstName, Author.lastName, Book.bookTitle
FROM Author
INNER JOIN Book
ON Author.firstName LIKE 'G%'
WHERE Author.author_id = Book.author_id
);

-- Create the second view
CREATE VIEW combineThreeTablesView AS (
select Customer.firstName, Orders.totalPrice, PaymentMethod.cardNumber
from Customer 
inner join Orders
on Customer.customer_id = Orders.customer_id
inner join PaymentMethod
on  Customer.customer_id = Orders.customer_id
group by totalPrice
);

-- Create the third view
CREATE VIEW aggregateFunctionView AS (
SELECT COUNT(*) AS numberOfOrders, totalPrice
FROM Orders
WHERE Orders.totalPrice between 20 and 31
GROUP BY totalPrice
);

-- A select statement that utilizes the first view
SELECT *
FROM combineTwoTablesView
WHERE bookTitle LIKE 'C%';

-- A select statement that utilizes the second view
SELECT SUM(totalPrice)
FROM combineThreeTablesView;

-- A select statement that utilizes the third view
SELECT AVG(totalPrice)
FROM aggregateFunctionView;