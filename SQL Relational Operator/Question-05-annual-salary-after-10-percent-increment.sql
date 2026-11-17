-- Question 5
-- Find employees whose annual salary after a 10% increment is greater than or equal to 8,00,000.

SELECT EMP_ID,
       EMP_NAME,
       DEPARTMENT,
       SALARY,
       HIREDATE,
       DOB,
       (12 * SALARY * 1.10) AS ANNUAL_SALARY
FROM EMPLOYEE
WHERE (12 * SALARY * 1.10) >= 800000;
