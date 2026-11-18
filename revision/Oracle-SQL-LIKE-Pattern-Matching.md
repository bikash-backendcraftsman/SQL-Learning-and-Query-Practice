# Oracle SQL – Understanding `LIKE '%a'`

## 1. Understand the pattern: `'%a'`

```sql
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%a';
```

There are two parts:

- `%` → matches zero or more characters
- `a` → the last character must be `a`

Think of it as: **any number of characters, then must end with `a`.**

## 2. How Oracle matches each name

**Pattern:** `%a` — the final character must be `a`.

Example names that **match** (end with `a`): Priya, Neha, Pooja, Sneha, Meera, Kavita, Riya, Nisha, Divya, Shreya, Tanya.

| Name | Does it match `%a`? |
|------|---------------------|
| Priya | Yes |
| Neha | Yes |
| Pooja | Yes |
| Amit | No (ends with `t`) |
| Rahul | No (ends with `l`) |
| Sneha | Yes |

All matching rows end with lowercase `a` as written in the pattern. In production, check whether your database uses case-sensitive or case-insensitive sorting (`NLS_SORT` / `NLS_COMP`).

## 3. Four important LIKE patterns

Assume employee names include Priya, Neha, Amit, and Rahul.

| Pattern | Meaning | Matching example |
|---------|---------|------------------|
| `'A%'` | Starts with A | Amit |
| `'%a'` | Ends with a | Priya, Neha |
| `'%a%'` | Contains a anywhere | Rahul, Priya, Amit |
| `'____'` | Exactly 4 characters | Neha (`_` = one character) |

### Notice the difference

- `'A%'` → **A** must be at the **beginning**
- `'%A'` or `'%a'` → **a** must be at the **end**
- `'%A%'` or `'%a%'` → **a** can be **anywhere**