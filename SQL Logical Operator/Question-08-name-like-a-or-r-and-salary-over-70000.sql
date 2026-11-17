-- Question 8
-- Find employees whose names start with A or R AND whose salary is greater than ₹70,000.

-- Understand the difference
-- = checks exact equality.
-- LIKE checks patterns.
-- 'A%' means starts with A.
-- 'R%' means starts with R.
-- '%A' means ends with A; '%R' means ends with R.

SELECT *
FROM EMPLOYEE
WHERE (UPPER(EMP_NAME) LIKE '%A' OR UPPER(EMP_NAME) LIKE '%R') AND SALARY > 70000;