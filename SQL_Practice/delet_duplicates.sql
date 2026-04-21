-- DELETE DUPLICATE RECORDS IN SQL
-- Customer Table Sample Data:
-- customer_id | name    | city
-- 1           | Ravi    | Hyderabad
-- 2           | Kiran   | Bangalore
-- 3           | Anil    | Chennai
-- 1           | Ravi    | Hyderabad       (DUPLICATE)
-- 2           | Kiran   | Bangalore       (DUPLICATE)
-- 1           | Ravi    | HYDERABAD       (DUPLICATE - case difference)
-- etc.

-- ============================================
-- METHOD 1: Using CTE with ROW_NUMBER() - BEST APPROACH
-- ============================================
-- This keeps the first occurrence and deletes all duplicates
DELETE FROM customer
WHERE (customer_id, name, city) IN (
    SELECT customer_id, name, city
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY customer_id, name, city ORDER BY rowid) as rn
        FROM customer
    ) t
    WHERE rn > 1
);

-- ============================================
-- METHOD 2: Using NOT IN with MIN() - Alternative Approach
-- ============================================
-- Keep rows with minimum row ID for each customer
DELETE FROM customer
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM customer
    GROUP BY customer_id, name, city
);

-- ============================================
-- METHOD 3: Using NOT EXISTS - Another Alternative
-- ============================================
DELETE FROM customer c1
WHERE EXISTS (
    SELECT 1
    FROM customer c2
    WHERE c1.customer_id = c2.customer_id
      AND c1.name = c2.name
      AND c1.city = c2.city
      AND c1.rowid > c2.rowid
);

-- ============================================
-- METHOD 4: For CASE-INSENSITIVE Duplicates
-- ============================================
-- If case differences should be treated as duplicates (Hyderabad = HYDERABAD)
DELETE FROM customer
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM customer
    GROUP BY customer_id, LOWER(name), LOWER(city)
);

-- ============================================
-- STEP 1: VIEW DUPLICATES BEFORE DELETING
-- ============================================
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY customer_id, name, city ORDER BY rowid) as duplicate_count
FROM customer
ORDER BY customer_id;

-- ============================================
-- STEP 2: CREATE BACKUP BEFORE DELETING
-- ============================================
CREATE TABLE customer_backup AS
SELECT * FROM customer;

-- ============================================
-- STEP 3: DELETE DUPLICATES (Use Method 1, 2, or 3)
-- ============================================
-- Choose one method based on your database and requirements

-- ============================================
-- STEP 4: VERIFY RESULTS
-- ============================================
SELECT *
FROM customer
ORDER BY customer_id;

-- ============================================
-- EXPECTED RESULT:
-- ============================================
-- customer_id | name    | city
-- 1           | Ravi    | Hyderabad
-- 2           | Kiran   | Bangalore
-- 3           | Anil    | Chennai
-- 4           | Suresh  | Mumbai
-- 5           | Mahesh  | Pune
