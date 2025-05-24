# Transaction Behavior:
-- Problem: High-Value User Identification
-- Objective: Find users with average transaction >$5k (Nov 2023 - Apr 2024)
-- Business Impact: Targets premium customer retention strategies
-- Stakeholders: Finance Team, Customer Success
-- Tables Used: 
--   - Transactions (payment records)
--   - Users (customer profiles)
-- Date Range: 2023-11-01 to 2024-04-30
-- Key Metric: 
--   - Average transaction amount per user (rounded to 2 decimals)
-- Threshold: > $5,000 average transaction
-- Output Fields:
--   1. user_id
--   2. email
--   3. avg_transaction_amount
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Last Updated: 2024-06-20
-- Author: Swapnil Tayde

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