# Oracle SQL Special Operators – Syntax

## Special operators

These operators simplify conditions and help filter data based on particular requirements.

| Operator | Purpose | Example |
|----------|---------|---------|
| `BETWEEN ... AND` | Checks a range (inclusive) | `SALARY BETWEEN 30000 AND 50000` |
| `IN` | Matches values from a list | `DEPARTMENT IN ('IT','HR')` |
| `NOT IN` | Excludes values from a list | `DEPARTMENT NOT IN ('IT','HR')` |
| `LIKE` | Pattern matching | `ENAME LIKE 'A%'` |
| `NOT LIKE` | Excludes a pattern | `ENAME NOT LIKE 'A%'` |
| `IS NULL` | Checks NULL values | `COMM IS NULL` |
| `IS NOT NULL` | Checks non-NULL values | `COMM IS NOT NULL` |
| `EXISTS` | Checks whether a subquery returns rows | `EXISTS (SELECT 1...)` |
| `NOT EXISTS` | Checks whether a subquery returns no rows | `NOT EXISTS (SELECT 1...)` |
| `ANY` | Compares with at least one subquery value | `SALARY > ANY (...)` |
| `ALL` | Compares with every subquery value | `SALARY > ALL (...)` |

## 1. BETWEEN / NOT BETWEEN

Used to check whether a value falls within a specified range. Both boundaries are inclusive.

**Syntax:**

```sql
SELECT column_name
FROM table_name
WHERE column_name BETWEEN lower_value AND upper_value;

-- NOT BETWEEN
WHERE column_name NOT BETWEEN lower_value AND upper_value;
```

**Example:**

```sql
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 30000 AND 70000;
```

---

## 2. IN / NOT IN

Used to match or exclude multiple values.

**Syntax:**

```sql
WHERE column_name IN (value1, value2, value3);

WHERE column_name NOT IN (value1, value2, value3);
```

**Example:**

```sql
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT IN ('IT', 'HR', 'Finance');
```

---

## 3. LIKE / NOT LIKE

Used for pattern matching with wildcards.

**Syntax:**

```sql
WHERE column_name LIKE 'pattern';

WHERE column_name NOT LIKE 'pattern';
```

| Pattern | Meaning |
|---------|---------|
| `'A%'` | Starts with A |
| `'%A'` | Ends with A |
| `'%A%'` | Contains A |
| `'A_'` | Starts with A, followed by exactly one character |
| `'__A%'` | Third character is A |

**Example:**

```sql
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE 'A%';
```

**Deep dive:** [Understanding `LIKE '%a'` and common patterns](Oracle-SQL-LIKE-Pattern-Matching.md)

---

## 4. IS NULL / IS NOT NULL

Used to check missing (NULL) values.

**Syntax:**

```sql
WHERE column_name IS NULL;

WHERE column_name IS NOT NULL;
```

**Example:**

```sql
SELECT *
FROM EMPLOYEE
WHERE DOB IS NOT NULL;
```

Remember: `= NULL` and `<> NULL` are incorrect ways to check NULL.

---

## Understanding and Using NULL in SQL

In Oracle SQL, understanding when to insert NULL and when to avoid NULL is important for database design, data quality, and SQL interviews.

Let's understand it with your **EMPLOYEE** table.

### 1. What is NULL?

NULL means a value is **missing**, **unknown**, or **not applicable**.

It is not the same as:

| Value | Meaning |
|-------|---------|
| `NULL` | Unknown or missing |
| `0` | Actual numeric zero |
| `''` | Empty string (Oracle treats zero-length character strings as NULL) |
| `' '` | A space character |
| `'N/A'` | Actual text value |

**Example:**

| EMP_ID | EMP_NAME | SALARY | BONUS |
|--------|----------|--------|-------|
| 101 | Amit | 50000 | 5000 |
| 102 | Priya | 60000 | NULL |
| 103 | Rahul | 0 | 0 |
| 104 | Neha | 55000 | NULL |

Priya's bonus is unknown or not recorded. Rahul's bonus is explicitly **zero**.

### 2. When should we insert NULL?

| Scenario | Example | Should NULL be allowed? |
|----------|---------|-------------------------|
| Optional information | Employee middle name | Yes |
| Not yet available | DOB awaiting verification | Yes |
| Not applicable | Bonus for ineligible employee | Possibly |
| Future information | Resignation date for active employee | Yes |
| Optional contact | Alternate phone number | Yes |
| Unknown information | Previous company | Yes |

**Example:**

```sql
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, DEPARTMENT, SALARY, DOB)
VALUES (101, 'Amit', 'IT', 50000, NULL);
```

DOB is not available yet; NULL is reasonable if business rules permit it.

### 3. When should we avoid NULL?

| Column | Why avoid NULL? |
|--------|-----------------|
| `EMP_ID` | Every employee needs identification |
| `EMP_NAME` | Employee identity is essential |
| `DEPARTMENT` | Required if organizational assignment is mandatory |
| `SALARY` | Required for payroll when salary is established |
| `HIREDATE` | Required for employment records |

Enforce mandatory columns with **NOT NULL**:

```sql
CREATE TABLE EMPLOYEE_DETAILS (
    EMP_ID   NUMBER NOT NULL,
    EMP_NAME VARCHAR2(100) NOT NULL,
    DEPARTMENT VARCHAR2(50),
    SALARY   NUMBER(10,2)
);
```

Oracle rejects `INSERT` without values for `EMP_ID` or `EMP_NAME`.

