-- Question 7
-- Find employees whose salary multiplied by 12 and divided by 2 is greater than 4,00,000.

SELECT *
FROM EMPLOYEE
WHERE ((SALARY * 12) / 2) > 400000;