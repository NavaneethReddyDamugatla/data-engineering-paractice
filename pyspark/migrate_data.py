
spark = SparkSession ...

df = spark.read.csv("s3://bcuket/path" , header=True , inferSchema = True)

df = df.filter(col("salary") >= 50000)

df.write.mode("overwrite").prquet("s3://bucket/path/")