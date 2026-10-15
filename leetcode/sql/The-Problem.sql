-- Problem: The Problem (HackerRank)
-- Goal:
-- 1. Find each student's grade using their marks.
-- 2. Hide names for students with grades below 8.
-- 3. Sort grades in descending order.
-- 4. For grades 8-10, sort names alphabetically.
-- 5. For grades below 8, sort marks in ascending order.

SELECT
    -- Hide the student's name when the grade is below 8.
    CASE
        WHEN g.grade < 8 THEN NULL
        ELSE s.name
    END AS Name,

    g.grade,
    s.marks

FROM students s

-- Match each student's marks to the correct grade range.
JOIN grades g
    ON s.marks BETWEEN g.min_mark AND g.max_mark

-- Apply the required sorting rules.
ORDER BY
    -- Higher grades first.
    g.grade DESC,

    -- For grades 8-10, sort names alphabetically.
    CASE
        WHEN g.grade >= 8 THEN s.name
    END ASC,

    -- For grades below 8, sort marks from lowest to highest.
    CASE
        WHEN g.grade < 8 THEN s.marks
    END ASC;
