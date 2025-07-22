-- For each year, list the top-selling category by number of products sold (total quantity of order_items).

with cte_ranking_sells_per_year_category as (
    select
        *,
        rank() over( -- RANK allows tied numbers, ROW_NUMBER chooses one to show
            partition by year_delivered
            order by sells desc
        ) as rn
    from (
        select
            extract(year from order_delivered_customer_date) as year_delivered,
            product_category_name,
            count(*) as sells
        from orders o
        join order_items oi on o.order_id = oi.order_id
        join products p on p.product_id = oi.product_id
        where order_delivered_customer_date is not null
        and product_category_name is not null
        and order_status = 'delivered'
        group by year_delivered, product_category_name
    )
)
select
    year_delivered,
    product_category_name,
    sells
from cte_ranking_sells_per_year_category
where rn = 1
