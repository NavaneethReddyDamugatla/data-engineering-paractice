customer_df.join(orders_df, "customer_id") \
    .groupBy("customer_id", "name") \
    .agg(sum("amount").alias("total_spend")) \
    .show()