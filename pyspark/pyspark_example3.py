df = customer_df.join(orders_df, "customer_id") \
    .groupBy("customer_id", "name") \
    .agg(sum("amount").alias("total_spend"))

window_spec = Window.orderBy(col("total_spend").desc())

df.withColumn("rank", rank().over(window_spec)) \
  .filter(col("rank") == 1) \
  .show()