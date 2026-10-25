SELECT 
    name AS customer_name,
    customer_id,
    order_id,
    order_date
FROM (
    SELECT 
        o.order_id,
        o.order_date,
        o.customer_id,
        c.name,
        DENSE_RANK() OVER (
            PARTITION BY c.customer_id 
            ORDER BY o.order_date DESC
        ) AS rnk
    FROM Orders o
    JOIN Customers c
        USING (customer_id)
) AS ranked_orders
WHERE rnk <= 3
ORDER BY 
    customer_name ASC,
    customer_id ASC,
    order_date DESC;
