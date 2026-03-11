-- CREATE database olist;

USE olist;
SHOW TABLES;

select *
from master;

-- Query 1 — Top 10 Revenue States.

SELECT customer_state, 
       ROUND(SUM(payment_value), 2) AS total_revenue,
       COUNT(DISTINCT order_id) AS total_orders
FROM master
GROUP BY customer_state
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 2 — Best Selling Categories:

SELECT product_category_name_english,
       ROUND(SUM(payment_value), 2) AS revenue,
       COUNT(DISTINCT order_id) AS total_orders
FROM master
GROUP BY product_category_name_english
ORDER BY revenue DESC
LIMIT 10;

-- Query 3 — Average Delivery Time per State:

SELECT customer_state,
       ROUND(AVG(DATEDIFF(order_delivered_customer_date, 
                          order_purchase_timestamp)), 1) AS avg_delivery_days
FROM master
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY customer_state
ORDER BY avg_delivery_days ASC
LIMIT 10;

-- Query 4 — Champion Customers:
SELECT customer_id, 
       Recency, 
       Frequency, 
       ROUND(Monetary, 2) AS total_spent,
       Segment
FROM rfm
WHERE Segment = 'Champion '
ORDER BY Monetary DESC
LIMIT 10;

select distinct Segment from rfm;