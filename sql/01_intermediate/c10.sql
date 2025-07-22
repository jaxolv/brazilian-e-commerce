-- Identify the 10 cities with the highest number of unique customers and, for each, report the average ticket and average review score.

select
    concat(customer_city, ', ', customer_state) as customer_city_state,
    count(distinct customer_unique_id) as customers_unique_id,
    round(avg(payment_value), 2) as avg_ticket,
    round(avg(review_score), 2) as avg_review_score
from customers c
join orders o on o.customer_id = c.customer_id
join order_payments op on op.order_id = o.order_id
join order_reviews ore on ore.order_id = o.order_id
group by customer_city, customer_state
order by customers_unique_id desc
limit 10;
