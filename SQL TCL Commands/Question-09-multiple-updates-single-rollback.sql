-- Question 9
-- Multiple account updates (single transaction, one ROLLBACK undoes all three).
--
-- Task:
-- Increase balance for:
--   • Amit Kumar  — + ₹5,000
--   • Neha Verma  — + ₹3,000
--   • Vikash Das  — + ₹7,000
-- Steps:
--   1. Verify the three customers before updating.
--   2. Run all three UPDATE statements (one transaction until COMMIT).
--   3. Verify balances after updates.
--   4. ROLLBACK once — undoes all three uncommitted updates.
--   5. Verify balances are back to committed values.
--
-- Points to remember:
-- • Multiple DML statements in one session share one transaction until COMMIT.
-- • One ROLLBACK reverses every uncommitted change since the last COMMIT.
-- • Run SELECT before and after ROLLBACK to see the effect.

-- Verify the three customers before any change.
SELECT *
FROM BANK_ACCOUNT
WHERE CUSTOMER_NAME = 'Amit Kumar'
   OR CUSTOMER_NAME = 'Neha Verma'
   OR CUSTOMER_NAME = 'Vikash Das';

-- Update all three, one by one (same transaction).
UPDATE BANK_ACCOUNT
SET BALANCE = BALANCE + 5000
WHERE CUSTOMER_NAME = 'Amit Kumar';

UPDATE BANK_ACCOUNT
SET BALANCE = BALANCE + 3000
WHERE CUSTOMER_NAME = 'Neha Verma';

UPDATE BANK_ACCOUNT
SET BALANCE = BALANCE + 7000
WHERE CUSTOMER_NAME = 'Vikash Das';

-- Verify all records after updates (still uncommitted).
SELECT * FROM BANK_ACCOUNT;

-- Undo all three updates with a single ROLLBACK.
ROLLBACK;

-- Verify all accounts after rollback.
SELECT * FROM BANK_ACCOUNT;