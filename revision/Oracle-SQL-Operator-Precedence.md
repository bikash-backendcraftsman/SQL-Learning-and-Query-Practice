# Oracle SQL – Operator Precedence

Operator precedence determines the order in which Oracle evaluates operators in an expression or `WHERE` condition.

## 1. Order of precedence (high → low)

| Priority | Operator | Description |
|----------|----------|-------------|
| 1 | `()` | Parentheses |
| 2 | `+`, `-` (unary) | Positive / negative |
| 3 | `*`, `/` | Multiplication / division |
| 4 | `+`, `-` | Addition / subtraction |
| 5 | `=`, `<>`, `>`, `<`, `>=`, `<=`, `LIKE`, `IN`, `BETWEEN`, `IS NULL` | Comparison conditions |
| 6 | `NOT` | Logical negation |
| 7 | `AND` | Both conditions |
| 8 | `OR` | Either condition |

## 2. Example

```sql
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT'
   OR DEPARTMENT = 'HR'
  AND SALARY > 70000;
```

Oracle evaluates **AND** before **OR**.

Therefore, it is equivalent to:

```sql
WHERE DEPARTMENT = 'IT'
   OR (DEPARTMENT = 'HR' AND SALARY > 70000);
```

## 3. How parentheses change the result

```sql
WHERE (DEPARTMENT = 'IT' OR DEPARTMENT = 'HR')
  AND SALARY > 70000;
```

Now both IT and HR employees must have a salary greater than ₹70,000.

## 4. Important points to remember

1. Parentheses control evaluation order.
2. Multiplication and division happen before addition and subtraction.
3. Comparison conditions are evaluated before logical operators.
4. `NOT` has higher precedence than `AND`.
5. `AND` has higher precedence than `OR`.
6. When combining `AND` and `OR`, use parentheses to make your intention clear.

## Interview tip

Remember this sequence:

**`()` → Arithmetic → Comparison → NOT → AND → OR**