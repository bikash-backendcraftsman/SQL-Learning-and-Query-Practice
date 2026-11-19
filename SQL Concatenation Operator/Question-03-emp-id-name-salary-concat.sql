-- Question 3
-- Combine employee ID, name, and salary.

SELECT EMP_ID
       || '    '
       || EMP_NAME
       || '    '
       || SALARY
FROM EMPLOYEE;