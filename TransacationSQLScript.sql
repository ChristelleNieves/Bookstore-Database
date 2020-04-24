-- Christelle Nieves
-- Transaction SQL Script for Bookstore Database

-- Drop the two procedures
DROP PROCEDURE IF EXISTS addAuthorNoExceptionNoWarning;
DROP PROCEDURE IF EXISTS addAuthorExceptionWarning;

-- Create the procedures
DELIMITER //

CREATE PROCEDURE addAuthorNoExceptionNoWarning()

BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SELECT 'An error has occured and triggered a SQL EXCEPTION.';
END;

DECLARE EXIT HANDLER FOR SQLWARNING
BEGIN
    ROLLBACK;
    SELECT 'An error has occured and triggered a SQL Warning.';
END;

START TRANSACTION;

-- Insert a record into the Author table without causing an exception
INSERT INTO Author(author_id, firstName, lastName, birthDate)
VALUES(100, 'Bob', 'Smith', '1970-04-01');

END //

-- Create the procedure that will trigger an exception

DELIMITER //

CREATE PROCEDURE addAuthorExceptionWarning()

BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SELECT 'An error has occured and triggered a SQL Exception.';
END;

DECLARE EXIT HANDLER FOR SQLWARNING
BEGIN
    ROLLBACK;
    SELECT 'An error has occured and triggered a SQL Warning.';
END;

START TRANSACTION;

-- Insert an author into the author table and trigger an exception
-- There is already an author with the author_id of 200, so this will cause an error
INSERT INTO Author(author_id, firstName, lastName, birthDate)
VALUES(200, 'Bill', 'Nye', '1965-05-13');

END //

DELIMITER ;

-- Call the procedures
CALL addAuthorNoExceptionNoWarning();
CALL addAuthorExceptionWarning();