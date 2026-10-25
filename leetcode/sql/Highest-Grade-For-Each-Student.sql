WITH cte AS (
    SELECT
        student_id,
        course_id,
        grade,
        RANK() OVER (
            PARTITION BY student_id
            ORDER BY grade DESC, course_id
        ) AS rnk
    FROM Enrollments
)
SELECT
    student_id,
    course_id,
    grade
FROM cte
WHERE rnk = 1
ORDER BY student_id;
