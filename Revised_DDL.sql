-- Christelle Nieves
-- Revised DDL Script for Bookstore database

-- Drop tables
DROP TABLE IF EXISTS Author_Book;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS PaymentMethod;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS CardInfo;

-- Create Author Table
CREATE TABLE Author(
author_id INT,
firstName VARCHAR(20),
lastName VARCHAR(20),
birthDate DATE,
PRIMARY KEY(author_id)
); 

-- Create Customer Table
CREATE TABLE Customer(
customer_id INT,
firstName VARCHAR(20),
lastName VARCHAR(20),
email VARCHAR(50),
PRIMARY KEY(customer_id)
);

-- Create CardInfo Table
CREATE TABLE CardInfo(
cardNumber VARCHAR(20),
cardType VARCHAR(20),
PRIMARY KEY(cardNumber)
);

-- Create Payment Method Table
CREATE TABLE PaymentMethod(
payment_id INT,
cardNumber VARCHAR(20),
customer_id INT,
PRIMARY KEY(payment_id),
FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

-- Create Order Table
CREATE TABLE Orders(
order_id INT,
customer_id INT,
orderDate DATE,
payment_id INT,
totalPrice FLOAT,
PRIMARY KEY(order_id),
FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
FOREIGN KEY(payment_id) REFERENCES PaymentMethod(payment_id) ON DELETE CASCADE
);

-- Create Book Table
CREATE TABLE Book(
book_id INT,
bookTitle VARCHAR(50),
order_id INT,
quantityInStock INT,
price FLOAT,
author_id INT,
PRIMARY KEY(book_id),
FOREIGN KEY(order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
FOREIGN KEY(author_id) REFERENCES Author(author_id) ON DELETE CASCADE
);

-- Create Author_Book Table
CREATE TABLE Author_Book(
author_id INT,
book_id INT,
FOREIGN KEY(author_id) REFERENCES Author(author_id) ON DELETE CASCADE,
FOREIGN KEY(book_id) REFERENCES Book(book_id) ON DELETE CASCADE
);