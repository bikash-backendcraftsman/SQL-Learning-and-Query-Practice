-- Question 4
-- Find employees who belong to the IT department AND have a salary greater than ₹70,000
-- in ascending order by employee name.

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT' AND SALARY > 70000
ORDER BY EMP_NAME ASC;