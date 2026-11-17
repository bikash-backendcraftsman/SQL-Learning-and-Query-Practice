-- Question 10
-- Find employees who belong to IT, HR or Finance AND whose salary is greater than ₹60,000.
--
-- Important concept to remember:
-- IN is not a logical operator like AND or OR.
-- It is a membership condition that provides a shorter way to express multiple equality comparisons.

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT IN ('IT', 'HR', 'Finance')
  AND SALARY > 60000;