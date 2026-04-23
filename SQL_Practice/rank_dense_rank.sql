SELECT *,
       RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rnk,
       DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS drnk
FROM orders;
# we are using the rank()(with gaps) and dense_rank()(without gaps) for same rank for same values.