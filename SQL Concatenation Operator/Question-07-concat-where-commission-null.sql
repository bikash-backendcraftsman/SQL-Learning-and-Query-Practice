-- Question 7
-- Find employees whose combined name and department equals 'RahulIT'
-- and commission is NULL.

SELECT *
FROM EMPLOYEE
WHERE EMP_NAME || DEPARTMENT = 'RahulIT'
  AND COMMISSION IS NULL;