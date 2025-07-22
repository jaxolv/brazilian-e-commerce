-- List the customers who made orders with more than one type of payment in a single order.

select
    customer_id
from (
    select
        order_id
    from order_payments
    group by order_id
    having count(distinct payment_type) >= 2
) mto
join orders o on o.order_id = mto.order_id;
