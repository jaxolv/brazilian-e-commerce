-- For each customer, calculate the average time between their orders (considering only customers with at least 3 orders).

with cte_count_distinct_orders as (
    select
        customer_unique_id,
        count(order_purchase_timestamp) as num_orders
    from orders o
    join customers c on c.customer_id = o.customer_id
    group by customer_unique_id
), cte_timestamp_order as (
    select 
        customer_unique_id,
        order_purchase_timestamp
    from orders o
    join customers c on c.customer_id = o.customer_id
    order by customer_unique_id
), cte_previous_purchase_date as (
    select
        cdo.customer_unique_id,
        order_purchase_timestamp,
        num_orders,
        lag(order_purchase_timestamp) over(
            partition by cdo.customer_unique_id
            order by order_purchase_timestamp
        ) as previous_purchase_date
    from cte_count_distinct_orders cdo
    join cte_timestamp_order tor on tor.customer_unique_id = cdo.customer_unique_id
    order by customer_unique_id, order_purchase_timestamp
)
select
    customer_unique_id,
    num_orders,
    round(
        avg(
            extract (
                epoch from (
                    order_purchase_timestamp - previous_purchase_date
                )
            ) / (60 * 60 * 24)
        ), 2
    ) as avg_days_for_purchase
from cte_previous_purchase_date
where num_orders >= 3
group by customer_unique_id, num_orders
order by avg_days_for_purchase desc;
