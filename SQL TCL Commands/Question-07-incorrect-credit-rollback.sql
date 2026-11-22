-- Question 7
-- Incorrect balance update — Priya Singh (ACCOUNT_ID = 102).
-- Scenario: mistaken ₹20,000 credit; practice update, verify, then ROLLBACK.
-- (Query uses BALANCE + 5000 as written in practice.)

SELECT * FROM BANK_ACCOUNT;

-- Verify the record before changing.
SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 102;

UPDATE BANK_ACCOUNT
SET BALANCE = BALANCE + 5000
WHERE ACCOUNT_ID = 102;

SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 102;

ROLLBACK;

SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 102;