-- Question 2
-- Find employees who belong to IT and whose annual salary after a 10% increment is greater than ₹8,00,000.

SELECT EMP_ID,
       EMP_NAME,
       DEPARTMENT,
       SALARY,
       HIREDATE,
       DOB,
       (12 * SALARY * 1.10) AS ANNUAL_SALARY
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT' AND (12 * SALARY * 1.10) > 800000;