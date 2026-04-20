SELECT DATE_TRUNC('MONTH', order_date) AS month,
       SUM(amount) AS total_sales
FROM DATA_ENGINEERING.TESTSCHEMA.ORDERS
GROUP BY month
ORDER BY month;