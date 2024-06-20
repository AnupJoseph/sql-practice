SELECT ag.age_bucket,
    ROUND(
        SUM(
            CASE
                WHEN act.activity_type = 'send' THEN act.time_spent
                ELSE 0
            END
        ) * 100.0 / SUM(act.time_spent),
        2
    ) AS send_perc,
    ROUND(
        SUM(
            CASE
                WHEN act.activity_type = 'open' THEN act.time_spent
                ELSE 0
            END
        ) * 100.0 / SUM(act.time_spent),
        2
    ) AS open_perc
FROM activities as act
    INNER JOIN age_breakdown AS ag ON act.user_id = ag.user_id
WHERE act.activity_type IN ('open', 'send')
GROUP BY ag.age_bucket