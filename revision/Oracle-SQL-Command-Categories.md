# Oracle SQL – Command Categories (DDL, DML, DRL/DQL, TCL, DCL)

In Oracle SQL, commands are classified into **five** major categories:

**DDL**, **DML**, **DRL** (also called **DQL**), **TCL**, and **DCL**.

Short revision notes with syntax and examples below.

---

## 1. DDL – Data Definition Language

**Purpose:** Create or modify database structures (tables, schemas, indexes, and so on).

| Command | Description | Example |
|---------|-------------|---------|
| `CREATE` | Creates a new database object | `CREATE TABLE EMPLOYEE (...);` |
| `ALTER` | Modifies an existing table structure | `ALTER TABLE EMPLOYEE ADD DOB DATE;` |
| `DROP` | Permanently deletes a database object | `DROP TABLE EMPLOYEE;` |
| `TRUNCATE` | Deletes all rows; keeps table structure | `TRUNCATE TABLE EMPLOYEE;` |
| `RENAME` | Renames a database object | `RENAME EMPLOYEE TO EMP;` |

**Remember:**

- `CREATE` → create structure  
- `ALTER` → modify structure  
- `DROP` → delete structure  
- `TRUNCATE` → remove all records  
- `RENAME` → change object name  

---

## 2. DML – Data Manipulation Language

**Purpose:** Insert, modify, and delete table **records**.

| Command | Description | Example |
|---------|-------------|---------|
| `INSERT` | Adds new records | `INSERT INTO EMPLOYEE VALUES (1,'Rahul',60000);` |
| `UPDATE` | Modifies existing records | `UPDATE EMPLOYEE SET SALARY = 70000 WHERE EMP_ID = 1;` |
| `DELETE` | Deletes selected records | `DELETE FROM EMPLOYEE WHERE EMP_ID = 1;` |
| `MERGE` | Insert or update based on condition (upsert) | `MERGE INTO ...` |

**Remember:**

- `INSERT` → add records  
- `UPDATE` → modify records  
- `DELETE` → remove records  
- `MERGE` → insert or update (upsert)  

---

## 3. DRL – Data Retrieval Language (DQL)

**Purpose:** Retrieve data from tables.

| Command | Description | Example |
|---------|-------------|---------|
| `SELECT` | Retrieves records | `SELECT * FROM EMPLOYEE;` |

**Important `SELECT` clauses:**

| Clause | Purpose |
|--------|---------|
| `WHERE` | Filter rows |
| `ORDER BY` | Sort rows |
| `GROUP BY` | Group rows |
| `HAVING` | Filter groups |
| `DISTINCT` | Remove duplicate values |
| `FETCH` | Limit number of rows returned |

**Remember:** `SELECT` is the main retrieval statement. The clauses above are **parts of `SELECT`**, not separate SQL command categories.

---

## 4. TCL – Transaction Control Language

**Purpose:** Control transactions and changes made by DML.

| Command | Description | Example |
|---------|-------------|---------|
| `COMMIT` | Permanently saves changes | `COMMIT;` |
| `ROLLBACK` | Undoes uncommitted changes | `ROLLBACK;` |
| `SAVEPOINT` | Marks a rollback point | `SAVEPOINT SP1;` |
| `ROLLBACK TO` | Roll back to a savepoint | `ROLLBACK TO SP1;` |
| `SET TRANSACTION` | Set transaction properties | `SET TRANSACTION READ ONLY;` |

**Remember:**

- `COMMIT` → save changes  
- `ROLLBACK` → undo changes  
- `SAVEPOINT` → checkpoint  

---

## 5. DCL – Data Control Language

**Purpose:** Control database access and user permissions.

| Command | Description | Example |
|---------|-------------|---------|
| `GRANT` | Gives privileges | `GRANT SELECT ON EMPLOYEE TO USER1;` |
| `REVOKE` | Removes privileges | `REVOKE SELECT ON EMPLOYEE FROM USER1;` |

**Remember:**

- `GRANT` → give permission  
- `REVOKE` → remove permission  

---

## Quick revision – all categories

| Category | Full form | Main commands |
|----------|-----------|---------------|
| **DDL** | Data Definition Language | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME` |
| **DML** | Data Manipulation Language | `INSERT`, `UPDATE`, `DELETE`, `MERGE` |
| **DRL / DQL** | Data Retrieval / Query Language | `SELECT` |
| **TCL** | Transaction Control Language | `COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION` |
| **DCL** | Data Control Language | `GRANT`, `REVOKE` |

---

## Important Oracle interview points

1. **DDL** often performs an **implicit commit** in Oracle.  
2. **DML** needs **`COMMIT`** to make changes permanent (unless autocommit is on).  
3. **`ROLLBACK`** can undo uncommitted DML.  
4. **`TRUNCATE`** cannot be rolled back after it completes successfully.  
5. **`DELETE`** can be rolled back before `COMMIT`.  
6. **`SELECT`** does not modify table data.  
7. **`GRANT`** and **`REVOKE`** manage privileges.  