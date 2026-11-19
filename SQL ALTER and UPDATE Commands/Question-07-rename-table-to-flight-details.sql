-- Question 7
-- Rename the table to FLIGHT_DETAILS.
--
-- Understand the difference
-- Operation              | Correct syntax
-- Rename table           | RENAME old_name TO new_name;
-- Rename column          | ALTER TABLE table_name RENAME COLUMN old_name TO new_name;
-- Modify column          | ALTER TABLE table_name MODIFY (column_name datatype);
--
-- Important points
-- 1. RENAME is a DDL command.
-- 2. Use TO instead of =.
-- 3. Oracle does not use ALTER TABLE for renaming a table.
-- 4. A successful rename cannot be rolled back.

RENAME FLIGHT_MANAGEMENT TO FLIGHT_DETAILS;

COMMIT;

SELECT * FROM FLIGHT_DETAILS;