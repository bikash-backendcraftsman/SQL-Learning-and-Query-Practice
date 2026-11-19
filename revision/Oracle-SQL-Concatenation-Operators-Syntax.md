# Oracle SQL – Concatenation Operator (`||`)

In Oracle SQL, the concatenation operator (`||`) combines two or more strings or values into a single string.

You can combine, for example:

- First name and last name
- Employee name and department
- Employee ID and employee name
- Text and numeric values
- Date values and descriptive text

This guide uses your **EMPLOYEE** table.

---

## 1. Syntax

```sql
SELECT expression1 || expression2
FROM table_name;
```

Multiple values:

```sql
SELECT expression1 || expression2 || expression3
FROM table_name;
```

---

## 2. Using concatenation with `SELECT`

| EMP_ID | EMP_NAME | DEPARTMENT | SALARY |
|--------|----------|------------|--------|
| 101 | Rahul | IT | 60000 |
| 102 | Amit | Finance | 75000 |
| 103 | Priya | HR | 50000 |

### Example 1: Combine employee name and department

```sql
SELECT EMP_NAME || DEPARTMENT
FROM EMPLOYEE;
```

**Output:**

| EMP_NAME \|\| DEPARTMENT |
|--------------------------|
| RahulIT |
| AmitFinance |
| PriyaHR |

### Example 2: Add spaces between values

```sql
SELECT EMP_NAME || ' works in ' || DEPARTMENT
FROM EMPLOYEE;
```

**Output:**

| RESULT |
|--------|
| Rahul works in IT |
| Amit works in Finance |
| Priya works in HR |

`' works in '` is a **string literal**.

### Example 3: Combine employee ID, name, and salary

```sql
SELECT EMP_ID || ' - ' || EMP_NAME
       || ' earns ' || SALARY AS EMPLOYEE_DETAILS
FROM EMPLOYEE;
```

**Output:**

| EMPLOYEE_DETAILS |
|------------------|
| 101 - Rahul earns 60000 |
| 102 - Amit earns 75000 |
| 103 - Priya earns 50000 |

### Example 4: Concatenate with `WHERE`

```sql
SELECT EMP_NAME || ' - ' || DEPARTMENT AS DETAILS
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';
```

You can use concatenation with `WHERE`, `ORDER BY`, and other clauses.

---

## 3. Concatenation with `INSERT`

**Literal values in `VALUES`:**

```sql
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, DEPARTMENT, SALARY)
VALUES (104, 'Bikash' || ' Mohapatra', 'IT', 80000);
```

Oracle concatenates before insert → **Bikash Mohapatra**.

**`INSERT … SELECT`:**

```sql
INSERT INTO EMPLOYEE_BACKUP (EMP_ID, EMP_NAME)
SELECT EMP_ID, EMP_NAME || ' - Employee'
FROM EMPLOYEE;
```

Copies rows into another table while changing the name.

---

## 4. Concatenation with `UPDATE`

**Append text to a name:**

```sql
UPDATE EMPLOYEE
SET EMP_NAME = EMP_NAME || ' - Senior'
WHERE EMP_ID = 101;
```

Before: `Rahul` → After: `Rahul - Senior`

**Build a description from columns:**

```sql
UPDATE EMPLOYEE
SET EMP_DESCRIPTION = EMP_NAME || ' works in ' || DEPARTMENT
WHERE EMP_ID = 101;
```

---

## 5. Where else can we use `||`?

| SQL clause | Can use `\|\|`? | Example |
|------------|-----------------|---------|
| `SELECT` | Yes | `EMP_NAME \|\| DEPARTMENT` |
| `WHERE` | Yes | `WHERE EMP_NAME \|\| DEPARTMENT = 'RahulIT'` |
| `ORDER BY` | Yes | `ORDER BY EMP_NAME \|\| DEPARTMENT` |
| `GROUP BY` | Yes | `GROUP BY DEPARTMENT \|\| EMP_NAME` |
| `HAVING` | Yes | With grouped concatenated expressions |
| `INSERT` | Yes | `'Bikash' \|\| ' Mohapatra'` |
| `UPDATE` | Yes | `EMP_NAME \|\| ' Senior'` |
| `DISTINCT` | Yes | `SELECT DISTINCT EMP_NAME \|\| DEPARTMENT` |

Concatenation is an **expression**—use it wherever a valid SQL expression is allowed.

---

## 6. Important points to remember

1. Oracle uses `||` for string concatenation.
2. You can concatenate two or more values.
3. Use **single quotes** for text literals.
4. Add spaces explicitly when you need them (`' - '`, `' works in '`).
5. Numbers are often **implicitly converted** to strings for `||`.
6. Mix column values and literals freely.
7. In typical Oracle SQL, concatenating with **NULL** treats NULL like an empty string for the result (know your version/settings for edge cases).
8. `SELECT` with `||` does **not** change stored column data.
9. `UPDATE` with `||` **does** change stored values.
10. Use **`TO_CHAR()`** for explicit numeric or date formatting.

---

## Practice in this repo

See [SQL Concatenation Operator](../SQL%20Concatenation%20Operator) for solved Questions 1–3.