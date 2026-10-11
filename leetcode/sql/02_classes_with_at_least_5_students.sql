– Problem: Classes With at Least 5 Students
– Platform: LeetCode

SELECT
class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
