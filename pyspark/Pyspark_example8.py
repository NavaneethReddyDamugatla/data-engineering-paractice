orders_df.withColumn("month", date_trunc("month", col("order_date"))) \
    .groupBy("month") \
    .agg(sum("amount").alias("total_sales")) \
    .orderBy("month") \
    .show()