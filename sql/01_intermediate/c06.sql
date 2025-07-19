-- For each payment type, calculate the average value per installment (payment_value / payment_installments)

select
    payment_type,
    round(avg(payment_value / payment_installments), 2) as avg_value_installment
from order_payments
where payment_installments > 0
group by payment_type;
