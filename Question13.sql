-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name,revenue from
(select category,name,revenue,rank()over(partition by category order by revenue desc) as rn
from
(select pt.category,pt.name, sum(od.quantity*p.price) as revenue from order_details od
join pizzas p on od.pizza_id = p.pizza_id
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
group by pt.category,pt.name) as a) as b
where rn <= 3;