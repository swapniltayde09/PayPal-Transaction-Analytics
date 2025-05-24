# Top Performing Merchant

-- Problem: Top-Performing Merchant Identification
-- Objective: Rank merchants by total received amount (Nov 2023 - Apr 2024)
-- Business Impact: Focus sales efforts on strategic accounts
-- Stakeholders: Sales Team, Partner Success
-- Tables Used: Transactions, Merchants
-- Date Range: 2023-11-01 to 2024-04-30 (6 months)
-- Key Metrics:
--   - Total received amount (rounded to 2 decimals)
--   - Average transaction value (rounded to 2 decimals)
--   - Transaction count
-- Filters:
--   - Completed payments only
--   - Positive amounts only
-- Output Fields:
--   1. merchant_id
--   2. business_name
--   3. total_received
--   4. avg_transaction
--   5. transaction_count
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
-- Verify table structures
DESCRIBE Merchants;
DESCRIBE Transactions;

# Solution 1:
SELECT 
    m.merchant_id,
    m.business_name,
    ROUND(SUM(t.transaction_amount), 2) AS total_received,
    ROUND(AVG(t.transaction_amount), 2) AS avg_transaction,
    COUNT(*) AS transaction_count
FROM 
    Transactions t
INNER JOIN 
    Merchants m ON t.recipient_id = m.merchant_id
WHERE 
    t.transaction_date >= '2023-11-01'
    AND t.transaction_date < '2024-05-01'
    AND t.transaction_status = 'completed'
    AND t.transaction_amount > 0
GROUP BY 
    m.merchant_id, 
    m.business_name
ORDER BY 
    total_received DESC
LIMIT 10;
======================================

# Solution 2:

SELECT 
	m.merchant_id, 
	m.business_name, 
	SUM(t.transaction_amount) AS total_received, 
	AVG(t.transaction_amount) AS avg_transaction
FROM Transactions t
JOIN Merchants m ON t.recipient_id = m.merchant_id
WHERE t.transaction_date >= '2023-11-01' AND t.transaction_date < '2024-05-01'
GROUP BY m.merchant_id, m.business_name
ORDER BY total_received DESC
LIMIT 10;
