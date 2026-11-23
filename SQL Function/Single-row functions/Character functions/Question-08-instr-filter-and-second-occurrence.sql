-- Question 8
-- More practice with INSTR() (related to Question 7).
-- Function concept used : INSTR() : Locate a substring; use with WHERE to filter rows, or nth occurrence to find later positions.

-- 8a — Only employees whose name contains 'A' (position greater than zero).
SELECT EMP_NAME,
       INSTR(EMP_NAME, 'A') AS A_POSITION
FROM EMPLOYEE
WHERE INSTR(EMP_NAME, 'A') > 0;

-- 8b — Position of the second 'A' in each name (0 if fewer than two).
SELECT EMP_NAME,
       INSTR(EMP_NAME, 'A', 1, 2) AS SECOND_A_POSITION
FROM EMPLOYEE;

-- 8c — Case-insensitive: find 'A' after uppercasing the name.
SELECT EMP_NAME,
       INSTR(UPPER(EMP_NAME), 'A') AS A_POSITION_IGNORE_CASE
FROM EMPLOYEE;