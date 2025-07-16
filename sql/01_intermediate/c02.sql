-- List the 10 products with the highest average freight value, considering only products with at least 5 sales.

select
    product_id,
    round(sum(freight_value)/count(*), 2) as avg_freight_value
from order_items
group by product_id
having count(*) >= 5
order by avg_freight_value desc
limit 10
