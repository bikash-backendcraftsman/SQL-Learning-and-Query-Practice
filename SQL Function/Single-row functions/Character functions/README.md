# Character functions

**Category A – Character / string functions**

Used when working with employee names, addresses, emails, phone numbers, and text.

| Function | Purpose | Example |
|----------|---------|---------|
| `UPPER()` | Convert to uppercase | `UPPER('bikash')` |
| `LOWER()` | Convert to lowercase | `LOWER('BIKASH')` |
| `INITCAP()` | Capitalize each word | `INITCAP('bikash mohapatra')` |
| `LENGTH()` | Count characters | `LENGTH('ORACLE')` |
| `SUBSTR()` | Extract characters | `SUBSTR('ORACLE',1,3)` |
| `INSTR()` | Find character position | `INSTR('ORACLE','A')` |
| `CONCAT()` | Join two strings | `CONCAT('SQL','ORACLE')` |
| `TRIM()` | Remove leading/trailing spaces or characters | `TRIM(' SQL ')` |
| `LTRIM()` | Remove leading characters | `LTRIM('000123','0')` |
| `RTRIM()` | Remove trailing characters | `RTRIM('SQLXXX','X')` |
| `REPLACE()` | Replace text | `REPLACE('ORACLE','A','X')` |
| `LPAD()` | Pad on left | `LPAD('123',5,'0')` |
| `RPAD()` | Pad on right | `RPAD('SQL',6,'*')` |