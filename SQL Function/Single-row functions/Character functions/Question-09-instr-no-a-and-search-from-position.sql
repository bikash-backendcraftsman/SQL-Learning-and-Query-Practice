-- Question 9
-- More INSTR() practice (related to Questions 7–8).
-- Function concept used : INSTR() : Test whether a substring exists, or search from a chosen start position in the string.

-- 9a — Employee names that do not contain 'A'.
SELECT EMP_NAME,
       INSTR(EMP_NAME, 'A') AS A_POSITION
FROM EMPLOYEE
WHERE INSTR(EMP_NAME, 'A') = 0;

-- 9b — First 'A' found when search starts from the 2nd character (0 if none from there).
SELECT EMP_NAME,
       INSTR(EMP_NAME, 'A', 2) AS A_POSITION_FROM_2
FROM EMPLOYEE;