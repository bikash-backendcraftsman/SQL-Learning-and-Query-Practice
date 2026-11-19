-- Question 2
-- Add spaces between values.
-- Concept used: concatenation + space

SELECT EMP_ID
       || '  '
       || EMP_NAME
       || '  '
       || 'WORKS IN'
       || '  '
       || DEPARTMENT
FROM EMPLOYEE;