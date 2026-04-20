from pyspark.sql import SparkSession

# Instantiate Spark Session
spark = SparkSession.builder \
    .appName("DataEngineeringPractice") \
    .master("local[*]") \
    .config("spark.sql.shuffle.partitions", "200") \
    .config("spark.executor.memory", "4g") \
    .config("spark.driver.memory", "2g") \
    .getOrCreate()

# Enable verbose logging
spark.sparkContext.setLogLevel("INFO")

print("Spark Session initialized successfully!")
print(f"Spark Version: {spark.version}")
print(f"App Name: {spark.appName}")
print(f"Master: {spark.sparkContext.master}")

# Example: Create a simple DataFrame
if __name__ == "__main__":
    data = [("John", 28, 50000), ("Jane", 34, 65000), ("Bob", 45, 75000)]
    columns = ["Name", "Age", "Salary"]
    
    df = spark.createDataFrame(data, columns)
    df.show()
    
    # Stop Spark Session when done
    # spark.stop()
