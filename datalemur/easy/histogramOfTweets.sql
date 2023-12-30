WITH histogram_of_tweets AS (
    SELECT COUNT(user_id) AS tweet_bucket
    FROM tweets
    WHERE EXTRACT(
            YEAR
            FROM tweet_date
        ) = 2022
    GROUP BY user_id
)
SELECT tweet_bucket,
    COUNT(tweet_bucket) AS user_num
FROM histogram_of_tweets
GROUP BY tweet_bucket