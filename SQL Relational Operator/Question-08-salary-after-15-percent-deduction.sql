-- Question 8
-- Find employees whose salary after a 15% deduction is greater than 50,000.

SELECT *
FROM EMPLOYEE
WHERE (SALARY * 0.85) > 50000;