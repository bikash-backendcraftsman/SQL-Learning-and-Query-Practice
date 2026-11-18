-- Question 1
-- Employees not belonging to Finance based on department in descending order.

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT <> 'Finance'
ORDER BY DEPARTMENT DESC;