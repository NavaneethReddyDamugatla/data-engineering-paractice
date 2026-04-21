window_spec = Window.partitionBy("customer_id").orderBy(col("amount").desc())

orders_df.withColumn("rn", row_number().over(window_spec)) \
    .filter(col("rn") <= 2) \
    .show()