# Group-wise Transaction

-- Problem: Monthly Transaction Segmentation Analysis 2023
-- Objective: Classify transactions by value and geography for financial reporting
-- Business Impact: Identifies revenue patterns and risk exposure
-- Stakeholders: Finance Team, Risk Management, Treasury
-- Tables Used: Transactions, Users (sender and recipient)
-- Date Range: 2023-01-01 to 2023-12-31
-- Segmentation:
--   Value: High Value (>$10,000), Regular (<=$10,000)
--   Geography: International (cross-border), Domestic
-- Metrics:
--   - Total transaction amount (rounded to 2 decimals)
--   - Average transaction amount (rounded to 2 decimals)
--   - Transaction count
--   - Percentage of monthly total
-- Filters:
--   - Completed transactions only
--   - Positive amounts only (excludes refunds)
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
SELECT 
    EXTRACT(YEAR FROM t.Transaction_date) AS transaction_year,
    EXTRACT(MONTH FROM t.Transaction_date) AS transaction_month,
    CASE 
        WHEN t.Transaction_amount > 10000 THEN 'High Value'
        ELSE 'Regular'
    END AS value_category,
    CASE 
        WHEN sender.Country_ID != recipient.Country_ID THEN 'International'
        ELSE 'Domestic'
    END AS location_category,
    SUM(t.Transaction_amount) AS total_amount,
    AVG(t.Transaction_amount) AS average_amount
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
    transaction_year,
    transaction_month,
    value_category,
    location_category
ORDER BY 
    transaction_year ASC,
    transaction_month ASC,
    value_category ASC,
    location_category ASC;