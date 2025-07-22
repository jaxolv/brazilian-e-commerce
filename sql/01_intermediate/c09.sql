-- For each product category, calculate the proportion of orders with a 5-star rating relative to the total.

with cte_all_reviews as (
    select
        product_category_name,
        count(review_score) as all_reviews
    from order_items oi
    join products p on oi.product_id = p.product_id
    join order_reviews ore on ore.order_id = oi.order_id
    group by product_category_name
), cte_reviews_five_stars as (
    select
        product_category_name,
        count(review_score) as five_stars_reviews
    from order_items oi
    join products p on oi.product_id = p.product_id
    join order_reviews ore on ore.order_id = oi.order_id
    where review_score = 5
    group by product_category_name
)
select
    ar.product_category_name,
    round((five_stars_reviews::numeric / all_reviews) * 100, 2) as five_stars_reviews_percent
from cte_all_reviews ar
join cte_reviews_five_stars rfs on rfs.product_category_name = ar.product_category_name
order by five_stars_reviews_percent desc;

-- USING SUBQUERIES INSTEAD OF CTEs
select
    A.product_category_name,
    round((five_stars_reviews::numeric / all_reviews) * 100, 2) as five_stars_reviews_percent
from (
    select
        product_category_name,
        count(review_score) as all_reviews
    from order_items oi
    join products p on oi.product_id = p.product_id
    join order_reviews ore on ore.order_id = oi.order_id
    group by product_category_name
) A
join (
    select
        product_category_name,
        count(review_score) as five_stars_reviews
    from order_items oi
    join products p on oi.product_id = p.product_id
    join order_reviews ore on ore.order_id = oi.order_id
    where review_score = 5
    group by product_category_name
) B
    on B.product_category_name = A.product_category_name
order by five_stars_reviews_percent desc;
