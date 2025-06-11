# SQL Command Reference Guide (Comprehensive)

## 1. DDL - Data Definition Language
DDL commands define or alter the structure of database objects.

### CREATE
Creates a new database object.
```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    hire_date DATE
);
-- Creates a table with ID, name, salary, and hire_date columns
```

### ALTER
Modifies an existing database object.
```sql
ALTER TABLE employees ADD COLUMN department VARCHAR(50);
-- Adds a 'department' column to the employees table
```

### DROP
Deletes a database object.
```sql
DROP TABLE employees;
-- Deletes the table and its data
```

### TRUNCATE
Quickly removes all rows from a table without logging individual deletions.
```sql
TRUNCATE TABLE employees;
-- Clears all rows but keeps the table structure
```

## 2. DML - Data Manipulation Language
Manipulates data within tables.

### INSERT
Adds new records.
```sql
INSERT INTO employees (id, name, salary, hire_date)
VALUES (1, 'Alice', 60000.00, NOW());
-- Inserts a new employee with the current date as hire_date
```

### UPDATE
Modifies existing records.
```sql
UPDATE employees
SET salary = 70000.00
WHERE name = 'Alice';
-- Updates salary for Alice
```

### DELETE
Removes records.
```sql
DELETE FROM employees
WHERE salary < 40000;
-- Deletes employees earning less than 40,000
```

## 3. DRL - Data Retrieval Language
Used to retrieve data from the database.

### SELECT
Fetches data from tables.
```sql
SELECT name, salary FROM employees;
-- Retrieves name and salary from all employees
```

### SELECT with WHERE
Filters results.
```sql
SELECT * FROM employees
WHERE department = 'Sales' AND salary > 50000;
-- Employees in Sales earning more than 50,000
```

### SELECT with ORDER BY
Sorts results.
```sql
SELECT * FROM employees
ORDER BY salary DESC;
-- Lists employees sorted by salary from highest to lowest
```

### SELECT with GROUP BY and HAVING
Aggregates and filters grouped data.
```sql
SELECT department, AVG(salary) as avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
-- Departments with average salary above 60,000
```

### SQL Functions
```sql
SELECT NOW(); -- Returns the current date and time
SELECT UPPER(name) FROM employees; -- Converts names to uppercase
SELECT COUNT(*) FROM employees; -- Returns number of rows
SELECT MAX(salary) FROM employees; -- Highest salary
```

## 4. TCL - Transaction Control Language
Manages transactions.

### COMMIT
Saves changes.
```sql
COMMIT;
```

### ROLLBACK
Undoes changes since the last commit.
```sql
ROLLBACK;
```

### SAVEPOINT
Marks a point to rollback to.
```sql
SAVEPOINT before_update;
```

### ROLLBACK TO SAVEPOINT
```sql
ROLLBACK TO before_update;
```

## 5. DCL - Data Control Language
Controls access to data.

### GRANT
Gives privileges.
```sql
GRANT SELECT, INSERT ON employees TO user1;
```

### REVOKE
Removes privileges.
```sql
REVOKE INSERT ON employees FROM user1;
```

## 6. Common SQL Data Types

| Type         | Description                              |
|--------------|------------------------------------------|
| INT          | Integer numbers                          |
| DECIMAL(p,s) | Fixed-point number with precision & scale|
| VARCHAR(n)   | Variable-length string up to n chars     |
| CHAR(n)      | Fixed-length string                      |
| TEXT         | Large text data                          |
| DATE         | Stores date (YYYY-MM-DD)                 |
| TIME         | Stores time (HH:MM:SS)                   |
| DATETIME     | Date and time                            |
| BOOLEAN      | True/False values                        |
| SERIAL       | Auto-incrementing integer (PostgreSQL)   |

## 7. Additional Clauses and Features

### LIMIT / OFFSET
```sql
SELECT * FROM employees LIMIT 5 OFFSET 10;
-- Skips first 10 rows, returns next 5
```

### BETWEEN / IN / LIKE
```sql
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 70000;

SELECT * FROM employees
WHERE department IN ('HR', 'Sales');

SELECT * FROM employees
WHERE name LIKE 'A%'; -- Names starting with 'A'
```

### DISTINCT
```sql
SELECT DISTINCT department FROM employees;
-- Unique department names
```

### IS NULL / IS NOT NULL
```sql
SELECT * FROM employees WHERE hire_date IS NULL;
```

