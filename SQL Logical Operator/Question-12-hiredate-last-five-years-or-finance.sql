-- Question 12
-- Find employees who joined within the last five years OR whose department is Finance.

SELECT *
FROM EMPLOYEE
WHERE HIREDATE >= ADD_MONTHS(SYSDATE, -60)
   OR DEPARTMENT = 'Finance';

-- ---------------------------------------------------------------------------
-- Oracle SQL – ADD_MONTHS() function
-- ADD_MONTHS() adds or subtracts a number of months from a date.
-- ---------------------------------------------------------------------------
-- 1. Syntax: ADD_MONTHS(date, number_of_months)
--    date                → starting date
--    number_of_months    → months to add or subtract
--    Positive → add months | Negative → subtract | Zero → same date (Oracle rules)
--
-- 2. Practical examples (assume today is 17-Nov-2026)
--    ADD_MONTHS(SYSDATE, 12)   → 1 year from today
--    ADD_MONTHS(SYSDATE, 6)    → 6 months from today
--    ADD_MONTHS(SYSDATE, -12)  → 1 year ago
--    ADD_MONTHS(SYSDATE, -60)  → 5 years ago
--    ADD_MONTHS(SYSDATE, -36)  → 3 years ago
--    ADD_MONTHS(SYSDATE, -120) → 10 years ago
--
-- 3. Important points to remember
--    1. ADD_MONTHS() returns a DATE value.
--    2. It accepts positive, negative, and zero month values.
--    3. 12 months = 1 year.
--    4. 60 months = 5 years.
--    5. Combine with SYSDATE, AND, OR, >=, <=, and other conditions.
--    6. Month-end: if the start date is month-end or the target month is shorter,
--       Oracle adjusts to the last day of the target month.
--    7. Uses the session NLS_CALENDAR setting.
--
-- 4. ADD_MONTHS() vs MONTHS_BETWEEN()
--    ADD_MONTHS()       → compute a date by adding/subtracting months
--    MONTHS_BETWEEN()   → number of months between two dates