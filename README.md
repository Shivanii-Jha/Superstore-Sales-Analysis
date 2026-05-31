# Superstore Sales Analysis Dashboard

## Project Overview
End-to-end data analytics project analyzing 9,800+ sales records 
from a US retail superstore. Built a complete data pipeline from 
raw CSV to PostgreSQL database to interactive Power BI dashboard.

## Tools & Technologies
- **Database:** PostgreSQL
- **Programming:** Python (Pandas, SQLAlchemy, psycopg2)
- **Visualization:** Power BI (DAX measures, slicers)
- **Data Source:** Superstore Sales Dataset (Kaggle)

## Key Business Insights
- West region leads revenue at $710K — South underperforms at $389K
- Technology is top category at $827K revenue
- Sales grew 50% from 2015 ($479K) to 2018 ($722K)
- Sean Miller is highest value customer at $25K total purchases
- 76% of customers prefer Standard Class shipping

## Project Architecture
CSV Data → Python (Pandas) → PostgreSQL → Power BI Dashboard

## Dashboard Features
- 3 KPI Cards: Total Sales, Total Orders, Average Order Value
- Regional Sales Performance (Bar Chart)
- Sales Distribution by Category (Donut Chart)
- Top 10 Customers by Revenue (Table)
- Monthly Sales Trend 2015-2018 (Line Chart)
- Interactive slicers for Region and Date filtering
- DAX measures for Total Sales, Total Orders, Avg Order Value

## SQL Analysis
10 business queries written in PostgreSQL covering:
- Regional and category performance
- Year-over-year growth using LAG window function
- 3-month moving average using ROWS BETWEEN
- Customer retention analysis using subqueries and CASE WHEN
- Customer segment analysis with DISTINCT counts

## Files
- `superstore_queries.sql` — All 10 PostgreSQL queries
- `Superstore_Sales_Dashboard.pbix` — Power BI dashboard file

## Dashboard Preview
![Superstore Dashboard](dashboard.png)
