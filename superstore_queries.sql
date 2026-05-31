-- Query 1: Regional Sales Performance
SELECT region,
       ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- Query 2: Sales by Category
SELECT category,
       ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Query 3: Top 10 Customers
SELECT customer_name,
       ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Query 4: Monthly Sales Trend
SELECT DATE_TRUNC('month', order_date) AS month,
       ROUND(SUM(sales)::numeric, 2) AS monthly_sales
FROM superstore
GROUP BY month
ORDER BY month;

-- Query 5: Ship Mode Analysis
SELECT ship_mode,
       COUNT(*) AS total_orders
FROM superstore
GROUP BY ship_mode
ORDER BY total_orders DESC;

-- Query 6: Year over Year Growth
SELECT EXTRACT(YEAR FROM order_date) AS year,
       ROUND(SUM(sales)::numeric, 2) AS total_sales,
       ROUND(SUM(sales)::numeric - LAG(SUM(sales)::numeric) 
       OVER (ORDER BY EXTRACT(YEAR FROM order_date)), 2) AS yoy_growth
FROM superstore
GROUP BY year
ORDER BY year;

-- Query 7: Top 5 Sub-Categories
SELECT sub_category,
       ROUND(SUM(sales)::numeric, 2) AS total_sales,
       COUNT(*) AS total_orders
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 5;

-- Query 8: Customer Segment Analysis
SELECT segment,
       ROUND(SUM(sales)::numeric, 2) AS total_sales,
       COUNT(DISTINCT customer_id) AS total_customers,
       ROUND(SUM(sales)::numeric / COUNT(DISTINCT customer_id), 2) AS avg_sales_per_customer
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

-- Query 9: 3-Month Moving Average
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(sales)::numeric, 2) AS monthly_sales,
    ROUND(AVG(SUM(sales)::numeric) 
    OVER (ORDER BY DATE_TRUNC('month', order_date) 
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3month
FROM superstore
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- Query 10: Customer Retention Analysis
SELECT 
    first_order_year,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 
          THEN customer_id END) AS returning_customers,
    ROUND(COUNT(DISTINCT CASE WHEN order_count > 1 
          THEN customer_id END) * 100.0 / 
          COUNT(DISTINCT customer_id), 2) AS retention_rate
FROM (
    SELECT 
        customer_id,
        MIN(EXTRACT(YEAR FROM order_date)) AS first_order_year,
        COUNT(DISTINCT order_id) AS order_count
    FROM superstore
    GROUP BY customer_id
) AS customer_summary
GROUP BY first_order_year
ORDER BY first_order_year;