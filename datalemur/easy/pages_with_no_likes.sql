WITH like_counts AS(
    SELECT page_id,
        COUNT(page_id)
    FROM page_likes
    GROUP BY page_id
)
SELECT p.page_id AS page_id
FROM pages AS p
    LEFT OUTER JOIN like_counts AS L ON p.page_id = l.page_id
WHERE l.page_id IS NULL