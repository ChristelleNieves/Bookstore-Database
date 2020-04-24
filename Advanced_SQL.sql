-- Christelle Nieves
-- Advanced SQL Script for Bookstore Database

-- A select that selects data where an attribute is either null or not null
SELECT * FROM Author
WHERE birthDate IS NOT NULL;

-- AVG
SELECT AVG(totalPrice)
FROM Orders;

-- COUNT
SELECT COUNT(cardNumber)
FROM CardInfo
WHERE CardInfo.CardType = 'visa';

-- MAX
SELECT MAX(price)
FROM Book;

-- MIN
SELECT MIN(price)
FROM Book;

-- Aggregate Function with Order By
SELECT bookTitle, quantityInStock, price
FROM Book
ORDER BY MAX(quantityInStock) DESC;

-- Aggregate Function with Having clause
SELECT bookTitle, MIN(price) AS "Lowest price"
FROM Book
GROUP BY price
HAVING MIN(price) > 10;

-- Subquery with In clause
SELECT bookTitle, price
FROM Book
WHERE author_id IN 
(SELECT author_id
FROM Author
WHERE firstName LIKE "G%");

-- Nested subquery
SELECT bookTitle, price
FROM Book
WHERE author_id IN 
(SELECT author_id
FROM Author
WHERE birthDate = '1948-09-20');



