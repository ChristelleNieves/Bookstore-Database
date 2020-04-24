-- Christelle Nieves
-- Stored Procedure SQL Script for Bookstore database

-- Two statements that drop the two stored procedures
DROP PROCEDURE IF EXISTS AddAuthor;
DROP PROCEDURE IF EXISTS AddCustomer;

DELIMITER //

CREATE PROCEDURE AddAuthor
(IN id INT, IN fName VARCHAR(20), IN lName VARCHAR(20), IN bDay DATE, OUT mssg VARCHAR(100))

BEGIN
    IF (id < 0) THEN
        SELECT "Invalid id" INTO mssg;
    ELSEIF (ISNULL(fName)) THEN
        SELECT "Must enter a first name" INTO mssg;
    ELSEIF (ISNULL(lName)) THEN
        SELECT "Must enter a last name" INTO mssg;
    ELSEIF ISNULL(ISNULL(bDay)) THEN
        SELECT "Must enter a birth date" INTO mssg;
    ELSE
        INSERT INTO Author(author_id, firstName, lastName, birthDate)
        VALUES(id, fName, lName, bDay);

        SELECT "Author added" INTO mssg;

    END IF ;
END //

DELIMITER ;

-- Another stored procedure that validates all attributes

DELIMITER //

CREATE PROCEDURE AddCustomer
(IN cId INT, IN fName VARCHAR(20), IN lName VARCHAR(20), IN mail VARCHAR(20), OUT mssg VARCHAR(100))

BEGIN
    IF (cId < 0) THEN
        SELECT "Invalid order id" INTO mssg;
    ELSEIF (ISNULL(fName)) THEN
        SELECT "Must enter a first name" INTO @mssg;
    ELSEIF (ISNULL(lName)) THEN
        SELECT "Must enter a last name" INTO mssg;
    ELSEIF (ISNULL(mail)) THEN
        SELECT "Must enter an email address" INTO mssg;
    ELSE
        INSERT INTO Customer(customer_id, firstName, lastName, email)
        VALUES(cId, fName, lName, mail);

        SELECT "Customer added" INTO mssg;
    
    END IF;
END //

DELIMITER ;

-- Statements that call procedure 1 (AddAuthor)

--Will show an invalid id error mssg
CALL AddAuthor(-7, 'Bill', 'Gates', 1960-04-06, @mssg);
SELECT @mssg;

-- Will show an invalid first name error mssg 
CALL AddAuthor(777, NULL, 'Gates', 1960-04-06, @mssg);
SELECT @mssg;

-- Will show an invalid last name mssg
CALL AddAuthor(777, 'Bill', NULL, 1960-04-06, @mssg);
SELECT @mssg;

-- Will show an invalid birth date mssg
CALL AddAuthor(777, 'Bill', 'Gates', NULL, @mssg);
SELECT @mssg;

-- Will pass all parameter checks and add the author to the table
CALL AddAuthor(777, 'Bill', 'Gates', 1960-04-06, @mssg);
SELECT @mssg;

-- Statements that call procedure 2 (AddCustomer)

-- Will show an invalid customer id mssg
CALL AddCustomer(-100, 'Christelle', 'Nieves', 'c123456@gmail.com', @outmssg);
SELECT @outmssg;

-- Will show an invalid first name mssg
CALL AddCustomer(44440, NULL, 'Nieves', 'c123456@gmail.com', @outmssg);
SELECT @outmssg;

-- Will show an invalid last name mssg
CALL AddCustomer(44440, 'Christelle', NULL, 'c123456@gmail.com', @outmssg);
SELECT @outmssg;

-- Will show an invalid email address mssg
CALL AddCustomer(44440, 'Christelle', 'Nieves', NULL, @outmssg);
SELECT @outmssg;