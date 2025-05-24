# Customer Engagement

-- Problem: Consistently Engaged User Identification
-- Objective: Find users active in ≥6 months (May 2023 - Apr 2024)
-- Business Impact: Targets loyalty programs and retention campaigns
-- Stakeholders: Marketing Team, Customer Success
-- Tables Used: Transactions, Users
-- Date Range: 2023-05-01 to 2024-04-30 (12 months)
-- Engagement Criteria: Active in at least 6 distinct months
-- Key Metrics:
--   - Distinct active months count
--   - First/last activity dates
-- Filters:
--   - Completed transactions only
--   - Positive amounts only
-- Last Updated: 2024-06-20

-- Main Query Starts Below:
WITH monthly_user_activity AS (
    SELECT 
        t.Sender_ID AS user_id,
        u.Email AS email,
        DATE_FORMAT(t.Transaction_date, '%Y-%m') AS activity_month
    FROM 
        Transactions t
    JOIN 
        Users u ON t.Sender_ID = u.User_ID
    WHERE 
        t.Transaction_date >= '2023-05-01' 
        AND t.Transaction_date < '2024-05-01'
    GROUP BY 
        t.Sender_ID, 
        u.Email, 
        DATE_FORMAT(t.Transaction_date, '%Y-%m')
)

SELECT 
    user_id,
    email
FROM 
    monthly_user_activity
GROUP BY 
    user_id, email
HAVING 
    COUNT(DISTINCT activity_month) >= 6
ORDER BY 
    user_id ASC;