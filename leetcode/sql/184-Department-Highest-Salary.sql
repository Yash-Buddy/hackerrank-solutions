SELECT
    Department.name AS 'Department',
    RankedEmployees.name AS 'Employee',
    RankedEmployees.Salary
FROM (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY DepartmentId
            ORDER BY Salary DESC
        ) AS salary_rank
    FROM Employee
) AS RankedEmployees
JOIN Department
    ON RankedEmployees.DepartmentId = Department.Id
WHERE salary_rank = 1
ORDER BY
    Department.name ASC,
    RankedEmployees.name ASC;
