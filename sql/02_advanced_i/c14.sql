-- Calculate the average review score per product category and sort from best to worst.
select
    product_category_name,
    round(avg(review_score), 2) as avg_review_score
from products p
join order_items oi on oi.product_id = p.product_id
join order_reviews ore on ore.order_id = oi.order_id
where product_category_name is not null
group by product_category_name
order by avg_review_score desc;
