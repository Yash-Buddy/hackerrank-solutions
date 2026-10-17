SELECT
    ROUND(
        (
            SELECT COUNT(DISTINCT a.player_id)
            FROM Activity AS a
            JOIN (
                SELECT
                    player_id,
                    MIN(event_date) AS first_login
                FROM Activity
                GROUP BY player_id
            ) AS first_logins
                ON a.player_id = first_logins.player_id
                AND a.event_date = DATE(first_logins.first_login, '+1 day')
        ) * 1.0 /
        (
            SELECT COUNT(DISTINCT player_id)
            FROM Activity
        ),
        2
    ) AS fraction