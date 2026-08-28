-- 1. Show completed orders

SELECT *
FROM Orders
WHERE status = 'Completed';


-- 2. Calculate revenue for each order item

SELECT
    oi.order_id,
    p.product_name,
    oi.quantity,
    p.price,
    oi.discount,
    p.price * oi.quantity * (1 - oi.discount / 100) AS revenue
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed';


-- 3. Calculate total revenue

SELECT
    SUM(p.price * oi.quantity * (1 - oi.discount / 100)) AS total_revenue
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed';


-- 4. Revenue by category

SELECT
    p.category,
    SUM(p.price * oi.quantity * (1 - oi.discount / 100)) AS revenue
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY revenue DESC;


-- 5. Top-selling products

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.product_name
ORDER BY units_sold DESC;


-- 6. Top customers by spending

SELECT
    c.customer_name,
    SUM(
        p.price * oi.quantity * (1 - oi.discount / 100)
    ) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;


-- 7. Average Order Value

SELECT
    SUM(p.price * oi.quantity * (1 - oi.discount / 100))
    / COUNT(DISTINCT o.order_id) AS average_order_value
FROM Orders o
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed';


-- 8. Cancellation rate

SELECT
    COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) * 100.0
    / COUNT(*) AS cancellation_rate
FROM Orders;


-- 9. Monthly revenue

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * oi.quantity * (1 - oi.discount / 100)) AS revenue
FROM Orders o
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY month
ORDER BY month;


-- 10. Customers who spent more than 30,000

WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(
            p.price * oi.quantity * (1 - oi.discount / 100)
        ) AS total_spent
    FROM Customers c
    JOIN Orders o
        ON c.customer_id = o.customer_id
    JOIN Order_Items oi
        ON o.order_id = oi.order_id
    JOIN Products p
        ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, c.customer_name
)

SELECT *
FROM customer_sales
WHERE total_spent > 30000;


-- 11. Rank customers by spending

WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(
            p.price * oi.quantity * (1 - oi.discount / 100)
        ) AS total_spent
    FROM Customers c
    JOIN Orders o
        ON c.customer_id = o.customer_id
    JOIN Order_Items oi
        ON o.order_id = oi.order_id
    JOIN Products p
        ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, c.customer_name
)

SELECT
    customer_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
FROM customer_sales;


-- 12. Find repeat customers

SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1;