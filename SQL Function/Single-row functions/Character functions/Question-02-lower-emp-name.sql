-- Question 2
-- Display all employee names in lowercase using LOWER().
-- Concept: Character function — LOWER() converts text to lowercase.

SELECT EMP_NAME,
       LOWER(EMP_NAME) AS EMP_LOWER_CASE
FROM EMPLOYEE;