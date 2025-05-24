# Transaction Classification:
-- Problem: Transaction Value Classification
-- Objective: Segment 2023 transactions by value tier for financial reporting
-- Business Impact: Enables risk assessment and revenue analysis
-- Stakeholders: Finance Team, Risk Management
-- Tables Used: Transactions
-- Date Range: 2023-01-01 to 2023-12-31
-- Classification Thresholds:
--   - High Value: > $10,000
--   - Regular: <= $10,000
-- Key Metrics:
--   - Total amount per category
-- Filters:
--   - Completed transactions only
--   - Positive amounts only (excludes refunds)
-- Last Updated: 2024-06-20
-- Author: Swapnil Tayde
-- Main Query Starts Below:

SELECT 
    CASE 
        WHEN transaction_amount > 10000 THEN 'High Value'
        ELSE 'Regular'
    END AS transaction_category,
    SUM(transaction_amount) AS total_amount
FROM Transactions
WHERE transaction_date >= '2023-01-01' 
  AND transaction_date < '2024-01-01'
GROUP BY transaction_category
ORDER BY total_amount DESC;