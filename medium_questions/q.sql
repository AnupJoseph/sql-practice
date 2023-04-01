WITH starts AS (
    SELECT ROW_NUMBER() OVER(
            ORDER BY phone_number
        ) AS id,
        *
    FROM call_start_logs
),
ends AS (
    SELECT ROW_NUMBER() OVER(
            ORDER BY phone_number
        ) AS id,
        *
    FROM call_end_logs
)
SELECT ends.end_time - starts.start_time
FROM ends
    INNER JOIN starts ON ends.id = starts.id