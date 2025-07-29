-- List the 10 products with the highest return rate, defined as: number of 1-star reviews / total orders of the product.
select
    oso.product_id,
    count_one_star_review,
    count_all_orders,
    round(count_one_star_review::numeric / count_all_orders, 2) * 100 as perc_return_rate
from (
        select
            pr.product_id,
            count(review_score) as count_one_star_review
        from order_reviews r
        join order_items oi on oi.order_id = r.order_id
        join products pr on pr.product_id = oi.product_id
        where review_score = 1
        group by pr.product_id
    ) oso
    join (
        select
            pr.product_id,
            count(oi.order_id) as count_all_orders
        from order_reviews r
        join order_items oi on oi.order_id = r.order_id
        join products pr on pr.product_id = oi.product_id
        group by pr.product_id
    ) ao on oso.product_id = ao.product_id
order by perc_return_rate desc, count_all_orders desc
limit 10;
