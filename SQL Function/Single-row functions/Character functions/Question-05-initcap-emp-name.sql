-- Question 5
-- Display employee names with each word capitalized using INITCAP().
-- Concept: Character function — INITCAP()
--
-- What INITCAP() does
-- • Uppercases the first character of each word in the string.
-- • Lowercases the remaining characters in each word.
-- • Words are separated by spaces (and some punctuation in Oracle).
--
-- Example: 'bikash mohapatra' → 'Bikash Mohapatra'
--          'RAHUL KUMAR'      → 'Rahul Kumar'
--
-- Why use it?
-- • Standardize display names for reports and UI.
-- • Clean up user-entered text (all caps or all lower).
-- • Title-case formatting without manual editing.
--
-- How to use
-- • SELECT INITCAP(EMP_NAME) AS formatted_name FROM EMPLOYEE;
-- • WHERE INITCAP(column) = 'Rahul Kumar' (compare carefully — prefer storing clean data).
-- • Combine with TRIM: INITCAP(TRIM(EMP_NAME))

SELECT EMP_NAME,
       INITCAP(EMP_NAME) AS EMP_NAME_INITCAP
FROM EMPLOYEE;