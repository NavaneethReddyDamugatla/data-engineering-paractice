SELECT *,
       SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM orders;
#we are using the sum() as an aggregation function to calculate the running total of amount for each customer
_id ordered by order_date.