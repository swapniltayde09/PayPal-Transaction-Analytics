# High- value Transactions:
-- Problem: High-Value Transaction Monitoring
-- Objective: Identify transactions >$10K in 2023 for risk assessment
-- Business Impact: Reduces financial exposure and prevents fraud
-- Stakeholders: Risk Management Team, Financial Compliance
-- Tables Used: Transactions (primary), Users (for sender info)
-- Date Range: 2023-01-01 to 2023-12-31
-- Threshold: > $10,000 USD equivalent
-- Output Requirements:
--   1. Transaction ID
--   2. Sender ID
--   3. Recipient ID (when available)
--   4. Transaction amount
--   5. Currency code
-- Special Considerations:
--   - Include cross-currency transactions
--   - Exclude refunds/chargebacks
-- Last Updated: 2024-06-20
-- Author: Swapnil Tayde

-- Main Query Starts Below:
SELECT 
    t.Transaction_ID AS transaction_id,
    t.Sender_ID AS sender_id,
    t.Recipient_ID AS recipient_id,
    t.Transaction_amount AS transaction_amount,
    t.Currency_code AS currency_code
FROM 
    Transactions t
WHERE 
    t.Transaction_amount > 10000
    AND t.Transaction_date >= '2023-01-01' 
    AND t.Transaction_date <= '2023-12-31'
ORDER BY 
    t.Transaction_amount DESC;