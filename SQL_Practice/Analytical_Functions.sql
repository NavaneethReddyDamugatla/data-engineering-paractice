SELECT *,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
FROM orders;
# we are using the row_number () for Unique Rank