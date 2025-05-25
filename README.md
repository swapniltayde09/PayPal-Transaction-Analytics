# PayPal Data-Driven Platform Optimization Strategy using SQL

## 📊 Project Overview
SQL analysis of PayPal's transaction data to optimize:
- Market strategies
- Risk management 
- Merchant performance
- Customer engagement

## 🛠️ Technical Details
- **Tools**: MySQL, Git
- **Methods**: Complex joins, CTEs, window functions, date filtering
- **Key Skills**: Financial analysis, data modeling, SQL optimization

## 📁 Project Structure
📁 dataset/                   -- Sample data or schema files  
📁 problem statements/         -- All SQL queries categorized by problem  
📁 outputs/                    -- Query result samples or exports 
README.md                     -- Project documentation  

## 🔍 Sample Output or Results 
### 📊 Sample Insights
- 💸 U.S. is the top transaction sender and receiver in Q4 2023  
- 🏆 Only 3 merchants earned over $50,000 monthly consistently  
- 🌍 Most transactions are domestic, reducing compliance risk

### ✅ Testing & Validation
- Cross-verified aggregate metrics with sample subsets
- Used COUNT(*) vs SUM() validations for joins

### 🔧 Prerequisites
- MySQL 8+
- Data schema from `/data/paypal_transactions.sql`

## 🚀 How to Use
1. Set up schema: `mysql < data/paypal_transactions.sql`
2. Run queries: `mysql < queries/[query_name].sql`

---

## 🛡️ License

This project is licensed under the [MIT License](./LICENSE.md).

You are free to use, modify, and distribute this project for personal or commercial purposes, provided proper attribution is given.
