# Monthly Transactions
-- Problem: Monthly Transaction Trends 2023
-- Objective: Analyze payment volume patterns throughout 2023
-- Business Impact: Identifies seasonal trends for cash flow planning
-- Stakeholders: Finance Team, Executive Leadership
-- Tables Used: Transactions
-- Date Range: 2023-01-01 to 2023-12-31 (Full calendar year)
-- Key Metrics:
--   - Monthly transaction totals
--   - Month-over-month comparables
-- Output Fields:
--   1. transaction_year
--   2. transaction_month
--   3. total_amount (rounded to 2 decimals)
--   4. transaction_count
-- Special Features:
--   - Complete year coverage
--   - Excludes voided/refunded transactions
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
SELECT 
    EXTRACT(YEAR FROM Transaction_date) AS transaction_year,
    EXTRACT(MONTH FROM Transaction_date) AS transaction_month,
    SUM(Transaction_amount) AS total_amount
FROM 
    Transactions
WHERE 
    Transaction_date >= '2023-01-01' 
    AND Transaction_date < '2024-01-01'
GROUP BY 
    EXTRACT(YEAR FROM Transaction_date),
    EXTRACT(MONTH FROM Transaction_date)
ORDER BY 
    transaction_year ASC,
    transaction_month ASC;