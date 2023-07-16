WITH working_table AS(
    SELECT id,
        temperature - LAG(temperature, 1) OVER (
            ORDER BY recordDate
        ) AS lagged_temperature
    FROM Weather
)
SELECT id
FROM working_table
WHERE lagged_temperature > 0