WITH cte AS (
    SELECT 
        user_id,
        visit_date,
        LEAD(visit_date, 1) OVER (
            PARTITION BY user_id
            ORDER BY visit_date
        ) AS next_visit
    FROM user_visits
),
cte2 AS (
    SELECT 
        user_id,
        visit_date,
        COALESCE(next_visit, '2021-01-01') AS dt
    FROM cte
)
SELECT 
    user_id,
    MAX(julianday(dt) - julianday(visit_date)) AS biggest_window
FROM cte2
GROUP BY user_id
ORDER BY user_id;
