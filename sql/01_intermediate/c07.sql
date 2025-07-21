-- Calculate, for each month, the percentage of orders delivered after the estimated delivery date.

-- Considering group by all the months historic in the dataset:
with cte_delivered_late as (
    select
        count(*) as delivered_orders_after_estimated_date,
        extract(month from order_estimated_delivery_date) as estimated_month
    from orders
    where order_status = 'delivered'
    and order_estimated_delivery_date < order_delivered_customer_date
    group by estimated_month
),
cte_delivered as (
    select
        count(*) as delivered_orders,
        extract(month from order_delivered_customer_date) as delivered_month
    from orders
    where order_status = 'delivered'
    group by delivered_month
)
select
    aed.estimated_month as month,
    round((delivered_orders_after_estimated_date::numeric / delivered_orders) * 100, 2) as delivered_late_percentual
from cte_delivered dor
join cte_delivered_late aed
    on aed.estimated_month = dor.delivered_month
order by month;



-- Considering group month & year:
with cte_estimated as (
    select
        extract(year from order_estimated_delivery_date) as estimated_year,
        extract(month from order_estimated_delivery_date) as estimated_month,
        count(*) as delivered_orders_after_estimated_date
    from orders
    where order_status = 'delivered'
    and order_estimated_delivery_date < order_delivered_customer_date
    group by estimated_month, estimated_year
),
cte_delivered as (
    select
        extract(year from order_delivered_customer_date) as delivered_year,
        extract(month from order_delivered_customer_date) as delivered_month,
        count(*) as delivered_orders
    from orders
    where order_status = 'delivered'
    group by delivered_year, delivered_month
)
select
    e.estimated_year as year,
    e.estimated_month as month,
    round((delivered_orders_after_estimated_date::numeric / delivered_orders) * 100, 2) as delivered_late_percentual
from cte_delivered d
join cte_estimated e
    on d.delivered_month = e.estimated_month
    and d.delivered_year = e.estimated_year
order by year, month;
