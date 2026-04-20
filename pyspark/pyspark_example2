customer_df.join(orders_df, "customer_id", "left") \
    .filter(orders_df.customer_id.isNull()) \
    .show()