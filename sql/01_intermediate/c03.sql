-- For each seller’s origin state, calculate the average time between approval and delivery to the customer.

select
    s.seller_state,
    round(avg(extract(epoch from o.order_delivered_customer_date - o.order_approved_at) / (24 * 60 * 60)), 2) as avg_days_to_deliver
from orders o
join order_items oi on oi.order_id = o.order_id
join sellers s on oi.seller_id = s.seller_id
where order_status = 'delivered'
group by seller_state
order by avg_days_to_deliver desc;
