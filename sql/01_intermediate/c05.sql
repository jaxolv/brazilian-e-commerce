-- List the product categories with the highest total sales value, excluding freight.

select
    product_category_name,
    sum(price) as total_sales_value_usd
from products p
join order_items oi on oi.product_id = p.product_id
where product_category_name is not null
group by product_category_name
order by sum(price) desc;
