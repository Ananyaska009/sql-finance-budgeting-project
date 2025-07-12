CREATE DATABASE Personal_Finance_and_Budgeting_System;
USE Personal_Finance_and_Budgeting_System;
-- 1. Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR (50),
    monthly_income DECIMAL(10,2) 
);
-- 2. Accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    user_id INT,
    account_type VARCHAR(20),  -- 'Bank', 'Wallet', 'Credit Card'
    balance DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
-- 3. Transactions table
CREATE TABLE transactions (
    txn_id INT PRIMARY KEY,
    account_id INT,
    txn_type VARCHAR(10),      -- 'Income' or 'Expense'
    category VARCHAR(30),      -- e.g., 'Rent', 'Food', 'Salary'
    amount DECIMAL(10,2),
    txn_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
-- 4. Budget limits table
CREATE TABLE budget_limits (
    user_id INT,
    category VARCHAR(30),
    monthly_limit DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
-- Insert user
INSERT INTO users VALUES (1, 'Ananya', 50000.00);

-- Insert accounts
INSERT INTO accounts VALUES
(101, 1, 'Bank', 20000.00),
(102, 1, 'Wallet', 3000.00);

-- Insert transactions
INSERT INTO transactions VALUES
(1, 101, 'Income', 'Salary', 50000.00, '2025-06-01'),
(2, 101, 'Expense', 'Rent', 15000.00, '2025-06-03'),
(3, 101, 'Expense', 'Groceries', 3000.00, '2025-06-06'),
(4, 101, 'Expense', 'Travel', 5000.00, '2025-06-15'),
(5, 102, 'Expense', 'Dining', 1200.00, '2025-06-18'),
(6, 101, 'Expense', 'Savings', 10000.00, '2025-06-25'),
(7, 101, 'Income', 'Freelance', 8000.00, '2025-06-20'),
(8, 101, 'Expense', 'Shopping', 2500.00, '2025-06-27'),
(9, 101, 'Income', 'Salary', 50000.00, '2025-07-01'),
(10, 101, 'Expense', 'Rent', 15000.00, '2025-07-03'),
(11, 101, 'Expense', 'Groceries', 3200.00, '2025-07-08'),
(12, 101, 'Expense', 'Dining', 1800.00, '2025-07-11'),
(13, 101, 'Expense', 'Travel', 4000.00, '2025-07-18');

-- Insert budget limits 
INSERT INTO budget_limits VALUES
(1, 'Dining', 1500.00),
(1, 'Shopping', 3000.00),
(1, 'Groceries', 3500.00);

-- This query shows how much was spent in each expense category
SELECT 
  category,
  SUM(amount) AS total_spent
FROM transactions
WHERE txn_type = 'Expense'  -- Only include expenses, not income
GROUP BY category;          -- Group the expenses by category name

-- This query shows months where spending exceeded ₹30,000
SELECT 
  MONTH(txn_date) AS month,
  SUM(amount) AS total_spent
FROM transactions
WHERE txn_type = 'Expense'  -- Focus only on expenses
GROUP BY MONTH(txn_date)    -- Group by each month
HAVING SUM(amount) > 30000; -- Show only those months with high total expense

-- This query displays the top 3 categories where you spent the most
SELECT 
  category,
  SUM(amount) AS total_spent
FROM transactions
WHERE txn_type = 'Expense'
GROUP BY category
ORDER BY total_spent DESC   -- Sort from highest to lowest spending
LIMIT 3;                    -- Show only the top 3 categories

--
SELECT DISTINCT category FROM transactions WHERE txn_type = 'Expense';

-- This query shows remaining balance in each of your accounts
SELECT 
  account_type,
  balance
FROM accounts
WHERE user_id = 1;  -- Replace with your actual user_id if needed

-- This query checks if any category's spending exceeded the user’s budget limit
SELECT 
  t.category,
  SUM(t.amount) AS total_spent,
  b.monthly_limit
FROM transactions t
JOIN budget_limits b 
  ON t.category = b.category
WHERE t.txn_type = 'Expense'       -- Only include expenses
GROUP BY t.category, b.monthly_limit
HAVING SUM(t.amount) > b.monthly_limit;  -- Show where limit was exceeded

-- This query shows total income received each month
SELECT 
  MONTH(txn_date) AS month,
  SUM(amount) AS total_income
FROM transactions
WHERE txn_type = 'Income'
GROUP BY MONTH(txn_date);

-- This query shows total expenses for each month
SELECT 
  MONTH(txn_date) AS month,
  SUM(amount) AS total_expense
FROM transactions
WHERE txn_type = 'Expense'
GROUP BY MONTH(txn_date);

-- This query lists all transactions with details sorted by date
SELECT 
  txn_type,
  category,
  amount,
  txn_date
FROM transactions
ORDER BY txn_date;  -- Sorts transactions from oldest to newest
