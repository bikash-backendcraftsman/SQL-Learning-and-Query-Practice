-- Question 5
-- Display employee name followed by salary and calculated annual salary (12 * SALARY),
-- ordered by salary ascending.

SELECT EMP_NAME
       || '  '
       || SALARY
       || '  '
       || (12 * SALARY) AS ANNUAL_SALARY
FROM EMPLOYEE
ORDER BY SALARY ASC;