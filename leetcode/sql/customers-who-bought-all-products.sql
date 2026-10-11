-- LeetCode: Customers Who Bought All Products
-- Approach: GROUP BY, HAVING, COUNT, DISTINCT

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*)
    FROM Product
)
ORDER BY customer_id;
