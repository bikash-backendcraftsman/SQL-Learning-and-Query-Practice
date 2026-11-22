-- Question 6
-- Extract the first three characters of each employee name using SUBSTR().
-- Function concept used : SUBSTR() : Extract part of a string from a start position for a given length.

SELECT EMP_NAME,
       SUBSTR(EMP_NAME, 1, 3) AS EMP_SUBSTR
FROM EMPLOYEE;