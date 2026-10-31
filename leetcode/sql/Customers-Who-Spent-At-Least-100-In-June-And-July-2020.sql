WITH MonthlySpending AS (
    SELECT
        o.customer_id,
        strftime('%Y-%m', o.order_date) AS order_month,
        SUM(p.price * o.quantity) AS total_spent
    FROM Orders o
    JOIN Product p
        ON o.product_id = p.product_id
    WHERE o.order_date BETWEEN '2020-06-01' AND '2020-07-31'
    GROUP BY
        o.customer_id,
        strftime('%Y-%m', o.order_date)
    HAVING SUM(p.price * o.quantity) >= 100
),

QualifiedCustomers AS (
    SELECT customer_id
    FROM MonthlySpending
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_month) = 2
)

SELECT
    c.customer_id,
    c.name
FROM Customers c
JOIN QualifiedCustomers qc
    ON c.customer_id = qc.customer_id;
