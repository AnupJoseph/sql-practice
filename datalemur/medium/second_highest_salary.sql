SELECT salary
FROM (
        SELECT salary,
            ROW_NUMBER() OVER (
                ORDER BY salary DESC
            ) AS r
        FROM employee
    ) AS s
WHERE r = 2;
-- Alternative
SELECT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1