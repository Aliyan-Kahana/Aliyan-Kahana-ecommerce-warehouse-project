create database if not exists ecommerce_warehouse;
-- Calculates total sales revenue for each product category and sorts them from highest to lowest.
use ecommerce_warehouse;
SELECT 
     c.category_name,
     SUM(oi.qty * oi.price) AS total_revenue
 FROM order_items oi
 JOIN products p ON oi.product_id = p.product_id
 JOIN categories c ON p.category_id = c.category_id
 GROUP BY c.category_name
 ORDER BY total_revenue DESC;
--  Counts how many orders were placed each month to show seasonal trends over time.
SELECT 
     DATE_FORMAT(order_date, '%Y-%m') AS order_month,
     COUNT(order_id) AS total_orders
 FROM orders
 GROUP BY order_month
 ORDER BY order_month ASC;
-- Connects stores to payments to see which city generates the most gross revenu
SELECT 
    s.city,
    SUM(p.amount) AS city_revenue
FROM orders o
JOIN stores s ON o.store_id = s.store_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY s.city
ORDER BY city_revenue DESC;
--  Which specific products move the highest total volume of units across all orders?
SELECT 
    product_id,
    SUM(qty) AS total_units_sold
FROM order_items
GROUP BY product_id
ORDER BY total_units_sold DESC
LIMIT 5;
-- What is the operational breakdown of delivery statuses (delivered, late, shipped) across the warehouse network?
SELECT 
    status,
    COUNT(shipment_id) AS total_shipments
FROM shipments
GROUP BY status
ORDER BY total_shipments DESC;
-- What is the average employee compensation across different store locations?
SELECT 
    store_id,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY store_id
ORDER BY average_salary DESC;