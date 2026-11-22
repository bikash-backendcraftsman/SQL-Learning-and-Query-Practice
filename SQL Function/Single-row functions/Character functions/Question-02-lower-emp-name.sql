-- Question 2
-- Display all employee names in lowercase using LOWER().
-- Function concept used : LOWER() : Convert text to lowercase for display and case-normalization.

SELECT EMP_NAME,
       LOWER(EMP_NAME) AS EMP_LOWER_CASE
FROM EMPLOYEE;