-- Question 3
-- Find the length of every employee name using LENGTH()
-- and sort by name length in ascending order.
-- Concept: LENGTH() in SELECT; ORDER BY can use a column alias in Oracle.

SELECT EMP_NAME,
       LENGTH(EMP_NAME) AS EMP_WORD_LENGTH
FROM EMPLOYEE
ORDER BY EMP_WORD_LENGTH ASC;