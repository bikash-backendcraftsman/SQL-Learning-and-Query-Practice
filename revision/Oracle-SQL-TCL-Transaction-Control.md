# Oracle SQL – TCL (Transaction Control Language)

## What is TCL?

**TCL** stands for **Transaction Control Language**.

It manages **transactions** and controls whether changes from **DML** should be **saved permanently** or **undone**.

**Examples:**

- Insert a new employee
- Update an employee's salary
- Delete an employee
- Decide whether to **COMMIT** or **ROLLBACK**

---

## Important TCL commands

| Command | Purpose |
|---------|---------|
| `COMMIT` | Permanently saves changes |
| `ROLLBACK` | Undoes uncommitted changes |
| `SAVEPOINT` | Creates a point to roll back to |
| `ROLLBACK TO SAVEPOINT` | Undoes changes after a specific savepoint |

---

## Understand each command

### A. COMMIT

Permanently saves changes made during the transaction.

```sql
UPDATE EMPLOYEE
SET SALARY = 70000
WHERE EMP_ID = 1;

COMMIT;
```

**What happens?**

- Employee 1's salary becomes 70,000 in the session.
- `COMMIT` makes the change **permanent**.
- A normal `ROLLBACK` **cannot** undo committed work.

### B. ROLLBACK

Reverses changes made **after the last `COMMIT`**.

```sql
UPDATE EMPLOYEE
SET SALARY = 90000
WHERE EMP_ID = 1;

ROLLBACK;
```

**What happens?**

- Salary temporarily becomes 90,000.
- `ROLLBACK` reverses the update.
- Salary returns to the last **committed** value.

### C. SAVEPOINT

Creates a checkpoint **inside** the current transaction.

```sql
UPDATE EMPLOYEE
SET SALARY = 70000
WHERE EMP_ID = 1;

SAVEPOINT SP1;

UPDATE EMPLOYEE
SET SALARY = 80000
WHERE EMP_ID = 2;

SAVEPOINT SP2;

UPDATE EMPLOYEE
SET SALARY = 90000
WHERE EMP_ID = 3;
```

Then:

```sql
ROLLBACK TO SP1;
```

Changes **after** `SP1` are undone; changes **before** `SP1` remain **pending** (not committed until `COMMIT`).

### D. ROLLBACK TO SAVEPOINT

Undo **part** of the transaction without rolling back everything before the savepoint.

```sql
ROLLBACK TO SP2;
```

---

## Important points to remember

1. TCL mainly controls transactions for **DML** (`INSERT`, `UPDATE`, `DELETE`).
2. **`COMMIT`** makes pending changes permanent.
3. **`ROLLBACK`** reverses uncommitted changes.
4. **`SAVEPOINT`** marks a checkpoint in the transaction.
5. **`ROLLBACK TO SAVEPOINT`** does **not** always undo the entire transaction—only work after that savepoint (per Oracle rules).
6. After **`COMMIT`**, you cannot **`ROLLBACK`** those committed changes.
7. Oracle typically **implicitly commits** around successful **DDL** (`CREATE`, `ALTER`, `DROP`). Be careful mixing DDL and DML.
8. **`SELECT`** does not modify stored data.

---

## Practice

See [SQL TCL Commands](../SQL%20TCL%20Commands) for example scripts. Related: [Command categories](Oracle-SQL-Command-Categories.md#4-tcl--transaction-control-language).