-- Question 7
-- Find employees whose salary is between ₹60,000 and ₹90,000 AND whose department is IT.
-- Query 1 and Query 2 are equivalent and produce the same result.

-- Query 1
SELECT *
FROM EMPLOYEE
WHERE (SALARY >= 60000 AND SALARY <= 90000) AND DEPARTMENT = 'IT';

-- Query 2
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 60000 AND 90000
  AND DEPARTMENT = 'IT';