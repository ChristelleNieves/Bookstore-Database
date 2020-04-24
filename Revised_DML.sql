-- Christelle Nieves
-- Revised DML script for Bookstore database

DELETE FROM Author_Book;
DELETE FROM Book;
DELETE FROM Orders;
DELETE FROM CardInfo;
DELETE FROM PaymentMethod;
DELETE FROM Customer;
DELETE FROM Author;

-- Add 10 entries to Author Table
INSERT INTO Author
VALUES
(222, 'George RR', 'Martin', '1948-09-20'),
(240, 'JK', 'Rowling', '1965-07-31'),
(300, 'Leigh', 'Bardugo', '1975-04-06'),
(315, 'Holly', 'Black', '1971-11-10'),
(250, 'Gayle', 'McDowell', '1982-10-05'),
(200, 'Andrzej', 'Sapkowski', '1948-06-21'),
(205, 'F Scott', 'Fitzgerald', '1896-09-24'),
(444, 'Stephen', 'King', '1947-09-21'),
(400, 'JRR', 'Tolkien', '1892-01-03'),
(401, 'Jane', 'Austen', '1775-12-16');

-- Add 10 entries into the Customer table
INSERT INTO Customer
VALUES
(01, 'Kermit', 'TheFrog', 'kermitthefrog@gmail.com'),
(02, 'Miss', 'Piggy', 'misspiggy@gmail.com'),
(03, 'Doja', 'Cat', 'dojacat@gmail.com'),
(04, 'Luke', 'Skywalker', 'luke@gmail.com'),
(05, 'Anakin', 'Skywalker', 'darthvader@gmail.com'),
(06, 'Bruce', 'Wayne', 'batboi@gmail.com'),
(07, 'Marco', 'Polo', 'imapoolgame@gmail.com'),
(08, 'Ash', 'Ketchum', 'ash@gmail.com'),
(09, 'Larry', 'David', 'ldavid@gmail.com'),
(10, 'Elon', 'Musk', 'ilovemars@gmail.com');

-- Add 10 entries into the PaymentMethod table
INSERT INTO PaymentMethod
VALUES
(700, 1234567890, 01),
(701, 9876543210, 02),
(702, 5678943210, 03),
(703, 7856749382, 04),
(704, 4729674562, 05),
(705, 8887364564, 06),
(706, 4095781113, 07),
(707, 5567485982, 08),
(708, 2204995748, 09),
(709, 6657488757, 10, 'visa');

INSERT INTO CardInfo
VALUES
(1234567890, 'visa'),
(9876543210, 'mastercard'),
(5678943210, 'visa'),
(7856749382, 'visa'),
(4729674562, 'visa'),
(8887364564, 'mastercard'),
(4095781113, 'visa'),
(5567485982, 'mastercard'),
(2204995748, 'visa'),
(6657488757, 'visa');


-- Add 10 entries into the Order table
INSERT INTO Orders
VALUES
(100, 01, '2020-01-02', 700, 26.89),
(101, 02, '2020-15-01', 701, 22.78),
(102, 03, '2020-04-02', 702, 19.50),
(103, 04, '2020-10-01', 703, 16.50),
(104, 05, '2020-20-02', 704, 17.00),
(105, 06, '2020-01-01', 705, 18.99),
(106, 07, '2020-05-02', 706, 19.00),
(107, 08, '2020-18-02', 707, 17.99),
(108, 09, '2020-03-01', 708, 16.99),
(109, 10, '2020-28-02', 709, 17.50);

-- Add 10 entries to Book table
INSERT INTO Book
VALUES
(123, 'Cracking the Coding Interview', 100, 2, 25.99, 250),
(124, 'The Great Gatsby', 101, 4, 20.99, 205),
(125, 'Game of Thrones', 102, 3, 18.99, 222),
(126, 'Harry Potter', 103, 6, 15.99, 240),
(127, 'The Witcher', 104, 3, 16.00, 200),
(128, 'Shadow and Bone', 105, 4, 17.99, 300),
(129, 'Ruin and Rising', 106, 3, 17.99, 300),
(130, 'Siege and Storm', 107, 5, 17.99, 300),
(131, 'Wicked King', 108, 2, 16.00, 315),
(132, 'Cruel Prince', 109, 5, 15.99, 315);

INSERT INTO Author_Book
VALUES
(250, 123),
(205, 124),
(222, 125),
(240, 126),
(200, 126),
(300, 128),
(300, 129),
(300, 130),
(315, 131),
(315, 132);


-- Delete an entry from Author table
DELETE FROM Author
WHERE author_id = 401;

-- Update an entry from Author table
UPDATE Author
SET birthdate = '1983-10-10'
WHERE author_id = 250;

-- Delete an entry from Book table
DELETE FROM Book
WHERE order_id = 109;

-- Update an entry from Book table
UPDATE Book
SET quantityInStock = 6
WHERE book_id = 123;

-- Delete an entry from Orders table
DELETE FROM Orders
WHERE order_id = 109;

-- Update an entry from Orders table
UPDATE Orders
SET totalPrice = 30.09
WHERE order_id = 100;

-- Delete an entry from PaymentMethod table
DELETE FROM PaymentMethod
WHERE customer_id = 10;

-- Update an entry from PaymentMethod table
UPDATE PaymentMethod
SET cardType = 'visa'
WHERE payment_id = 700;

-- Delete an entry from Customers table
DELETE FROM Customer
WHERE customer_id = 10;

-- Update an entry from Customers table
UPDATE Customer
SET email = 'larrydavid@gmail.com'
WHERE customer_id = 09;
