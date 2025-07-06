
# Kultra Mega Stores SQL Analysis
This project contains SQL queries used to analyze order and shipping data for Kultra Mega Stores.

## Objectives
- Analyze sales, shipping costs, and returns
- Find top-performing categories and regions
- Understand inefficiencies in logistics

## Files Included
- DSA capstone -  https://github.com/Benedicta2003/KMS-SQL-Analysis/blob/main/DSA%20Data%20Analysis%20Capstone%20Project.pdf
- `queries.sql` – All SQL queries used for analysis  https://github.com/Benedicta2003/KMS-SQL-Analysis/blob/main/DSA%20SQL%20PROJECT%20QUERY.sql

## Tools Used
- SQL Server

## 🔍 Recommendations

Based on the insights gathered from the SQL analysis of Kultra Mega Stores' orders and shipping data:

1. **Optimize shipping costs for low-priority orders**
   - 28 low-priority orders were shipped using Express Air, the most expensive shipping method.
   - This suggests a mismatch in shipping policies.
   - Recommendation: Reserve Express Air for critical/high-priority orders, and use ground shipping for low-priority orders to reduce costs.

2. **Improve alignment between shipping mode and order priority**
   - Some high-priority orders were shipped using slow methods (e.g., Delivery Truck).
   - Recommendation: Create a rule-based logistics system that automatically selects fast shipping for high-priority items.

3. **Analyze return patterns by shipping method**
   - Certain shipping methods had higher return rates.
   - Recommendation: Investigate if packaging, delays, or product type is leading to increased returns with specific carriers.

4. **Focus marketing on top-performing product categories**
   - Categories like [Technology] had the highest total sales.
   - Recommendation: Increase inventory and promotions in these categories to drive more revenue.

5. **Review underperforming regions**
   - Regions with low sales or high shipping cost per order should be examined.
   -  Recommendation: Adjust pricing, marketing, or distribution center support in those areas

  

---

Created as part of the DSA Capstone Project.

## File Description
- `kultra_ksa_analysis.sql`: All SQL queries written for the project  https://github.com/Benedicta2003/KMS-SQL-Analysis/blob/main/DSA%20SQL%20PROJECT%20QUERY.sql
