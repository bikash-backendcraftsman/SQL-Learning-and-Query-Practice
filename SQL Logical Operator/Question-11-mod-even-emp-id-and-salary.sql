-- Question 11
-- Find employees who joined within the last five years OR whose department is Finance.

SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = 0
  AND SALARY > 50000;

-- Why MOD()?
-- MOD(number, divisor) returns the remainder after division.
--
-- EMP_ID  MOD(EMP_ID, 2)  Result
-- 10      0               Even
-- 11      1               Odd
-- 12      0               Even
-- 13      1               Odd
--
-- MOD(EMP_ID, 2) = 0 → Even numbers.
-- MOD(EMP_ID, 2) = 1 → Odd numbers.
-- AND SALARY > 50000 → Salary must also exceed ₹50,000.
--
-- Remember: MOD() is a numeric function frequently used in SQL interviews
-- and real-world data filtering.