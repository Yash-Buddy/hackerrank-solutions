SELECT
    transaction_id
FROM (
    SELECT
        transaction_id,
        day,
        amount,
        RANK() OVER(
            PARTITION BY DATE(day)
            ORDER BY amount DESC
        ) AS rnk
    FROM Transactions
) AS t
WHERE rnk = 1
ORDER BY transaction_id ASC;
