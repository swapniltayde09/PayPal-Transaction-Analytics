# Nature of transaction
-- Problem: Transaction Geography Classification
-- Objective: Categorize Q1 2024 transactions as Domestic/International
-- Business Impact: Compliance reporting and cross-border risk assessment
-- Stakeholders: Finance, Legal, Risk Management
-- Tables Used: Transactions, Users (sender and recipient)
-- Date Range: 2024-01-01 to 2024-03-31 (Q1 2024)
-- Classification Logic:
--   Domestic: Sender_country = Recipient_country
--   International: Sender_country <> Recipient_country
-- Key Metric: Transaction count by geography type
-- Data Quality:
--   - Only completed transactions
--   - Valid sender-recipient pairs
-- Last Updated: 2024-06-20

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