## SQL User Creation & Privilege Reference

This table summarizes how to create users with different levels of privileges in SQL (standard MySQL/MariaDB syntax, similar in PostgreSQL and others).

| Purpose                         | SQL Command |
|----------------------------------|-------------|
| Create user with **no privileges** | ```CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password';``` |
| Grant **ALL privileges on all databases** | ```GRANT ALL PRIVILEGES ON *.* TO 'user1'@'localhost';``` |
| Grant **ALL privileges on one database** | ```GRANT ALL PRIVILEGES ON database_name.* TO 'user1'@'localhost';``` |
| Grant **ALL privileges on one table** | ```GRANT ALL PRIVILEGES ON database_name.table_name TO 'user1'@'localhost';``` |
| Grant **specific privileges on a table** | ```GRANT SELECT, INSERT ON database_name.table_name TO 'user1'@'localhost';``` |
| Grant with **GRANT OPTION** (allows the user to grant their privileges to others) | ```GRANT SELECT, INSERT ON database_name.table_name TO 'user1'@'localhost' WITH GRANT OPTION;``` |
| Revoke all privileges | ```REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user1'@'localhost';``` |
| Drop user | ```DROP USER 'user1'@'localhost';``` |

### Notes:
- `'user1'@'localhost'` means the user can connect only from the local machine.
- Use `'%'` instead of `'localhost'` to allow connections from any host.
- You must `FLUSH PRIVILEGES;` in some systems to apply changes (especially older MySQL versions).
- `GRANT OPTION` should be used cautiously, as it allows the user to pass privileges to others.

### Examples:

### 1. User with **NO privileges**
```sql
CREATE USER 'no_priv_user'@'localhost' IDENTIFIED BY 'secure_pw';
-- User created, but no access granted
```

### 2. User with **ALL privileges on all databases**
```sql
CREATE USER 'global_admin'@'localhost' IDENTIFIED BY 'admin_pw';
GRANT ALL PRIVILEGES ON *.* TO 'global_admin'@'localhost';
```

### 3. User with **ALL privileges on a specific database**
```sql
CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'db_pw';
GRANT ALL PRIVILEGES ON company_db.* TO 'db_admin'@'localhost';
```

### 4. User with **ALL privileges on a specific table**
```sql
CREATE USER 'table_admin'@'localhost' IDENTIFIED BY 'table_pw';
GRANT ALL PRIVILEGES ON company_db.employees TO 'table_admin'@'localhost';
```

### 5. User with **SELECT only on a database** (read-only)
```sql
CREATE USER 'readonly_db'@'localhost' IDENTIFIED BY 'read_pw';
GRANT SELECT ON company_db.* TO 'readonly_db'@'localhost';
```

### 6. User with **SELECT only on a table**
```sql
CREATE USER 'readonly_table'@'localhost' IDENTIFIED BY 'read_pw';
GRANT SELECT ON company_db.employees TO 'readonly_table'@'localhost';
```

### 7. User with **SELECT, INSERT on a table**
```sql
CREATE USER 'select_insert_user'@'localhost' IDENTIFIED BY 'mix_pw';
GRANT SELECT, INSERT ON company_db.employees TO 'select_insert_user'@'localhost';
```

### 8. User with **SELECT, INSERT and WITH GRANT OPTION**
```sql
CREATE USER 'grant_user'@'localhost' IDENTIFIED BY 'grant_pw';
GRANT SELECT, INSERT ON company_db.employees TO 'grant_user'@'localhost' WITH GRANT OPTION;
```

### 9. User with **ALL privileges and WITH GRANT OPTION**
```sql
CREATE USER 'super_admin'@'localhost' IDENTIFIED BY 'super_pw';
GRANT ALL PRIVILEGES ON *.* TO 'super_admin'@'localhost' WITH GRANT OPTION;
```

### 10. User connecting from any host
```sql
CREATE USER 'remote_user'@'%' IDENTIFIED BY 'remotepw';
GRANT SELECT ON company_db.* TO 'remote_user'@'%';
-- Allows access from any host
```

### 11. Revoke all privileges
```sql
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'any_user'@'localhost';
-- Removes all permissions and ability to grant
```

### 12. Drop user
```sql
DROP USER 'obsolete_user'@'localhost';
-- Deletes user from the database system
```