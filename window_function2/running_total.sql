SELECT c.name,
       o.order_date,
       o.amount,
       SUM(o.amount) OVER (PARTITION BY c.customer_id ORDER BY o.order_date) AS running_total
FROM DATA_ENGINEERING.TESTSCHEMA.CUSTOMER c
JOIN DATA_ENGINEERING.TESTSCHEMA.ORDERS o
ON c.customer_id = o.customer_id;