-- Create a “logistics efficiency” metric per seller city, defined as: (average time between approval and delivery) / (difference in ZIP code prefixes between seller and customer).

with cte_logistics_efficiency as (
    select
        s.seller_city,
        round( -- considering time between approval and delivery as MINUTES
            avg(extract(epoch from (o.order_delivered_customer_date - o.order_approved_at) / 60) / nullif(abs(s.seller_zip_code_prefix - c.customer_zip_code_prefix), 0)), 2
        ) as logistics_efficiency
    from orders o
    join order_items oi on oi.order_id = o.order_id
    join sellers s on s.seller_id = oi.seller_id
    join customers c on o.customer_id = c.customer_id
    where order_status = 'delivered'
    group by s.seller_city
)
select
    seller_city,
    logistics_efficiency
from cte_logistics_efficiency
where logistics_efficiency is not null
order by logistics_efficiency desc;
