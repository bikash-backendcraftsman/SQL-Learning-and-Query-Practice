-- Question 3
-- Find employees who belong to IT or HR and earn more than ₹70,000 in ascending order by department.

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT' OR DEPARTMENT = 'HR' AND SALARY > 70000
ORDER BY DEPARTMENT ASC;