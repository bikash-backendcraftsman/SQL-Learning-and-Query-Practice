-- Question 1
-- COMMIT — permanently save a salary update.

UPDATE EMPLOYEE
SET SALARY = 70000
WHERE EMP_ID = 1;

COMMIT;