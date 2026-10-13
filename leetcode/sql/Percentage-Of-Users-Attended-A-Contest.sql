WITH TotalUsers AS (
    SELECT COUNT(*) AS total_users
    FROM Users
),
ContestUsers AS (
    SELECT
        contest_id,
        COUNT(user_id) AS registered_users
    FROM Register
    GROUP BY contest_id
)
SELECT
    c.contest_id,
    ROUND(c.registered_users * 100.0 / t.total_users, 2) AS percentage
FROM ContestUsers c
CROSS JOIN TotalUsers t
ORDER BY percentage DESC, c.contest_id ASC;