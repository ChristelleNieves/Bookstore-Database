-- Christelle Nieves
-- Optimization script for Bookstore database

-- Drop the index we will create later in the script
DROP INDEX customer_firstName ON Customer;

-- A query that uses a select statement
SELECT *
FROM Customer
WHERE firstName LIKE "M%"
;

-- A query that uses Explain on the above query
EXPLAIN
SELECT *
FROM Customer
WHERE firstName LIKE "M%"
;

-- Create the index "customer_firstName"
CREATE INDEX customer_firstName
ON Customer(firstName);

-- Run the same select statement query from before
SELECT *
FROM Customer
WHERE firstName LIKE "M%"
;

-- Run explain on the query
EXPLAIN
SELECT *
FROM Customer
WHERE firstName LIKE "M%"
;