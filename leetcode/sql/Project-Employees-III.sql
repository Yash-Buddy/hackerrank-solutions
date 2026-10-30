SELECT
    t.project_id,
    t.employee_id
FROM (
    SELECT
        p.project_id,
        p.employee_id,
        RANK() OVER (
            PARTITION BY p.project_id
            ORDER BY e.experience_years DESC
        ) AS exp_rank
    FROM Employee AS e
    INNER JOIN Project AS p
        ON e.employee_id = p.employee_id
) AS t
WHERE t.exp_rank = 1
ORDER BY
    t.project_id ASC,
    t.employee_id ASC;
