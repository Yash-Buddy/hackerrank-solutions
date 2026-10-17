-- LeetCode 197: Rising Temperature

SELECT w1.id
FROM Weather w1
JOIN Weather w2
    ON date(w1.recordDate, '-1 day') = w2.recordDate
WHERE w1.temperature > w2.temperature;

