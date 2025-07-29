-- Create a “logistics cost per product” metric, defined as: (average weight of the product / average freight of the product).

select
    p.product_id,
    round(avg(product_weight_g)::numeric / nullif(avg(freight_value), 0), 2)
from products p
join order_items oi on oi.product_id = p.product_id
group by p.product_id;
