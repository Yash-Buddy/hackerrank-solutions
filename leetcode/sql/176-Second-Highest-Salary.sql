WITH salary_rank AS (
    SELECT
        id,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS sal_rank
    FROM Employee
)
SELECT IFNULL((
    SELECT MIN(salary)
    FROM salary_rank
    WHERE sal_rank = 2
), NULL) AS SecondHighestSalary;
