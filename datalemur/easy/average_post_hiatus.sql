SELECT user_id,
    EXTRACT(
        DAY
        FROM MAX(post_date) - MIN(post_date)
    ) AS days_between
FROM posts
GROUP BY user_id
HAVING EXTRACT(
        DAY
        FROM MAX(post_date) - MIN(post_date)
    ) > 0