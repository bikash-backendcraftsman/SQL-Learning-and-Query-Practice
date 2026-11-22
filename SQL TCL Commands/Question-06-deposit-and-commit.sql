-- Question 6
-- Rahul Sharma (ACCOUNT_ID = 101) deposits ₹10,000.
-- Update balance, verify, then COMMIT and verify again.

-- Select matching records to verify balance (before update).
SELECT *
FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 101;

-- Update the balance according to the deposit.
UPDATE BANK_ACCOUNT
SET BALANCE = BALANCE + 10000
WHERE ACCOUNT_ID = 101;

-- Commit the updated changes.
COMMIT;

-- Verify the updated changes (after commit).
SELECT *
FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 101;