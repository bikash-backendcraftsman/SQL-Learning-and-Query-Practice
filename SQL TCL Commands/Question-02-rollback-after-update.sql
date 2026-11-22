-- Question 2
-- ROLLBACK — undo an uncommitted salary update.

UPDATE EMPLOYEE
SET SALARY = 90000
WHERE EMP_ID = 1;

ROLLBACK;