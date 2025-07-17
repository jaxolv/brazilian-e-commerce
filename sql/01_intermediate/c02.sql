-- List the 10 products with the highest average freight value, considering only products with at least 5 sales.

select
    oi.product_id,
    product_category_name,
    round(sum(oi.freight_value) / count(*), 2) as avg_freight_value
from order_items oi
join products p on oi.product_id = p.product_id
group by oi.product_id, product_category_name
having count(*) >= 5
order by avg_freight_value desc
limit 10;
