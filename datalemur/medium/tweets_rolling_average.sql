SELECT user_id,
    tweet_date,
    AVG(tweet_count) OVER(
        ORDER BY tweet_date ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_3d
FROM tweets