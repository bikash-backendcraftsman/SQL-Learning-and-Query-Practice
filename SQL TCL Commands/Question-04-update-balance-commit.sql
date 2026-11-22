-- Question 4
-- Update balance of bank account where account id = 101, then commit.

UPDATE BANK_ACCOUNT
SET BALANCE = 90000
WHERE ACCOUNT_ID = 101;

COMMIT;

SELECT * FROM BANK_ACCOUNT;