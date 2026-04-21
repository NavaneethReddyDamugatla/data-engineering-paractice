SELECT *
FROM (
    SELECT c.name,
           o.order_id,
           o.order_date,
           o.amount,
           ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY o.order_date DESC) AS rn
    FROM DATA_ENGINEERING.TESTSCHEMA.CUSTOMER c
    JOIN DATA_ENGINEERING.TESTSCHEMA.ORDERS o
    ON c.customer_id = o.customer_id
)
WHERE rn = 1;