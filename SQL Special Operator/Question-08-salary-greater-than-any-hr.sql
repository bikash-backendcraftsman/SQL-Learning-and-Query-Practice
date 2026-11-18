-- Question 8
-- Find employees whose salary is greater than ANY HR employee's salary.
-- Concept used: ANY operator

SELECT *
FROM EMPLOYEE
WHERE SALARY > ANY (
    SELECT SALARY
    FROM EMPLOYEE
    WHERE DEPARTMENT = 'HR'
);