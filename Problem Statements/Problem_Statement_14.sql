# Count of Transaction:

-- Problem: Transaction Value & Geography Segmentation
-- Objective: Classify 2023 transactions by value and geography
-- Business Impact: Risk assessment and revenue segmentation
-- Stakeholders: Finance Team, Risk Management
-- Tables Used: Transactions, Users (sender and recipient)
-- Date Range: 2023-01-01 to 2023-12-31
-- Classification Criteria:
--   High Value: > $10,000
--   Regular: <= $10,000
--   International: Cross-border
--   Domestic: Same country
-- Key Metric: Transaction count by category
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Last Updated: 2024-06-20

SELECT 
    CASE 
        WHEN t.Transaction_amount > 10000 AND sender.Country_ID != recipient.Country_ID THEN 'High Value International'
        WHEN t.Transaction_amount > 10000 AND sender.Country_ID = recipient.Country_ID THEN 'High Value Domestic'
        WHEN t.Transaction_amount <= 10000 AND sender.Country_ID != recipient.Country_ID THEN 'Regular International'
        ELSE 'Regular Domestic'
    END AS transaction_category,
    COUNT(*) AS transaction_count
FROM 
    Transactions t
JOIN 
    Users sender ON t.Sender_ID = sender.User_ID
JOIN 
    Users recipient ON t.Recipient_ID = recipient.User_ID
WHERE 
    t.Transaction_date >= '2023-01-01' 
    AND t.Transaction_date < '2024-01-01'
GROUP BY 
    transaction_category
ORDER BY 
    transaction_count DESC;