### 4. How to insert NULL in Oracle SQL?

**Method 1 — Explicit NULL**

```sql
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, DEPARTMENT, SALARY, DOB)
VALUES (105, 'Rahul', 'IT', 60000, NULL);
```

**Method 2 — Omit optional column**

```sql
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, DEPARTMENT, SALARY)
VALUES (106, 'Neha', 'Finance', 55000);
```

If `DOB` has no default and allows NULL, Oracle stores NULL in `DOB`.

**Method 3 — UPDATE to NULL**

```sql
UPDATE EMPLOYEE
SET DOB = NULL
WHERE EMP_ID = 105;
```

### 5. How to prevent NULL insertion?

```sql
ALTER TABLE EMPLOYEE
MODIFY EMP_NAME NOT NULL;
```

**DEFAULT + NOT NULL:**

```sql
ALTER TABLE EMPLOYEE
ADD STATUS VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL;
```

- **DEFAULT** — value when the column is omitted.
- **NOT NULL** — column cannot store NULL.

An explicit `NULL` in `INSERT` can override `DEFAULT` unless **NOT NULL** blocks it.

### 6. Important interview points

1. NULL = missing, unknown, or inapplicable — not zero.
2. NULL ≠ empty string; Oracle treats `''` as NULL for character types.
3. Use `IS NULL` / `IS NOT NULL` (not `= NULL`).
4. Arithmetic with NULL generally yields NULL.
5. **NVL()** — replace NULL with another value.
6. **COALESCE()** — first non-NULL expression.
7. **NOT NULL** constraint for mandatory columns.
8. Avoid fake placeholders (`0`, `'N/A'`, `'UNKNOWN'`) just to avoid NULL.

**Example:**

```sql
SELECT EMP_NAME,
       SALARY,
       NVL(SALARY, 0) AS DISPLAY_SALARY
FROM EMPLOYEE;
```

---

## 5. EXISTS / NOT EXISTS

Used to check whether a subquery returns at least one row.

**Syntax:**

```sql
WHERE EXISTS (
    SELECT 1
    FROM another_table
    WHERE condition
);

WHERE NOT EXISTS (
    SELECT 1
    FROM another_table
    WHERE condition
);
```

**Example:**

```sql
SELECT *
FROM EMPLOYEE E
WHERE EXISTS (
    SELECT 1
    FROM DEPARTMENT D
    WHERE D.DEPARTMENT = E.DEPARTMENT
);
```

---

## 6. ANY / SOME

Used to compare a value against at least one value returned by a subquery.

**Syntax:**

```sql
WHERE column_name operator ANY (
    SELECT column_name
    FROM table_name
    WHERE condition
);
```

**Example:**

```sql
SELECT *
FROM EMPLOYEE
WHERE SALARY > ANY (
    SELECT SALARY
    FROM EMPLOYEE
    WHERE DEPARTMENT = 'HR'
);
```

Meaning: salary must be greater than **at least one** HR employee's salary.

`SOME` is a synonym for `ANY`.

---

## 7. ALL

Used to compare a value against every value returned by a subquery.

**Syntax:**

```sql
WHERE column_name operator ALL (
    SELECT column_name
    FROM table_name
    WHERE condition
);
```

**Example:**

```sql
SELECT *
FROM EMPLOYEE
WHERE SALARY > ALL (
    SELECT SALARY
    FROM EMPLOYEE
    WHERE DEPARTMENT = 'HR'
);
```

Meaning: salary must be greater than **every** HR employee's salary.

---

## Quick revision table

| Operator | Purpose | Example |
|----------|---------|---------|
| `BETWEEN` | Within range | `SALARY BETWEEN 30K AND 70K` |
| `NOT BETWEEN` | Outside range | `SALARY NOT BETWEEN 30K AND 70K` |
| `IN` | Match list | `DEPARTMENT IN ('IT','HR')` |
| `NOT IN` | Exclude list | `DEPARTMENT NOT IN ('IT','HR')` |
| `LIKE` | Pattern matching | `EMP_NAME LIKE 'A%'` |
| `NOT LIKE` | Exclude pattern | `EMP_NAME NOT LIKE 'A%'` |
| `IS NULL` | Check NULL | `DOB IS NULL` |
| `IS NOT NULL` | Check non-NULL | `DOB IS NOT NULL` |
| `EXISTS` | Subquery returns rows | `EXISTS (SELECT 1...)` |
| `NOT EXISTS` | Subquery returns no rows | `NOT EXISTS (SELECT 1...)` |
| `ANY` / `SOME` | At least one match | `SALARY > ANY (...)` |
| `ALL` | Every value must satisfy | `SALARY > ALL (...)` |

---

## Important interview points

1. `BETWEEN` includes both lower and upper boundaries.
2. `IN` is equivalent to multiple `OR` conditions.
3. `NOT IN` can produce unexpected results if the list or subquery contains NULL.
4. `%` means zero or more characters; `_` means exactly one character.
5. `EXISTS` checks whether rows exist; it does not compare selected values.
6. `ANY` means at least one; `ALL` means every value.
7. `ANY` and `ALL` can work with `>`, `<`, `=`, `<>`, `>=`, and `<=`.

---

## Study recommendation

Master **BETWEEN**, **IN**, **LIKE**, and **IS NULL** first. Then practice **EXISTS**, **ANY**, and **ALL** with subqueries. These are especially useful for intermediate and advanced SQL interviews.