-- Question 6
-- Find employees who do NOT belong to the HR department.

SELECT *
FROM EMPLOYEE
WHERE NOT DEPARTMENT = 'HR';