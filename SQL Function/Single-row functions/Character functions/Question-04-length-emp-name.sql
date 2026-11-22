-- Question 4
-- Find the length of every employee name using LENGTH().
-- Concept: Character function — LENGTH() returns the number of characters in a string.
--
-- Is this query correct?
-- Yes. LENGTH(EMP_NAME) counts characters in each name; one result per row (single-row function).
-- In Oracle, LENGTH() counts characters; use LENGTHB() if you need byte length (multibyte data).
--
-- Why use LENGTH()?
-- • Validate name length (forms, HR rules, column limits).
-- • Filter or sort by how long a name is.
-- • Drive SUBSTR / LPAD / RPAD (e.g. last N characters).
-- • Data quality checks (unusually short or long names).
--
-- Different ways to use LENGTH()
-- • In SELECT list: LENGTH(EMP_NAME) AS name_len
-- • In WHERE: WHERE LENGTH(EMP_NAME) > 15
-- • In ORDER BY: ORDER BY LENGTH(EMP_NAME) DESC
-- • In expressions: SUBSTR(EMP_NAME, 1, LENGTH(EMP_NAME) - 1)
--
-- Use cases
-- • Reports showing name length next to the name.
-- • Finding employees whose names exceed a display width.
-- • Trimming or masking logic combined with SUBSTR and LENGTH.

SELECT EMP_NAME,
       LENGTH(EMP_NAME) AS EMP_WORD_LENGTH
FROM EMPLOYEE;