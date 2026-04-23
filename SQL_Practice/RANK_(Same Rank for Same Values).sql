SELECT *,
       RANK() OVER (ORDER BY amount DESC) AS rnk
FROM orders;
#we are using the rank() (with gaps) for same rank for same
value.