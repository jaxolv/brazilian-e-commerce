-- For each state, calculate the average delay in days between customer delivery and the estimated date, considering only late deliveries.

-- DAYS AS AN INTEGER FORMAT:
select
    customer_state,
    round(
        avg(
            extract(
                day from (order_delivered_customer_date - order_estimated_delivery_date)
            )
        ), 2
    ) as avg_days_late
from orders o
join customers c on c.customer_id = o.customer_id
where order_delivered_customer_date > order_estimated_delivery_date
group by customer_state
order by avg_days_late desc;

-- DAYS AS DOUBLE FORMAT
-- (CONVERTING SECONDS IN DAYS, MORE PRECISION)
select
    customer_state,
    round(
        avg(
            extract(
                epoch from (order_delivered_customer_date - order_estimated_delivery_date) / (60 * 60 * 24)
            )
        ), 2
    ) as avg_days_late
from orders o
join customers c on c.customer_id = o.customer_id
where order_delivered_customer_date > order_estimated_delivery_date
group by customer_state
order by avg_days_late desc;

-- COMPARING THE DIFFERENCE BETWEEN THE TWO FORMATS (INTEGER DAYS x FRACTIONAL DAYS/EPOCH)
with cte_extract_days as (
    select
        customer_state,
        round(avg(extract(day from (order_delivered_customer_date - order_estimated_delivery_date))), 2) as avg_days_late
    from orders o
    join customers c on c.customer_id = o.customer_id
    where order_delivered_customer_date > order_estimated_delivery_date
    group by customer_state
), cte_extract_epoch as (
    select
        customer_state,
        round(avg(extract(epoch from (order_delivered_customer_date - order_estimated_delivery_date) / (60 * 60 * 24))), 2) as avg_days_late
    from orders o
    join customers c on c.customer_id = o.customer_id
    where order_delivered_customer_date > order_estimated_delivery_date
    group by customer_state
)
select
    round(avg(e.avg_days_late - d.avg_days_late), 2) as avg_difference_between_formats,
    round(avg(e.avg_days_late - d.avg_days_late), 2) * 24 as equivalent_hours
from cte_extract_days d
join cte_extract_epoch e on e.customer_state = d.customer_state

-- It's prefferable to use the EPOCH function to extract the days in a double format to more precision, since the average of delay in hours represents 2/3 of a day, this is a really long time.
