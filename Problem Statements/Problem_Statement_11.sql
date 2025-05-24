# Loyal customers
-- Problem: Top Customer Identification
-- Objective: Find highest-spending user (May 2023 - May 2024)
-- Business Impact: Select VIP for loyalty program enrollment
-- Stakeholders: Customer Success, Marketing
-- Tables Used: 
--   - Transactions (payment records)
--   - Users (customer profiles)
-- Date Range: 2023-05-22 to 2024-05-22 (1 year period)
-- Key Metric: Total transaction amount (rounded to 2 decimals)
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Output Fields:
--   1. user_id
--   2. name
--   3. email
--   4. total_amount
-- Special Considerations:
--   - Exact 365-day period
--   - Includes all transaction types
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
SELECT 
    u.User_ID AS user_id,
    u.Email AS email,
    u.Name AS name,
    ROUND(SUM(t.Transaction_amount), 2) AS total_amount
FROM 
    Transactions t
JOIN 
    Users u ON t.Sender_ID = u.User_ID
WHERE 
    t.Transaction_date >= '2023-05-22' 
    AND t.Transaction_date < '2024-05-23'
GROUP BY 
    u.User_ID, u.Email, u.Name
ORDER BY 
    total_amount DESC
LIMIT 1;
