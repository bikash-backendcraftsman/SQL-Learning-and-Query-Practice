-- Question 8
-- Account status modification — Suresh Patel (ACCOUNT_ID = 107).
-- Change status from INACTIVE to ACTIVE; verify, COMMIT, verify again.

-- Verify the account based on the question (before update).
SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 107;

-- Updating the account status to ACTIVE.
UPDATE BANK_ACCOUNT
SET ACCOUNT_STATUS = 'ACTIVE'
WHERE ACCOUNT_ID = 107;

-- Verify the change in the current session (pending until COMMIT).
SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 107;

-- Permanently save the status change.
COMMIT;

-- Verify after COMMIT (change is permanent).
SELECT * FROM BANK_ACCOUNT
WHERE ACCOUNT_ID = 107;