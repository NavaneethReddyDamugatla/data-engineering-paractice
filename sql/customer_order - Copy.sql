SELECT c.name, COUNT(o.order_id) AS order_count
FROM DATA_ENGINEERING.TESTSCHEMA.CUSTOMER c
JOIN DATA_ENGINEERING.TESTSCHEMA.ORDERS o
ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1;