SELECT DISTINCT c.title
FROM TVProgram p
JOIN Content c
    ON p.content_id = c.content_id
WHERE c.Kids_content = 'Y'
    AND c.content_type = 'Movies'
    AND p.program_date >= '2020-06-01'
    AND p.program_date < '2020-07-01';
