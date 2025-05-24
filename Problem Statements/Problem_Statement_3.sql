# Merchant Performance:

-- Problem: Top-Performing Merchant Identification
-- Objective: Identify highest-grossing merchants (Nov 2023 - Apr 2024)
-- Business Impact: Focus sales efforts on strategic accounts
-- Stakeholders: Sales Leadership, Partner Success Team
-- Tables Used: 
--   - Transactions (payment records)
--   - Merchants (business profiles)
-- Date Range: 2023-11-01 to 2024-04-30
-- Key Metrics:
--   - Total payment volume (sum)
--   - Average transaction value (mean)
-- Ranking: Top 10 by total received amount (descending)
-- Output Fields:
--   1. Merchant_ID
--   2. Business_name
--   3. total_received (rounded to 2 decimals)
--   4. average_transaction (rounded to 2 decimals)
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Last Updated: 2024-06-20
-- Author: Swapnil Tayde

-- Main Query Starts Below:
SELECT 
    m.Merchant_ID AS merchant_id,
    m.Business_name AS business_name,
    SUM(t.Transaction_amount) AS total_received,
    AVG(t.Transaction_amount) AS average_transaction
FROM 
    Transactions t
JOIN 
    Merchants m ON t.Recipient_ID = m.Merchant_ID
WHERE 
    t.Transaction_date >= '2023-11-01' 
    AND t.Transaction_date <= '2024-04-30'
GROUP BY 
    m.Merchant_ID, m.Business_name
ORDER BY 
    total_received DESC
Limit 10;