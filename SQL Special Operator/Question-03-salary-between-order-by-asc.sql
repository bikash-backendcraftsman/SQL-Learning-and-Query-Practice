-- Question 3
-- Find employees whose salary is between ₹30,000 and ₹60,000
-- based on salary in ascending order.
-- Concept used: BETWEEN ... AND operator
-- Remember: Both boundaries are inclusive.

SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 50000 AND 70000
ORDER BY SALARY ASC;