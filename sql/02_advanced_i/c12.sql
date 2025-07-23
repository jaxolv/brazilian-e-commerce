-- List orders with multiple sellers and calculate the total order value and the number of sellers involved.

with cte_sellers_per_order as (
    select
        order_id,
        count(distinct seller_id) as sellers
    from order_items oi
    group by order_id
)
select
    spo.order_id,
    sellers,
    sum(payment_value) as total_value
from cte_sellers_per_order spo
join order_payments op on op.order_id = spo.order_id
where sellers > 1
group by spo.order_id, sellers
order by total_value desc;