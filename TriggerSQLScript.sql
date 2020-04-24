-- Christelle Nieves
-- Trigger SQL Script for Bookstore database

-- Statement to drop dataLog table if it exists
DROP TABLE IF EXISTS dataLog;

-- Statement to create dataLog table
CREATE TABLE dataLog(
    id INT,
    time TIMESTAMP,
    user VARCHAR(100),
    tableName VARCHAR(100),
    action VARCHAR(200)
);

-- Statement to drop trigger if it exists
DROP TRIGGER IF EXISTS afterInsert;
DROP TRIGGER IF EXISTS afterUpdate;
DROP TRIGGER IF EXISTS afterDelete;

-- Create trigger that fires on insert (Trigger 1)
DELIMITER //

CREATE TRIGGER afterInsert
AFTER INSERT
   ON Author FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO dataLog
   ( id, time, user, action)
   VALUES
   ( 1234567890, SYSDATE(), vUser, 'Author', 'Inserted an author');

END; //

DELIMITER ;

-- Create trigger that fires on update (Trigger 2)
DELIMITER //

CREATE TRIGGER afterUpdate
AFTER UPDATE
   ON Author FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO dataLog
   ( id, time, user, action)
   VALUES
   ( 123456789066, SYSDATE(), vUser, 'Author', 'Updated an author');

END; //

DELIMITER ;

-- Create trigger that fires on deletion(Trigger 3)
DELIMITER //

CREATE TRIGGER afterDelete
AFTER DELETE
   ON Author FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO dataLog
   ( id, time, user, action)
   VALUES
   ( 12345678999, SYSDATE(), vUser, 'Author', 'Deleted an author');

END; //

DELIMITER ;

-- Statement that causes trigger 1 to fire
INSERT INTO Author(author_id, firstName, lastName, birthDate)
VALUES(40404040, 'Alexander', 'Hamilton', '2020-04-04');

-- Statement that validates trigger 1 was fired
SELECT *
FROM dataLog
WHERE action = 'Inserted an author';

-- Statement that causes trigger 2 to fire
UPDATE Author
SET firstName = 'Alex'
WHERE firstName = 'Alexander';

-- Statement that validates trigger 2 was fired
SELECT *
FROM dataLog
WHERE action = 'Updated an author';

-- Statement that causes trigger 3 to fire
DELETE FROM Author
WHERE firstName = 'Alex';

-- Statement that validates trigger 3 was fired
SELECT *
FROM dataLog
WHERE action = 'Deleted an author';

-- Statement showing all records in dataLog table
SELECT *
FROM dataLog;