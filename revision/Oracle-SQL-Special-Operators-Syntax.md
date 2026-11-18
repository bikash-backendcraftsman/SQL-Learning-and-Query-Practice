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