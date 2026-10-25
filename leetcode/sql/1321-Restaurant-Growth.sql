WITH daily_amount AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
),
ordered_days AS (
    SELECT
        visited_on,
        amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM daily_amount
),
rolling_window AS (
    SELECT
        a.visited_on,
        SUM(b.amount) AS amount,
        ROUND(AVG(b.amount * 1.0), 2) AS average_amount
    FROM ordered_days a
    JOIN ordered_days b
        ON b.rn BETWEEN a.rn - 6 AND a.rn
    GROUP BY a.visited_on
    HAVING COUNT(b.visited_on) = 7
)
SELECT *
FROM rolling_window
ORDER BY visited_on;
