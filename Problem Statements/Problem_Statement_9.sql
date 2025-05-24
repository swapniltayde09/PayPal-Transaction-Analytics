# Transaction Behavior
-- Problem: High-Value User Identification
-- Objective: Find users with average transaction >$5,000 (Nov 2023 - Apr 2024)
-- Business Impact: Identify premium customers for retention programs
-- Stakeholders: Finance Team, Customer Success
-- Tables Used: Transactions, Users
-- Date Range: 2023-11-01 to 2024-04-30 (6 months)
-- Key Metric: Average transaction amount (rounded to 2 decimals)
-- Threshold: > $5,000 average
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Output Fields:
--   1. user_id
--   2. email
--   3. avg_transaction_amount
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
SELECT 
    t.Sender_ID AS user_id,
    u.Email AS email,
    ROUND(AVG(t.Transaction_amount), 2) AS avg_amount
FROM Transactions t
JOIN Users u ON t.Sender_ID = u.User_ID
WHERE t.Transaction_date >= '2023-11-01' 
  AND t.Transaction_date <= '2024-05-01'
GROUP BY t.Sender_ID, u.Email
HAVING AVG(t.Transaction_amount) > 5000
ORDER BY t.Sender_ID ASC;