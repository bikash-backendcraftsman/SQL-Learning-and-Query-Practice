# SQL Special Operator

Practice queries for special operators such as `BETWEEN`, `IN`, `LIKE`, `IS NULL`, `ANY`, `ALL`, `EXISTS`, and related conditions.

---

## Understanding operator groups on the EMPLOYEE table

For each operator group we focus on:

1. **Why** do we need this operator?
2. **Syntax** – how to write it.
3. **Execution logic** – how Oracle evaluates the condition.
4. **Practical examples** – records from employee data.

**Important distinction:** `IS NULL` checks missing values. `ANY` and `ALL` compare values against a set of results. `EXISTS` and `NOT EXISTS` check whether matching rows exist.

---

## 1. IS NULL and IS NOT NULL

### Why do we need them?

Sometimes a column has no value. Example:

| EMP_ID | EMP_NAME | DOB |
|--------|----------|-----|
| 1 | Amit | 12-JAN-1990 |
| 2 | Priya | NULL |
| 3 | Rahul | 15-MAR-1992 |
| 4 | Neha | NULL |

Priya and Neha have no DOB recorded. Oracle represents missing or unknown values using **NULL**.

### Syntax

```sql
-- Find records where a column has no value
SELECT *
FROM EMPLOYEE
WHERE column_name IS NULL;

-- Find records where a column has a value
SELECT *
FROM EMPLOYEE
WHERE column_name IS NOT NULL;
```

### Example 1: Employees whose DOB is missing

```sql
SELECT *
FROM EMPLOYEE
WHERE DOB IS NULL;
```

**Execution logic:** For each row, if `DOB` is NULL → TRUE (included); if `DOB` is a date → FALSE (excluded).

### Example 2: Employees whose DOB is available

```sql
SELECT *
FROM EMPLOYEE
WHERE DOB IS NOT NULL;
```

### Important interview concept

```sql
WHERE DOB = NULL;       -- Incorrect
WHERE DOB <> NULL;      -- Incorrect
WHERE DOB IS NULL;      -- Correct
WHERE DOB IS NOT NULL;  -- Correct
```

**Why?** NULL is unknown; comparisons with `=` / `<>` do not yield TRUE/FALSE in the usual way—use `IS NULL` / `IS NOT NULL`.

---

## 2. ANY and ALL

Useful with **subqueries**.

### Business scenario

Find employees earning more than salaries in the **HR** department:

| HR employee | Salary |
|-------------|--------|
| A | ₹40,000 |
| B | ₹50,000 |
| C | ₹60,000 |

### A. ANY operator

**Meaning:** At least **one** value from the subquery must satisfy the comparison.

**Syntax:**

