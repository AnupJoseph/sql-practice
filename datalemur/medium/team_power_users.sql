SELECT sender_id,
    COUNT(*) AS message_count
FROM messages
WHERE DATE_PART('month', sent_date) = 8
    AND DATE_PART('year', sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;