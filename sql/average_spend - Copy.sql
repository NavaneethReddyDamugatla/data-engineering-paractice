SELECT name, total_spend
FROM (
    SELECT c.name,
           SUM(o.amount) AS total_spend
    FROM DATA_ENGINEERING.TESTSCHEMA.CUSTOMER c
    JOIN DATA_ENGINEERING.TESTSCHEMA.ORDERS o
    ON c.customer_id = o.customer_id
    GROUP BY c.name
) t
WHERE total_spend > (
    SELECT AVG(amount) FROM DATA_ENGINEERING.TESTSCHEMA.ORDERS
);