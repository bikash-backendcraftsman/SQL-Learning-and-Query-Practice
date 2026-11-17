-- Question 1
-- Find employees who belong to the IT department AND earn more than ₹70,000.

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT' AND SALARY > 70000;