WITH conf_table AS (
    SELECT s.user_id,
        c.action,
        COUNT(*)
    FROM Signups AS s
        LEFT OUTER JOIN Confirmations AS c ON s.user_id = c.user_id
    GROUP BY s.user_id,
        c.action
)
SELECT *
FROM conf_table