WITH ranked_sales AS (
    SELECT
        sale_date,
        fruit,
        sold_num,
        COUNT(*) OVER (PARTITION BY sale_date) AS fruit_count,
        LAG(sold_num) OVER (
            PARTITION BY sale_date
            ORDER BY fruit
        ) AS prev_sold_num
    FROM Sales
),
diffs AS (
    SELECT
        sale_date,
        CASE
            WHEN fruit = 'oranges' THEN prev_sold_num - sold_num
        END AS diff
    FROM ranked_sales
    WHERE fruit_count = 2
)
SELECT sale_date, diff
FROM diffs
WHERE diff IS NOT NULL
ORDER BY sale_date;
