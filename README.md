# SQL Learning and Query Practice

I am currently focusing on learning **operators in relational databases** and practicing SQL queries that use them.

This repository is my practice space for writing, running, and reviewing queries built around relational operators.

## Current focus

- Comparison operators (`=`, `<>`, `<`, `>`, `<=`, `>=`)
- Logical operators (`AND`, `OR`, `NOT`)
- Range and set operators (`BETWEEN`, `IN`, `LIKE`)
- Null checks (`IS NULL`, `IS NOT NULL`)
- Arithmetic operators in `SELECT` and `WHERE`
- Set operators (`UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT`)
- **TCL** — `COMMIT`, `ROLLBACK`, `SAVEPOINT`, transaction control
- **SQL functions** — single-row, aggregate, and conversion functions (current focus)

## Relational operators — important concepts to remember

1. Relational operators are generally used inside the `WHERE` clause.
2. Arithmetic expressions can be combined with relational operators.
3. You can compare columns with calculated values.
4. Relational comparisons return **TRUE**, **FALSE**, or **UNKNOWN** (for example, when `NULL` is involved).
5. `NULL` cannot be compared using `=` or `<>`. Use `IS NULL` or `IS NOT NULL`.

## Solved challenges

- [SQL Relational Operator](SQL%20Relational%20Operator) — comparison and other relational operators
- [SQL Logical Operator](SQL%20Logical%20Operator) — `AND`, `OR`, `NOT` in the `WHERE` clause
- [SQL Special Operator](SQL%20Special%20Operator) — `BETWEEN`, `IN`, `LIKE`, `IS NULL`, and related conditions
- [SQL Concatenation Operator](SQL%20Concatenation%20Operator) — combine columns and literals with `||`
- [SQL ALTER and UPDATE Commands](SQL%20ALTER%20and%20UPDATE%20Commands) — `ALTER TABLE` and `UPDATE` on `FLIGHT_MANAGEMENT`
- [SQL TCL Commands](SQL%20TCL%20Commands) — transaction control with `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- [SQL Function](SQL%20Function) — Oracle SQL functions in queries

## Revision notes

- [Oracle SQL – Operator Precedence](revision/Oracle-SQL-Operator-Precedence.md)
- [Oracle SQL Special Operators – Syntax](revision/Oracle-SQL-Special-Operators-Syntax.md)
- [Oracle SQL – LIKE pattern matching](revision/Oracle-SQL-LIKE-Pattern-Matching.md)
- [Oracle SQL – Concatenation operators](revision/Oracle-SQL-Concatenation-Operators-Syntax.md)
- [Oracle SQL – Command categories (DDL, DML, DRL, TCL, DCL)](revision/Oracle-SQL-Command-Categories.md)
- [Oracle SQL – TCL (Transaction Control)](revision/Oracle-SQL-TCL-Transaction-Control.md)
- [SQL Function Revision](revision/SQL%20Function%20Revision/README.md) — function-specific notes only

## How I practice

1. Write a query that uses one operator.
2. Run it and check the result.
3. Note what the operator includes and excludes.
4. Combine operators and practice again.

## Study log

- **2026-11-20** — Continued Oracle DDL on `FLIGHT_MANAGEMENT` / `FLIGHT_DETAILS`: `ALTER` (ADD, MODIFY, DROP, RENAME COLUMN) and table `RENAME`.
- **2026-11-22** — **TCL**: `COMMIT`, `ROLLBACK`, `SAVEPOINT`, and `ROLLBACK TO SAVEPOINT` on `EMPLOYEE`.
- **2026-11-24** — **INSTR()** character function practice on `EMPLOYEE` names.

