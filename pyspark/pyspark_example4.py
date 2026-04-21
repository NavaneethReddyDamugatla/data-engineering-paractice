window_spec = Window.partitionBy("customer_id").orderBy(col("order_date").desc())

customer_df.join(orders_df, "customer_id") \
    .withColumn("rn", row_number().over(window_spec)) \
    .filter(col("rn") == 1) \
    .show()