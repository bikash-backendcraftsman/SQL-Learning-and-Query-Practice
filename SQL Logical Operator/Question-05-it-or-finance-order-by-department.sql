-- Question 5
-- Find employees who belong to either IT or Finance department
-- in ascending order by department.

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT' OR DEPARTMENT = 'Finance'
ORDER BY DEPARTMENT ASC;