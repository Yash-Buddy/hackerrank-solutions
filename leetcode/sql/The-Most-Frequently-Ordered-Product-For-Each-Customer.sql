WITH product_counts AS (
    SELECT
        customer_id,
        product_id,
        COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_id, product_id
),

ranked_products AS (
    SELECT
        customer_id,
        product_id,
        order_count,
        DENSE_RANK() OVER (
            PARTITION BY customer_id
            ORDER BY order_count DESC
        ) AS rnk
    FROM product_counts
)

SELECT
    rp.customer_id,
    rp.product_id,
    p.product_name
FROM ranked_products rp
JOIN Products p
    ON rp.product_id = p.product_id
WHERE rp.rnk = 1
ORDER BY rp.customer_id, rp.product_id;
