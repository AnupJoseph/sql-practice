WITH conf_table AS (
    SELECT s.user_id AS id,
        COUNT(*) as count
    FROM Signups AS s
        LEFT OUTER JOIN Confirmations AS c ON s.user_id = c.user_id
    WHERE c.action = 'confirmed'
    GROUP BY s.user_id,
        c.action
)
SELECT *
FROM Signups AS sp
    LEFT JOIN conf_table AS cf ON sp.user_id = cf.id