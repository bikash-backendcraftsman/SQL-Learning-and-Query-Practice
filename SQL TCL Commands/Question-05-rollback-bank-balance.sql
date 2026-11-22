-- Question 5
-- Update balance for account 101, check status, then rollback.
-- Previous balance: 50000, updated to 90000, then ROLLBACK restores committed value.

UPDATE BANK_ACCOUNT
SET BALANCE = 90000
WHERE ACCOUNT_ID = 101;

SELECT * FROM BANK_ACCOUNT;

ROLLBACK;

SELECT * FROM BANK_ACCOUNT;