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

## Relational operators — important concepts to remember

1. Relational operators are generally used inside the `WHERE` clause.
2. Arithmetic expressions can be combined with relational operators.
3. You can compare columns with calculated values.
4. Relational comparisons return **TRUE**, **FALSE**, or **UNKNOWN** (for example, when `NULL` is involved).
5. `NULL` cannot be compared using `=` or `<>`. Use `IS NULL` or `IS NOT NULL`.

## Solved challenges

- [SQL Relational Operator](SQL%20Relational%20Operator) — comparison and other relational operators
- [SQL Logical Operator](SQL%20Logical%20Operator) — `AND`, `OR`, `NOT` in the `WHERE` clause

## Revision notes

- [Oracle SQL – Operator Precedence](revision/Oracle-SQL-Operator-Precedence.md)

## How I practice

1. Write a query that uses one operator.
2. Run it and check the result.
3. Note what the operator includes and excludes.
4. Combine operators and practice again.

