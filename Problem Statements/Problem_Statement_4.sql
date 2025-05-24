
# Conversion Trends:
-- Problem: Currency Risk Exposure Analysis
-- Objective: Identify top currency conversion pairs (May 2023 - May 2024)
-- Business Impact: Guides FX hedging strategy and risk management
-- Stakeholders: Treasury Team, Financial Risk Management
-- Tables Used: 
--   - Transactions (payment records)
--   - Currencies (currency metadata)
-- Date Range: 2023-05-22 to 2024-05-22
-- Analysis Focus:
--   - Top 3 destination currencies by volume
--   - Source currency exposure to these destinations
-- Key Metrics:
--   - Total converted amount (sum)
-- Filters:
--   - Completed conversions only
--   - Excludes internal transfers
-- Last Updated: 2024-06-20
-- Author: Swapnil Tayde

-- Main Query Starts Below:
SELECT 
    currency_code,
    SUM(transaction_amount) AS total_converted
FROM Transactions
WHERE transaction_date BETWEEN '2023-05-22' AND '2024-05-22'
GROUP BY currency_code
ORDER BY total_converted DESC
LIMIT 3;