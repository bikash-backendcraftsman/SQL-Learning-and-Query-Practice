-- Question 9
-- Find employees whose age is not equal to 30.

SELECT EMP_ID,
       EMP_NAME,
       DEPARTMENT,
       SALARY,
       HIREDATE,
       DOB,
       TRUNC((SYSDATE - DOB) / 365) AS AGE
FROM EMPLOYEE
WHERE (SYSDATE - DOB) / 365 <> 30;