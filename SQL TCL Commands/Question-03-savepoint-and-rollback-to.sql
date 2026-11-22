-- Question 3
-- SAVEPOINT and ROLLBACK TO SAVEPOINT — partial undo.

UPDATE EMPLOYEE
SET SALARY = 70000
WHERE EMP_ID = 1;

SAVEPOINT SP1;

UPDATE EMPLOYEE
SET SALARY = 80000
WHERE EMP_ID = 2;

SAVEPOINT SP2;

UPDATE EMPLOYEE
SET SALARY = 90000
WHERE EMP_ID = 3;

-- Undo changes after SP1 only (EMP_ID 2 and 3 updates).
ROLLBACK TO SP1;

-- Optional: undo work back to start of transaction.
-- ROLLBACK TO SP2;

-- Save remaining pending changes.
-- COMMIT;