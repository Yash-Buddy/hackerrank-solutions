WITH tb1 AS (
    SELECT 
        log_id AS id, 
        log_id - RANK() OVER (ORDER BY log_id) AS r
    FROM Logs
)

SELECT 
    MIN(tb1.id) AS start_id, 
    MAX(tb1.id) AS end_id  
FROM tb1
GROUP BY r
ORDER BY start_id;
