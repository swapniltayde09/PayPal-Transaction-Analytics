# Nature of Transaction:
-- Problem: Transaction Nature Classification
-- Objective: Categorize Q1 2024 transactions as domestic/international
-- Business Impact: Compliance reporting and geographic risk assessment
-- Stakeholders: Finance Team, Legal & Compliance
-- Tables Used: 
--   - Transactions (payment records)
--   - Users (sender/recipient country data)
-- Date Range: 2024-01-01 to 2024-03-31
-- Classification Criteria:
--   - International: Sender and recipient in different countries
--   - Domestic: Sender and recipient in same country
-- Key Metric: Transaction count by type
-- Filters:
--   - Completed transactions only
-- Last Updated: 2024-06-20
-- Author: Swapnil Tayde
-- Main Query Starts Below:

WITH transaction_types AS (
    SELECT 
        t.Transaction_ID,
        CASE 
            WHEN sender.Country_ID != recipient.Country_ID THEN 'International'
            ELSE 'Domestic'
        END AS transaction_type
    FROM Transactions t
    JOIN Users sender ON t.Sender_ID = sender.User_ID
    JOIN Users recipient ON t.Recipient_ID = recipient.User_ID
    WHERE t.Transaction_date >= '2024-01-01' 
      AND t.Transaction_date < '2024-04-01'
)

SELECT 
    transaction_type,
    COUNT(*) AS transaction_count
FROM transaction_types
GROUP BY transaction_type
ORDER BY transaction_count DESC;
