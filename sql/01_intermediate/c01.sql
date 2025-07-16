-- Calculate the average ticket per customer, considering only customers from São Paulo (state).

with cte_customer_total as (
    select
        o.customer_id,
        avg(tv.total) as average_value
    from (
        select
            order_id,
            sum(payment_value) as total
        from order_payments
        group by order_id, payment_sequential
    ) as tv
    join orders o on tv.order_id = o.order_id
    group by o.customer_id
)
select
    c.customer_id,
    round(average_value, 2)
from cte_customer_total ct
join customers c on c.customer_id = ct.customer_id
where c.customer_state = 'SP'
