-- Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(od.order_details_id) AS order_count
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY order_count DESC;