```sql
SELECT *
FROM table_name
WHERE column_name > ANY (
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

**How Oracle executes:**

1. Inner query returns e.g. `40000`, `50000`, `60000`.
2. For `SALARY > ANY`, salary must be greater than **at least one** of those values.

| Employee salary | Greater than 40K? | ANY result |
|-----------------|-------------------|------------|
| ₹35,000 | No | FALSE |
| ₹45,000 | Yes (vs 40K) | TRUE |
| ₹55,000 | Yes | TRUE |
| ₹65,000 | Yes | TRUE |

**Shortcuts (non-NULL subquery rows):**

- `> ANY` → greater than **MIN** of subquery
- `< ANY` → less than **MAX** of subquery

### B. ALL operator

**Meaning:** **Every** value from the subquery must satisfy the comparison.

**Syntax:**

```sql
SELECT *
FROM table_name
WHERE column_name > ALL (
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

Inner query: `40000`, `50000`, `60000`.

| Employee salary | > 40K | > 50K | > 60K | ALL result |
|-----------------|-------|-------|-------|------------|
| ₹45,000 | Yes | No | No | FALSE |
| ₹55,000 | Yes | Yes | No | FALSE |
| ₹65,000 | Yes | Yes | Yes | TRUE |
| ₹75,000 | Yes | Yes | Yes | TRUE |

**Shortcuts:**

- `> ALL` → greater than **MAX**
- `< ALL` → less than **MIN**

### ANY vs ALL – quick revision

| Operator | Meaning | Equivalent shortcut |
|----------|---------|---------------------|
| `> ANY` | Greater than at least one | Greater than MIN |
| `> ALL` | Greater than every value | Greater than MAX |
| `< ANY` | Less than at least one | Less than MAX |
| `< ALL` | Less than every value | Less than MIN |
| `= ANY` | Equal to at least one | Similar to `IN` |
| `<> ALL` | Not equal to every value | Similar to `NOT IN` (NULL caveats) |

*Shortcuts assume the subquery returns non-NULL values and at least one row.*

---

## 3. EXISTS and NOT EXISTS

Useful for **multiple tables** and **correlated subqueries**.

### Business scenarios

- Employees with at least one colleague in the same department
- Employees with no one in the department earning more
- Departments that have (or lack) employees

### A. EXISTS

**Meaning:** Subquery returns **at least one row** → TRUE; **zero rows** → FALSE.

**Syntax:**

```sql
SELECT *
FROM table_name E
WHERE EXISTS (
    SELECT 1
    FROM another_table X
    WHERE X.column_name = E.column_name
);
```

`E` (outer) and `X` (inner) → **correlated subquery** when the inner query references the outer row.

**Example 1: At least one colleague in the same department**

```sql
SELECT *
FROM EMPLOYEE E
WHERE EXISTS (
    SELECT 1
    FROM EMPLOYEE E2
    WHERE E2.DEPARTMENT = E.DEPARTMENT
      AND E2.EMP_ID <> E.EMP_ID
);
```

For **Priya** (HR, EMP_ID 2): inner query finds other HR employees (Meera, Riya, Nisha, Divya) → EXISTS **TRUE** → Priya is returned.

Oracle can stop after the **first** matching row for EXISTS.

### B. NOT EXISTS

**Meaning:** Subquery returns **zero rows** → TRUE; **at least one row** → FALSE.

**Example 2: Highest-paid employee(s) per department**

```sql
SELECT *
FROM EMPLOYEE E
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE E2
    WHERE E2.DEPARTMENT = E.DEPARTMENT
      AND E2.SALARY > E.SALARY
);
```

**HR example:**

| Employee | Salary | Someone earns more? | NOT EXISTS |
|----------|--------|---------------------|------------|
| Priya | ₹50,000 | Yes | FALSE (excluded) |
| Meera | ₹65,000 | Yes | FALSE |
| Divya | ₹74,000 | No | TRUE (included) |

Same logic per department; ties for top salary both appear.

### EXISTS vs NOT EXISTS

| | EXISTS | NOT EXISTS |
|---|--------|------------|
| Checks | Matching rows **exist** | Matching rows **do not** exist |
| TRUE when | ≥ 1 row | 0 rows |
| Typical use | Find relationships | Find “no higher earner”, missing links |

---

## 4. Which operator to use? (interview)

| Question keywords | Operator |
|-------------------|----------|
| Missing, not assigned, unavailable | `IS NULL` |
| Available, populated, assigned | `IS NOT NULL` |
| At least one, any one, minimum one | `ANY` |
| Every, all, greater than everyone | `ALL` |
| Has matching record, at least one exists | `EXISTS` |
| Does not have, no matching record | `NOT EXISTS` |

---

## 5. Important differences

| Feature | IS NULL | ANY / ALL | EXISTS / NOT EXISTS |
|---------|---------|-----------|---------------------|
| Main purpose | Check missing values | Compare values | Check row existence |
| Subquery required? | No | Yes | Yes |
| Correlated subquery? | No | Optional | Commonly used |
| Works with multiple rows? | One column value | Yes | Yes |
| Typical use | Missing DOB | Salary comparison | Employee relationships |

---

## Solved practice files

See the `.sql` files in this folder (Questions 1–8) for queries pushed alongside this study guide.