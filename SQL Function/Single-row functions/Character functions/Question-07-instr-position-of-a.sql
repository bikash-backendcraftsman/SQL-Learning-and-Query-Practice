-- Question 7
-- Find the position of the letter 'A' in each employee name using INSTR().
-- Function concept used : INSTR() : Find the starting position of a substring inside a string (0 if not found).

SELECT EMP_NAME,
       INSTR(EMP_NAME, 'A')
FROM EMPLOYEE;

-- Optional style — alias with AS for a clear column name.
SELECT EMP_NAME,
       INSTR(EMP_NAME, 'A') AS A_POSITION
FROM EMPLOYEE;