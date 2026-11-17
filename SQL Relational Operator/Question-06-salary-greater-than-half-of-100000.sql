-- Question 6
-- Find employees whose monthly salary is greater than half of 1,00,000.

SELECT *
FROM EMPLOYEE
WHERE SALARY > (100000 / 2);