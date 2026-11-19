-- Question 8
-- Update employee 101 by appending ' - Experienced' to their name.

UPDATE EMPLOYEE
SET EMP_NAME = EMP_NAME || ' - Experienced'
WHERE EMP_ID = 101;