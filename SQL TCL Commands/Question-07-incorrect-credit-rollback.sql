-- Question 7
-- Incorrect balance update — Priya Singh (ACCOUNT_ID = 102).
-- Priya was mistakenly credited ₹20,000. Practice: update balance, verify,
-- realize the mistake, and undo with ROLLBACK (do not COMMIT the wrong update).

-- View all bank accounts (optional context before working on one row).
SELECT * FROM BANK_ACCOUNT;

-- Verify Priya's record and current balance before changing anything.
SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 102;

-- Apply an incorrect balance adjustment (add ₹5,000 in this script).
UPDATE BANK_ACCOUNT
SET BALANCE = BALANCE + 5000
WHERE ACCOUNT_ID = 102;

-- Check the updated balance in the same session (uncommitted until COMMIT).
SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 102;

-- Undo the UPDATE — balance returns to the last committed value.
ROLLBACK;

-- Confirm balance after ROLLBACK (should match pre-UPDATE committed state).
SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 102;