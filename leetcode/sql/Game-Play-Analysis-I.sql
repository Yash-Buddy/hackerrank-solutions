WITH ranked_logins AS (
    SELECT
        player_id,
        device_id,
        RANK() OVER (
            PARTITION BY player_id
            ORDER BY event_date
        ) AS login_rank
    FROM Activity
)
SELECT
    player_id,
    device_id
FROM ranked_logins
WHERE login_rank = 1
ORDER BY player_id;
