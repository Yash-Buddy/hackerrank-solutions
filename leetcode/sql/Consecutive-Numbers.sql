-- LeetCode 180: Consecutive Numbers

SELECT DISTINCT A.num AS ConsecutiveNums
FROM Logs A
JOIN Logs B
    ON A.id = B.id - 1
JOIN Logs C
    ON B.id = C.id - 1
WHERE A.num = B.num
  AND B.num = C.num;
