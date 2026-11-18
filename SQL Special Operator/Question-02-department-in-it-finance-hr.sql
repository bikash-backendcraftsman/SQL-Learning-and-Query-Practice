-- Question 2
-- Display employee records from IT, Finance, and HR departments
-- in ascending order by department.
-- Concept used: IN operator

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT IN ('IT', 'Finance', 'HR')
ORDER BY DEPARTMENT ASC;