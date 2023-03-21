SELECT *
FROM (
        SELECT *,
            ROW_NUMBER() OVER(
                PARTITION BY action
                ORDER BY time
            )
        FROM hospital
    )