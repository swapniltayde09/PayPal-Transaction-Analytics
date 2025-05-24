# Monthly Transactions:

-- Problem: Merchant Monthly Performance Dashboard
-- Objective: Track merchant transaction volumes and identify high-performance months
-- Business Impact: Identifies growth opportunities and strategic partners
-- Stakeholders: Sales Team, Partner Success
-- Tables Used: Transactions, Merchants
-- Date Range: 2023-11-01 to 2024-04-30 (6 months)
-- Performance Threshold: $50,000 monthly volume
-- Key Metrics:
--   - Monthly transaction total (rounded to 2 decimals)
--   - Performance status flag
--   - Transaction count
--   - Percentage above/below threshold
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Last Updated: 2024-06-20


Hints:

    Use the Transactions and the Merchants table.
    You might need to first calculate the monthly total transactions for each merchant.
    The resulting table must contain the merchant_id, transaction_year and, transaction_month columns in ascending order.

SQL Query:

SELECT 
    m.Merchant_ID AS merchant_id,
    m.Business_name AS business_name,
    EXTRACT(YEAR FROM t.Transaction_date) AS transaction_year,
    EXTRACT(MONTH FROM t.Transaction_date) AS transaction_month,
    SUM(t.Transaction_amount) AS total_transaction_amount,
    CASE 
        WHEN SUM(t.Transaction_amount) > 50000 THEN 'Exceeded $50,000'
        ELSE 'Did Not Exceed $50,000'
    END AS performance_status
FROM 
    Transactions t
JOIN 
    Merchants m ON t.Recipient_ID = m.Merchant_ID
WHERE 
    t.Transaction_date >= '2023-11-01' 
    AND t.Transaction_date < '2024-05-01'
GROUP BY 
    m.Merchant_ID,
    m.Business_name,
    EXTRACT(YEAR FROM t.Transaction_date),
    EXTRACT(MONTH FROM t.Transaction_date)
ORDER BY 
    merchant_id ASC,
    transaction_year ASC,
    transaction_month ASC;