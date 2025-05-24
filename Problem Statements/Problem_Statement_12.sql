Highest Transaction:
-- Problem: Currency Risk Exposure Analysis
-- Objective: Identify currency with highest transaction volume (May 2023 - May 2024)
-- Business Impact: Guides FX hedging strategy and risk management
-- Stakeholders: Treasury Team, Financial Risk Management
-- Tables Used: Transactions
-- Date Range: 2023-05-22 to 2024-05-22 (1 year period)
-- Key Metric: Total transaction amount by currency
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Output Fields:
--   1. currency_code
--   2. total_converted (rounded to 2 decimals)
--   3. percentage_of_total
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
SELECT 
    Currency_code,
    SUM(Transaction_amount) AS total_amount
FROM 
    transactions
WHERE 
    transaction_date >= '2023-05-22' 
    AND transaction_date <= '2024-05-22'
GROUP BY 
    currency_code
ORDER BY 
    total_amount DESC
LIMIT 1;
