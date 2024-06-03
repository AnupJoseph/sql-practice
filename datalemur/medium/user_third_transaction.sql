SELECT user_id,
    spend,
    transaction_date
FROM (
        SELECT ROW_NUMBER() OVER (
                PARTITION BY user_id
                ORDER BY transaction_date DESC
            ) AS row_num,
            user_id,
            spend,
            transaction_date
        FROM transactions
    ) t
WHERE row_num = 3