-- Question 1
-- Display all employee names in uppercase using UPPER().
-- Concept: Character function — UPPER() converts text to uppercase.

SELECT EMP_NAME,
       UPPER(EMP_NAME)
FROM EMPLOYEE;

-- Optional style — alias with AS for a clear column name.
SELECT EMP_NAME,
       UPPER(EMP_NAME) AS EMP_NAME_UPPER
FROM EMPLOYEE;