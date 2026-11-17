-- Question 2
-- Find employees whose annual salary is greater than 8,00,000.

SELECT EMP_ID,
       EMP_NAME,
       DEPARTMENT,
       SALARY,
       HIREDATE,
       DOB,
       (12 * SALARY) AS ANNUAL_SALARY
FROM EMPLOYEE
WHERE (12 * SALARY) > 800000;
