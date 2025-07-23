These challenges can be read in English: [Leia em Português :brazil:](/sql/DESAFIOS.md)

# SQL Challenges – Brazilian E-Commerce Dataset (Kaggle)

This document presents 30 SQL challenges based on the Brazilian e-commerce dataset by Olist, structured across three difficulty levels (Mid to Senior), focused on analytical queries involving multiple tables, filters, metrics, and temporal logic.

The challenges are divided into 3 parts:
|Level|Challenges|
|-|-|
|[Intermediate II](#intermediate-ii)|1 - 10|
|[Advanced I](#advanced-i)|11 - 20|
|[Advanced II](#advanced-ii)|21 - 30|

---

### Intermediate II

1. [x] Calculate the average ticket per customer, considering only customers from São Paulo (state). [(Resolution)](/sql/01_intermediate/c01.sql)
2. [x] List vthe 10 products with the highest average freight value, considering only products with at least 5 sales. [(Resolution)](/sql/01_intermediate/c02.sql) 
3. [x] For each seller’s origin state, calculate the average time between approval and delivery to the customer. [(Resolution)](/sql/01_intermediate/c03.sql)
4. [x] Create a “logistics efficiency” metric per seller city, defined as: (average time between approval and delivery) / (difference in ZIP code prefixes between seller and customer). [(Resolution)](/sql/01_intermediate/c04.sql)
5. [x] List the product categories with the highest total sales value, excluding freight. [(Resolution)](/sql/01_intermediate/c05.sql)
6. [x] For each payment type, calculate the average value per installment (payment_value / payment_installments). [(Resolution)](/sql/01_intermediate/c06.sql)
7. [x] Calculate, for each month, the percentage of orders delivered after the estimated delivery date. [(Resolution)](/sql/01_intermediate/c07.sql)
8. [x] List the customers who made orders with more than one type of payment in a single order. [(Resolution)](/sql/01_intermediate/c08.sql)
9. [x] For each product category, calculate the proportion of orders with a 5-star rating relative to the total. [(Resolution)](/sql/01_intermediate/c09.sql)
10. [x] Identify the 10 cities with the highest number of unique customers and, for each, report the average ticket and average review score. [(Resolution)](/sql/01_intermediate/c10.sql)

---

### Advanced I

11. [x] For each year, list the top-selling category by number of products sold (total quantity of order_items). [(Resolution)](/sql/02_advanced_i/c11.sql)
12. [x] List orders with multiple sellers and calculate the total order value and the number of sellers involved. [(Resolution)](/sql/02_advanced_i/c12.sql)
13. [x] For each state, calculate the average delay in days between customer delivery and the estimated date, considering only late deliveries. [(Resolution)](/sql/02_advanced_i/c13.sql)
14. [ ] Calculate the average review score per product category and sort from best to worst.
15. [ ] For each customer, calculate the average time between their orders (considering only customers with at least 3 orders).
16. [ ] List the 10 products with the highest return rate, defined as: number of 1-star reviews / total orders of the product.
17. [ ] Create a “logistics cost per product” metric, defined as: (average freight of the product / average weight of the product).
18. [ ] For each payment type, calculate the total amount moved and the average number of installments per order.
19. [ ] List orders that were delivered even before the approval date (possible system errors).
20. [ ] For each seller, calculate the average order value considering only those with a 5-star review.

---

### Advanced II

21. [ ] Identify the categories that had sales growth (total quantity of items sold) for 3 consecutive months. List the category and the months in which this occurred.
22. [ ] For each customer who made at least 3 purchases, identify whether their total spending increased with each order. List these customers and their respective values.
23. [ ] List the states where the average delivery time improved each consecutive year (for at least 3 years).
24. [ ] For each seller, identify the years in which they sold products in at least 4 distinct categories.
25. [ ] Create a customer loyalty index, defined as: number of orders with the same seller / total number of orders. List customers with an index above 0.8.  
26. [ ] Identify the 5 product categories with the highest percentage growth in 5-star reviews over the last 12 months of the dataset.
27. [ ] List the products whose average rating went from below 3 to above 4 in two consecutive years.
28. [ ] For each delivery city, determine whether the average delivery time decreased consistently each semester for at least 3 consecutive semesters.
29. [ ] List the sellers who increased their average sale value per item for 3 consecutive quarters.
30. [ ] Create an annual ranking of cities with the best logistics performance, defined as: (on-time deliveries / total orders). Show the top 3 per year.
