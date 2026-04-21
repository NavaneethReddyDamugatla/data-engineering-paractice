window_spec = Window.orderBy(col("amount").desc())

orders_df.withColumn("rank", dense_rank().over(window_spec)) \
    .filter(col("rank") == 2) \
    .show()
    