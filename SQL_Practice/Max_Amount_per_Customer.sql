SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rnk
    FROM orders
)
WHERE rnk = 1;
# we are using the rank() (with gaps) to find the maximum amount for each customer. The subquery assigns a rank to each order based on the amount, partitioned by customer_id. The outer query then filters to return only the orders with a rank of 1, which corresponds to the maximum amount for each customer.