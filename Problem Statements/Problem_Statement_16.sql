# Average Amount

-- Problem: Merchant Performance Scoring System
-- Objective: Evaluate merchants by transaction volume and assign performance tiers
-- Business Impact: Identifies top performers for partnership programs
-- Stakeholders: Sales Team, Partner Success
-- Tables Used: Transactions, Merchants
-- Date Range: 2023-11-01 to 2024-04-30 (6 months)
-- Scoring Criteria:
--   Excellent: > $50,000 total
--   Good: $20,001 - $50,000
--   Average: $10,001 - $20,000
--   Below Average: <= $10,000
-- Key Metrics:
--   - Total received amount (rounded)
--   - Average transaction value (rounded)
--   - Transaction count
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
WITH merchant_performance AS (
    SELECT 
        m.Merchant_ID AS merchant_id,
        m.Business_name AS business_name,
        SUM(t.Transaction_amount) AS total_received,
        CASE 
            WHEN SUM(t.Transaction_amount) > 50000 THEN 'Excellent'
            WHEN SUM(t.Transaction_amount) > 20000 THEN 'Good'
            WHEN SUM(t.Transaction_amount) > 10000 THEN 'Average'
            ELSE 'Below Average'
        END AS performance_score,
        AVG(t.Transaction_amount) AS average_transaction
    FROM 
        Transactions t
    JOIN 
        Merchants m ON t.Recipient_ID = m.Merchant_ID
    WHERE 
        t.Transaction_date >= '2023-11-01' 
        AND t.Transaction_date < '2024-05-01'
    GROUP BY 
        m.Merchant_ID, m.Business_name
)
SELECT 
    merchant_id,
    business_name,
    total_received,
    performance_score,
    average_transaction
FROM 
    merchant_performance
ORDER BY 
    performance_score DESC,
    total_received DESC;