SELECT
    CASE
        WHEN id = (SELECT COUNT(*) FROM Seat)
             AND MOD(id, 2) = 1
        THEN id
        WHEN MOD(id, 2) = 1
        THEN id + 1
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id;
