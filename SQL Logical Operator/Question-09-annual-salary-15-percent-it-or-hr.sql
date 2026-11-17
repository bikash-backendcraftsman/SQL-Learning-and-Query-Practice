-- Question 9
-- Find employees whose annual salary after a 15% increment is greater than ₹10,00,000
-- AND who belong to IT or HR.
-- We can solve this by using the IN operator as well.

-- Query 1
SELECT EMP_ID,
       EMP_NAME,
       DEPARTMENT,
       SALARY,
       HIREDATE,
       DOB,
       (12 * SALARY * 1.15) AS ANNUAL_SALARY
FROM EMPLOYEE
WHERE 12 * SALARY * 1.15 > 1000000
  AND (DEPARTMENT = 'IT' OR DEPARTMENT = 'HR');

-- Query 2 (same logic using IN)
SELECT EMP_ID,
       EMP_NAME,
       DEPARTMENT,
       SALARY,
       HIREDATE,
       DOB,
       (12 * SALARY * 1.15) AS ANNUAL_SALARY
FROM EMPLOYEE
WHERE 12 * SALARY * 1.15 > 1000000
  AND DEPARTMENT IN ('IT', 'HR');