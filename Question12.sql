-- Analyze the cumulative revenue generated over time.

select order_date,
round(sum(total_rev) over(order by order_date),2) as cum_revenue
from
(select o.order_date,sum(od.quantity*p.price) as total_rev from orders o
join order_details od on o.order_id = od.order_id
join pizzas p on od.pizza_id = p.pizza_id
group by o.order_date) as sales;