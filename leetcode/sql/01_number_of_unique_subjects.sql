-- Problem: Number of Unique Subjects Taught by Each Teacher
-- Platform: LeetCode

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id
ORDER BY teacher_id ASC;