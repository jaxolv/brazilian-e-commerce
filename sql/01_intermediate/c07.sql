-- Calculate, for each month, the percentage of orders delivered after the estimated delivery date.

-- Considering group only by month and not month & year:
with cte_delivered_orders_after_estimated_date as (
    select
        count(*) as delivered_orders_after_estimated_date,
        extract(month from order_estimated_delivery_date) as estimated_month
    from orders
    where order_status = 'delivered'
    and order_estimated_delivery_date < order_delivered_customer_date
    group by estimated_month
)
select
    aed.estimated_month as month,
    round((delivered_orders_after_estimated_date::numeric / delivered_orders) * 100, 2) as delivered_late_percentual
from (
    select
        count(*) as delivered_orders,
        extract(month from order_estimated_delivery_date) as delivered_month
    from orders
    where order_status = 'delivered'
    group by delivered_month
) dor
join cte_delivered_orders_after_estimated_date aed on aed.estimated_month = dor.delivered_month
order by month;
