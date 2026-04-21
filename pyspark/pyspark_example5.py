window_spec = Window.partitionBy("customer_id").orderBy("order_date")

customer_df.join(orders_df, "customer_id") \
    .withColumn("running_total", sum("amount").over(window_spec)) \
    .show()
    