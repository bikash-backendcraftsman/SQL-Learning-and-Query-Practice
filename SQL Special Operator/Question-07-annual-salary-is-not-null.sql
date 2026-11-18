-- Question 7
-- Find employee id, employee name, salary, and annual salary from EMPLOYEE
-- where annual salary is not null.
-- Concept used: IS NOT NULL
--
-- ANNUAL_SALARY is not a table column; it is computed in the SELECT list
-- as (12 * SALARY * 1.10). In the WHERE clause we cannot use the alias
-- ANNUAL_SALARY, so we repeat the expression and apply IS NOT NULL there.
-- Rows are returned only when that calculated value is not null.

SELECT EMP_ID,
       EMP_NAME,
       SALARY,
       (12 * SALARY * 1.10) AS ANNUAL_SALARY
FROM EMPLOYEE
WHERE (12 * SALARY * 1.10) IS NOT NULL;