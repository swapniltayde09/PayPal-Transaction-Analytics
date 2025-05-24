# Transaction Amount:
-- Problem: Key Market Analysis (Top Countries by Transaction Volume)
-- Objective: Identify top 5 countries by sent/received amounts in Q4 2023
-- Business Impact: Guides market expansion and resource allocation
-- Stakeholders: Finance Team, Global Growth Strategy
-- Tables Used: Transactions, Users, Merchants, Countries
-- Date Range: 2023-10-01 to 2023-12-31
-- Output Requirements: 
--   1. Top 5 sending countries (country_name, total_sent)
--   2. Top 5 receiving countries (country_name, total_received)
--   3. All amounts rounded to 2 decimal places
-- Last Updated: 2024-06-20
-- Author: Swapnil Tayde

-- Main Query Starts Below:
# Top 5 Countries by Total Sent Amount
SELECT 
    c.Country_Name AS country_name,
    ROUND(SUM(t.Transaction_amount), 2) AS total_sent
FROM 
    Transactions t
JOIN 
    Users u ON t.Sender_ID = u.User_ID
JOIN 
    Countries c ON u.Country_ID = c.Country_ID
WHERE 
    t.Transaction_date >= '2023-10-01' 
    AND t.Transaction_date < '2024-01-01'
GROUP BY 
    c.Country_Name
ORDER BY 
    total_sent DESC
LIMIT 5;

# Top 5 Countries by Total Received Amount
SELECT 
    c.Country_Name AS country_name,
    ROUND(SUM(t.Transaction_amount), 2) AS total_received
FROM 
    Transactions t
JOIN 
    Users u ON t.Recipient_ID = u.User_ID  -- Critical fix: Join to Users not Merchants
JOIN 
    Countries c ON u.Country_ID = c.Country_ID
WHERE 
    t.Transaction_date >= '2023-10-01' 
    AND t.Transaction_date < '2024-01-01'  -- Proper date range
GROUP BY 
    c.Country_Name
ORDER BY 
    total_received DESC
LIMIT 5;
