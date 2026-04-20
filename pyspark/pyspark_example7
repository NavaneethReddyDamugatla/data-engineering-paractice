customer_df.join(orders_df, "customer_id") \
    .groupBy("customer_id", "name") \
    .agg(count("order_id").alias("order_count")) \
    .filter(col("order_count") > 1) \
    .show()