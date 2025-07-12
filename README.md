# Personal Finance & Budgeting System – SQL Project

## Project Overview
This project is a SQL-based Personal Finance & Budgeting System designed to help users manage their financial data effectively. It simulates a real-world scenario where a user can track income, expenses, account balances, and monthly budgets.

The database structure is normalized and supports key financial operations, including transaction logging, category tracking, and budget control.

---

## Database Schema
The system is built using the following relational tables:

- `users`: Stores basic user information.
- `accounts`: Tracks multiple user accounts (e.g., bank, wallet).
- `transactions`: Logs income and expenses with category, amount, and date.
- `budget_limits`: Stores predefined monthly limits for each spending category.

---

## Key Features & Queries
- **Monthly income summary**
- **Monthly expense summary**
- **Category-wise spending totals**
- **Top 3 highest spending categories**
- **Overspending detection by category**
- **Account balance tracking**
- **Chronological transaction history**

Each query uses standard SQL techniques like `GROUP BY`, `JOIN`, `ORDER BY`, `HAVING`, and `LIMIT`.

---

## Technologies Used
- **MySQL** (Workbench or CLI)
- SQL (DDL & DML)
- Structured query development for analysis

---

## Sample Use Cases
- Identify high spending months and categories
- Check if spending exceeds the set budget
- Monitor monthly savings and cash flow
- Track balances across different account types

---

## Files Included
- `project.sql` – Schema, insert statements, and queries
- `README.md` – Project documentation

---

## How to Use
1. Import `project.sql` into your MySQL environment.
2. Review the schema and sample data.
3. Run the analysis queries to gain insights.
